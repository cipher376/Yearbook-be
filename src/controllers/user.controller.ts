import {authenticate, AuthenticationBindings} from '@loopback/authentication';
import {authorize} from '@loopback/authorization';
import {inject} from '@loopback/core';
import {
  CountSchema,
  Filter,
  FilterExcludingWhere, repository,
  Where
} from '@loopback/repository';
import {
  get,
  getJsonSchemaRef, getModelSchemaRef, HttpErrors, param,
  patch, post,
  requestBody
} from '@loopback/rest';
import {UserProfile} from '@loopback/security';
import * as casbin from 'casbin';
import _ from 'lodash';
import {uid} from 'uid';
import {ACL_USER} from '../acls';
import {PasswordHasherBindings, RESET_REQUEST_TYPE, TokenServiceBindings, UserServiceBindings} from '../keys';
import {User} from '../models';
import {PasswordRepository, ResetRequestRepository, UserConfigRepository, UserRepository} from '../repositories';
import {validateCredentials} from '../services';
import {BcryptHasher} from '../services/hash.password';
import {Credentials, MyJWTService, MyUserService} from '../services/jwt-authentication';
import {MyMailerBindings} from '../services/mailing/keys';
import {OPERATION_SECURITY_SPEC} from '../utils/security-spec';
import {OPERATION_STATE} from './../keys';
import {Password} from './../models/password.model';
import {ResetRequest} from './../models/reset-request.model';
import {PhotoRepository} from './../repositories/photo.repository';
import {CasbinDbEnforcer} from './../services/casbin-authorization/casbin.enforcers';
import {EmailMessage, MyMailer} from './../services/mailing/nodemail.service';



const applyFilter = require('loopback-filters');

class SignUpData {
  email: string;
  firstName: string;
  lastName: string;
  otherName: string;
  password: string;
}

export class UserController {
  enforcer: Promise<casbin.Enforcer>;

  constructor(
    @repository(UserRepository)
    public userRepository: UserRepository,

    // @inject('service.hasher')
    @inject(PasswordHasherBindings.PASSWORD_HASHER)
    public hasher: BcryptHasher,

    // @inject('service.user.service')
    @inject(UserServiceBindings.USER_SERVICE)
    public userService: MyUserService,

    // @inject('service.jwt.service')
    @inject(TokenServiceBindings.TOKEN_SERVICE)
    public jwtService: MyJWTService,

    @repository(PhotoRepository)
    public photoRepository: PhotoRepository,

    @repository(UserConfigRepository)
    public userConfigRepository: UserConfigRepository,

    @repository(PasswordRepository)
    public passwordRepository: PasswordRepository,

    @repository(ResetRequestRepository)
    public resetRequestRepository: ResetRequestRepository,

    @inject(MyMailerBindings.MY_MAILER_SERVICE)
    public myMailerService: MyMailer,

    @inject('casbin.enforcer.factory')
    private enforcerService: CasbinDbEnforcer,
  ) {
    this.enforcer = enforcerService.enforcerFactory();
    console.log("My enforcerService")
  }



  @post('/signup', {
    responses: {
      '200': {
        description: 'User',
        content: {
          schema: getJsonSchemaRef(SignUpData)
        }
      }
    }
  })
  async signup(@requestBody() userData: SignUpData) {
    validateCredentials(_.pick(userData as any, ['email', 'phone', 'password']));
    // check if user exist
    const isUser = await this.userService.userExist(_.pick(userData as any, ['email', 'phone', 'password']));

    // console.log(userData)
    if (isUser) {
      // prevent registration
      throw new HttpErrors.Conflict('Email or Phone is taken!')
    }
    // save password hash
    const hash = await this.hasher.hashPassword((userData as any).password as string);
    const user = new User();
    user.firstName = userData.firstName;
    user.lastName = userData.lastName;
    user.otherName = userData.otherName;
    user.email = userData.email;
    const savedUser = await this.userRepository.create(user);


    const password = {
      hash,
      dateCreated: (new Date(Date.now())).toDateString(),
      dateModified: (new Date(Date.now())).toDateString(),
      userId: savedUser.id as number,
      modifiedBy: savedUser.id as number
    } as Password;

    if ((await this.passwordRepository.create(password)).id) {
      // update user policies
      (await this.enforcer).addGroupingPolicy(...[`u${savedUser?.id}`, 'authUser']).then(_ => {
      }).catch(error => {
        console.debug(error);
      })
    }
    return savedUser;
  }




  @post('/login', {
    responses: {
      '200': {
        description: 'Token',
        content: {
          'application/json': {
            schema: {
              type: 'object',
              properties: {
                token: {
                  type: 'string'
                }
              }
            }
          }
        }
      }
    }
  })
  async login(
    @requestBody() credentials: Credentials,
  ): Promise<{token: string}> {
    validateCredentials(_.pick(credentials, ['email', 'phone', 'password']));

    // make sure user exist,password should be valid
    const user = await this.userService.verifyCredentials(credentials).catch(error => console.log(error));
    if (!user) {
      throw new HttpErrors.Unauthorized('Invalid email or password');
    }
    // console.log(user);
    const userProfile = this.userService.convertToUserProfile(user as User);
    // console.log(userProfile);

    const token = await this.jwtService.generateToken(userProfile);

    // check if user is deactivated
    const config = await this.userConfigRepository.findOne({
      where: {
        action: 'AccountDeactivation',
        userId: user?.id ?? userProfile?.id
      }
    });
    if (config) {
      throw new HttpErrors.Locked('Account deactivated');
    } else {
      return Promise.resolve({token: token});
    }
  }



  @get('/logout', {
    security: OPERATION_SECURITY_SPEC,
    responses: {
      '200': {
        description: 'The current user profile',
        content: {
          'application/json': {
            schema: getJsonSchemaRef(User),
          },
        },
      },
    },
  })
  @authenticate("jwt")
  async logout(
    @inject(AuthenticationBindings.CURRENT_USER)
    currentUser: UserProfile,
  ): Promise<UserProfile> {
    // this.jwtService.expiresSecret;
    currentUser.password = undefined;
    return Promise.resolve(currentUser);
  }


  @get('/users/me', {
    security: OPERATION_SECURITY_SPEC,
    responses: {
      '200': {
        description: 'The current user profile',
        content: {
          'application/json': {
            schema: getJsonSchemaRef(User),
          },
        },
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_USER['me'])
  async me(
    @inject(AuthenticationBindings.CURRENT_USER)
    currentUser: UserProfile,
  ): Promise<UserProfile> {
    currentUser.password = undefined;
    return Promise.resolve(currentUser);
  }

  @get('/users/my-profile', {
    security: OPERATION_SECURITY_SPEC,
    responses: {
      '200': {
        description: 'The current user profile',
        content: {
          'application/json': {
            schema: getJsonSchemaRef(User),
          },
        },
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_USER['my-profile'])
  async myProfile(
    @inject(AuthenticationBindings.CURRENT_USER)
    currentUser: UserProfile,
  ): Promise<User> {
    // clear the sensitive fields
    const user = await this.findById(currentUser.id);

    // gather other user related information
    await this.userRepository.photos(currentUser.id).find().then(ph => {
      user.photos = ph;
    }, error => {
      console.debug(error);
    });
    await this.userRepository.userConfigs(currentUser.id).find().then(config => {
      user.userConfigs = config
    }, error => {
      console.debug(error);
    })

    await this.userRepository.address(currentUser.id).get().then(add => {
      user.address = add;
    }, error => {
      console.debug(error);
    })
    return Promise.resolve(user);
  }


  // @patch('/users', {
  //   responses: {
  //     '200': {
  //       description: 'User PATCH success count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async updateAll(
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(User, {partial: true}),
  //       },
  //     },
  //   })
  //   user: User,
  //   @param.where(User) where?: Where<User>,
  // ): Promise<Count> {
  //   return this.userRepository.updateAll(user, where);
  // }

  @get('/users/{id}', {
    responses: {
      '200': {
        description: 'User model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(User, {includeRelations: true}),
          },
        },
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_USER['find-by-id'])
  async findById(
    @param.path.number('id') id: number,
    @param.filter(User, {exclude: 'where'}) filter?: FilterExcludingWhere<User>
  ): Promise<User> {
    const user: User = await this.userRepository.findById(id, filter);
    return Promise.resolve(this.userService.convertToUserView(user));
  }



  @patch('/users/{id}', {
    responses: {
      '204': {
        description: 'User PATCH success',
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_USER['update-by-id'])
  async updateById(
    @param.path.number('id') id: number,
    @inject(AuthenticationBindings.CURRENT_USER)
    currentUser: UserProfile,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(User, {partial: true}),
        },
      },
    })
    user: User,
  ): Promise<User> {
    // console.log(currentUser)
    // clear the sensitive fields
    const returnUser = await this.userService.updateUser(id, user, currentUser.id);
    return returnUser;
  }

  // @put('/users/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'User PUT success',
  //     },
  //   },
  // })
  // async replaceById(
  //   @param.path.number('id') id: number,
  //   @requestBody() user: User,
  // ): Promise<void> {
  //   await this.userRepository.replaceById(id, user);
  // }

  // @del('/users/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'User DELETE success',
  //     },
  //   },
  // })
  // async deleteById(@param.path.number('id') id: number): Promise<void> {
  //   await this.userRepository.deleteById(id);
  // }




  // searching the database and return users that
  // match the searched word. if type-ahead TP is set, it will return
  // only 5 of the search results else 20 or any number you have already set

  @get('/users-search/{searchKey}', {
    responses: {
      '200': {
        description: 'Array of User model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(User, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_USER['list-all'])
  async searchExtensive(
    @param.path.string('searchKey') searchKey: string,
    @param.filter(User) filter?: Filter<User>,
  ): Promise<User[]> {

    let users: User[] = await this.userRepository.find({
      include: [{
        relation: 'address',
      },
      {
        relation: 'photos',
        scope: {
          where: {
            or: [{profile: true}, {flag: true}, {coverImage: true}]
          }
        }
      },
      ]
    });

    if (searchKey === 'all') {
      return applyFilter(users, filter);
    }

    const keys: string[] = [];
    let tempKeys: string[] = [];
    let foundUsers: {user: User, score: number}[] = [];


    // build keys or search terms
    tempKeys = searchKey.split(' ');
    tempKeys.push(searchKey);

    // remove duplicates
    keys.push(searchKey);
    tempKeys.forEach(key => {
      key = key.toLowerCase().trim();
      if (!keys.includes(key)) {
        keys.push(key);
      }
    })
    console.log(filter);

    users.forEach(user => {
      const foundUser: {user: User, score: number} = {user: user, score: 0};
      for (const key of keys) {
        if (user?.firstName?.toLowerCase()?.trim()?.search(key) > -1) {
          foundUser.score += 6;
        }
        if (user?.lastName?.toLowerCase()?.trim()?.search(key) > -1) {
          foundUser.score += 6;
        }
        if ((user?.otherName) ?? ''.toLowerCase()?.trim()?.search(key) > -1) {
          foundUser.score += 6;
        }
        if ((user?.nickName) ?? ''.toLowerCase()?.trim()?.search(key) > -1) {
          foundUser.score += 4.0;
        }
        if (user?.phone?.toLowerCase()?.trim()?.search(key) > -1) {
          foundUser.score += 5.9;
        }
        if (user?.email?.toLowerCase()?.trim()?.search(key) > -1) {
          foundUser.score += 6;
        }
        if ((user?.address?.latLng ?? '')?.toLowerCase().trim().search(key) > -1) {
          foundUser.score += 5.8;
        }
        if (user?.address?.street?.toLowerCase().trim().search(key) > -1) {
          foundUser.score += 4.3;
        }
        if (user?.address?.suburb?.toLowerCase().trim().search(key) > -1) {
          foundUser.score += 4.3;
        }
        if (user?.address?.city?.toLowerCase().trim().search(key) > -1) {
          foundUser.score += 4.3;
        }
        if (user?.address?.state?.toLowerCase().trim().search(key) > -1) {
          foundUser.score += 3.9;
        }
        if (user?.address?.country?.toLowerCase().trim().search(key) > -1) {
          foundUser.score += 3.9;
        }
        if (user?.address?.postcode?.toLowerCase().trim().search(key) > -1) {
          foundUser.score += 3.9;
        }

        if ((user?.gender) ?? ''.toLowerCase().trim().search(key) > -1) {
          foundUser.score += 3.1;
        }
      }

      // check if user had a score
      if (foundUser.score > 0) {
        foundUsers.push(foundUser);
      }

      foundUsers = foundUsers.sort((us1, us2) => {
        if (us1.score < us2.score) {
          return 1;
        } else if (us1.score > us2.score) {
          return -1;
        } else {
          return 0; // equall
        }
      });
    })
    // applying filter to allow paging from front end
    users = [];
    foundUsers = applyFilter(foundUsers, filter);
    foundUsers.forEach(fs => {
      users.push(fs.user);
    })
    return users;

  }



  ////////////////////ADMIN ENDPOINTS//////////////////////////

  @get('/users/count', {
    responses: {
      '200': {
        description: 'User model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_USER['count'])
  async count(
    @param.where(User) where?: Where<User>,
  ): Promise<number> {
    return (await this.userRepository.count(where)).count
  }

  @get('/users', {
    responses: {
      '200': {
        description: 'Array of User model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(User, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_USER['list-all'])
  async find(
    @param.filter(User) filter?: Filter<User>,
  ): Promise<User[]> {
    if (!filter) {
      filter = {
        include: [
          {relation: 'photos'},
          {relation: 'address'},
          {relation: 'userConfigs'},

        ]
      }
    }
    // console.log(filter);
    const users = await this.userService.getUsers(filter);


    return users;
  }


  @post('/create-many', {
    responses: {
      '200': {
        description: 'User',
        content: {
          'application/json': {
            type: 'object'
          },
        },
      }
    }
  })
  @authenticate("jwt")
  @authorize(ACL_USER['create-many'])
  async createMany(
    @requestBody({
      content: {
        'application/json': {
          schema: {
            type: 'array',
            "items": getModelSchemaRef(User, {includeRelations: false})
          }
        },
      },
    }) users: SignUpData[]) {
    console.log(users);
    const res: number[] = [];
    const errors: string[] = [];
    for (const u of users) {
      try {
        validateCredentials(_.pick(u as any, ['email', 'phone', 'password']));
        // check if user exist
        const isUser = await this.userService.userExist(_.pick(u as any, ['email', 'phone', 'password']));

        // console.log(userData)
        if (isUser) {
          // prevent registration
          throw new HttpErrors.Conflict('Email or Phone is taken!')
        }
        const hash = await this.hasher.hashPassword((u as any).password as string)

        const user = new User();
        user.firstName = u.firstName;
        user.lastName = u.lastName;
        user.otherName = u.otherName;
        user.email = u.email;
        const savedUser = await this.userRepository.create(user);

        // save password hash
        const password = {
          hash,
          dateCreated: (new Date(Date.now())).toDateString(),
          dateModified: (new Date(Date.now())).toDateString(),
          userId: savedUser.id as number,
          modifiedBy: savedUser.id as number
        } as Password;

        if ((await this.passwordRepository.create(password)).id) {
          // update user policies
          (await this.enforcer).addGroupingPolicy(...[`u${savedUser?.id}`, 'authUser']).then(_ => {
          }).catch(error => {
            console.debug(error);
          })
        }

        res.push(savedUser.id as number);

      } catch (error) {
        errors.push(error);
      }
    }
    return {res, errors};
  }

  @get('/users/clear-profile-photos/{id}', {
    responses: {
      '204': {
        description: 'User PATCH success',
      },
    },
  })
  @authenticate("jwt")
  async clearUserProfilePhotos(
    @param.path.number('id') id: number,
    @inject(AuthenticationBindings.CURRENT_USER)
    currentUser: UserProfile,
  ) {
    if (id !== currentUser?.id) { // owner ship
      return;
    }
    await this.photoRepository.updateAll({profile: false}, {userId: currentUser?.id}).catch(er => {
      console.log(er);
    })
    return
  }

  /*******************************************************************
   ************* RESETS AND AUTHENTICATION****************************
   *******************************************************************/
  /***
   * change password
   */
  @post('/users/change-password', {
    responses: {
      '204': {
        description: 'User PATCH success',
      },
    },
  })
  async changePassword(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(String, {partial: true}),
        },
      },
    })
    passObject: {password: string, token: string}
  ): Promise<boolean> {
    // console.log(JSON.stringify(passObject))
    // validate token
    const reset = await this.resetRequestRepository.findOne({where: {resetToken: passObject.token}});
    if (reset?.id) {
      // validation is true
      // check for expiry
      // console.log(reset.dateCreated);
      const startTime = new Date(reset.dateCreated);
      const now = new Date(Date.now());
      // console.log(startTime);
      // console.log(now);

      // calculate the elapsed time in minutes
      let diff = (now.getTime() - startTime.getTime()) / 1000;
      diff /= 60;
      const elapsedTime = Math.abs(Math.round(diff)) // time in minutes
      // console.log(elapsedTime);
      // console.log(reset.expiredTimeInMin);

      if (reset.expiredTimeInMin < elapsedTime) {
        // token has expired
        console.log('Password has expired')
        return false;
      }

      // update and save the reset object
      reset.dateModified = new Date(Date.now()).toISOString();
      reset.state = OPERATION_STATE.success


      // Now change the password
      const password = await this.passwordRepository.findOne({where: {userId: reset.userId}});
      if (!password) {
        // User does not exit
        console.log('User does not exist')

        return false;
      }

      // console.log(password)
      // hash the new password
      const hash = await this.hasher.hashPassword(passObject.password);
      password.hash = hash;
      // console.log(password)


      //update the password
      await this.passwordRepository.updateById(password.id, password);

      // update reset state
      reset.expiredTimeInMin = (reset.expiredTimeInMin - elapsedTime); // help to control the number of retries
      await this.resetRequestRepository.updateById(reset.id, reset);
      return true;
    }
    console.log('Invalid token!')

    return false;
  }


  /***********************************************************
  ******************Request password reset********************
  ************************************************************/

  @post('/users/reset-password', {
    responses: {
      '201': {
        description: 'User PATCH success',
      },
    },
  })
  async resetPassword(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(SignUpData, {partial: true}),
        },
      },
    })
    data: SignUpData,
  ): Promise<boolean> {
    // clear the sensitive fields
    const token = uid(128);
    console.log(token);
    console.log(data.email);
    const user = await this.userRepository.findOne({where: {email: data.email}});
    if (user) {
      let reset = new ResetRequest();
      reset.requestType = RESET_REQUEST_TYPE.password;
      reset.dateCreated = new Date(Date.now()).toISOString();
      reset.dateModified = new Date(Date.now()).toISOString();
      reset.expiredTimeInMin = 30 // in minutes
      reset.resetToken = token;
      reset.userId = user.id as number;
      reset.state = OPERATION_STATE.pending;
      reset = await this.resetRequestRepository.create(reset);
      console.log(reset);
      const resetUrl = `http://almamater.devtek-limited.tech/change-password/${token}`;
      // send reset link to email
      const resetEmail: EmailMessage = {
        from: "antiamoah890@gmail.com",
        to: data.email, //"bar@example.com, baz@example.com"
        subject: 'Password reset link',
        text: `Copy this link and paste in your browser: ${resetUrl}`,
        html: `<div><a href="${resetUrl}" target="_">Reset password</a></div>

        <html>

<head>
  <title>Alma mater password reset</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <style type="text/css">
    /* FONTS */
    @media screen {
      @font-face {
        font-family: 'Lato';
        font-style: normal;
        font-weight: 400;
        src: local('Lato Regular'), local('Lato-Regular'), url(https://fonts.gstatic.com/s/lato/v11/qIIYRU-oROkIk8vfvxw6QvesZW2xOQ-xsNqO47m55DA.woff) format('woff');
      }

      @font-face {
        font-family: 'Lato';
        font-style: normal;
        font-weight: 700;
        src: local('Lato Bold'), local('Lato-Bold'), url(https://fonts.gstatic.com/s/lato/v11/qdgUG4U09HnJwhYI-uK18wLUuEpTyoUstqEm5AMlJo4.woff) format('woff');
      }

      @font-face {
        font-family: 'Lato';
        font-style: italic;
        font-weight: 400;
        src: local('Lato Italic'), local('Lato-Italic'), url(https://fonts.gstatic.com/s/lato/v11/RYyZNoeFgb0l7W3Vu1aSWOvvDin1pK8aKteLpeZ5c0A.woff) format('woff');
      }

      @font-face {
        font-family: 'Lato';
        font-style: italic;
        font-weight: 700;
        src: local('Lato Bold Italic'), local('Lato-BoldItalic'), url(https://fonts.gstatic.com/s/lato/v11/HkF_qI1x_noxlxhrhMQYELO3LdcAZYWl9Si6vvxL-qU.woff) format('woff');
      }
    }

    /* CLIENT-SPECIFIC STYLES */
    body,
    table,
    td,
    a {
      -webkit-text-size-adjust: 100%;
      -ms-text-size-adjust: 100%;
    }

    table,
    td {
      mso-table-lspace: 0pt;
      mso-table-rspace: 0pt;
    }

    img {
      -ms-interpolation-mode: bicubic;
    }

    /* RESET STYLES */
    img {
      border: 0;
      height: auto;
      line-height: 100%;
      outline: none;
      text-decoration: none;
    }

    table {
      border-collapse: collapse !important;
    }

    body {
      height: 100% !important;
      margin: 0 !important;
      padding: 0 !important;
      width: 100% !important;
    }

    /* iOS BLUE LINKS */
    a[x-apple-data-detectors] {
      color: inherit !important;
      text-decoration: none !important;
      font-size: inherit !important;
      font-family: inherit !important;
      font-weight: inherit !important;
      line-height: inherit !important;
    }

    /* ANDROID CENTER FIX */
    div[style*="margin: 16px 0;"] {
      margin: 0 !important;
    }

  </style>
</head>

<body style="background-color: #f4f4f4; margin: 0 !important; padding: 0 !important;">

  <!-- HIDDEN PREHEADER TEXT -->
  <div
    style="display: none; font-size: 1px; color: #fefefe; line-height: 1px; font-family: 'Lato', Helvetica, Arial, sans-serif; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden;">
    Looks like your account needs verification.
  </div>

  <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <!-- LOGO -->
    <tr>
      <td bgcolor="#ff431a" align="center">
        <table border="0" cellpadding="0" cellspacing="0" width="480">
          <tr>
            <td align="center" valign="top" style="padding: 40px 10px 40px 10px;">
              <a href="#" target="_blank">
                <img alt="Logo" src="http://yearbook-api.devtek-limited.tech:8085/media/download/almamater_white.svg" width="300" height="100"
                  style="display: block;  font-family: 'Lato', Helvetica, Arial, sans-serif; color: #ffffff; font-size: 18px;"
                  border="0">
              </a>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <!-- HERO -->
    <tr>
      <td bgcolor="#ff431a" align="center" style="padding: 0px 10px 0px 10px;">
        <table border="0" cellpadding="0" cellspacing="0" width="480">
          <tr>
            <td bgcolor="#ffffff" align="center" valign="top"
              style="padding: 40px 20px 20px 20px; border-radius: 4px 4px 0px 0px; color: #111111; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 48px; font-weight: 400; letter-spacing: 4px; line-height: 48px;">
              <h1 style="font-size: 32px; font-weight: 400; margin: 0;">Want to reset your password?</h1>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <!-- COPY BLOCK -->
    <tr>
      <td bgcolor="#f4f4f4" align="center" style="padding: 0px 10px 0px 10px;">
        <table border="0" cellpadding="0" cellspacing="0" width="480">
          <!-- COPY -->
          <tr>
            <td bgcolor="#ffffff" align="left"
              style="padding: 20px 30px 40px 30px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;">
              <p style="margin: 0;">Click the link below to reset the password.</p>
            </td>
          </tr>
          <!-- BULLETPROOF BUTTON -->
          <tr>
            <td bgcolor="#ffffff" align="left">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td bgcolor="#ffffff" align="center" style="padding: 20px 30px 60px 30px;">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td align="center" style="border-radius: 3px;" bgcolor="#ff431a">
                          <a href="${resetUrl}" target="_blank"
                            style="font-size: 20px; font-family: Helvetica, Arial, sans-serif; color: #ffffff; text-decoration: none; color: #ffffff; text-decoration: none; padding: 15px 25px; border-radius: 2px; border: 1px solid #ff431a; display: inline-block;">
                            Reset Password
                          </a>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>

    <!-- COPY CALLOUT -->
    <tr>
      <td bgcolor="#f4f4f4" align="center" style="padding: 0px 10px 0px 10px;">
        <table border="0" cellpadding="0" cellspacing="0" width="480">
          <!-- HEADLINE -->
          <tr>
            <td bgcolor="#36384A" align="left"
              style="padding: 40px 30px 20px 30px; color: #ffffff; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;">
              <h2 style="font-size: 24px; font-weight: 400; margin: 0;">Unable to click on the button above?</h2>
            </td>
          </tr>
          <tr>
            <td bgcolor="#36384A" align="left"
              style="padding: 0px 30px 20px 30px; color: #979BB4; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;">
              <p style="margin: 0;">Copy and paste the link below in the address bar of your browser (Chrome, Firefox,
                Safari Or
                Opera).</p>
            </td>
          </tr>
          <!-- COPY -->
          <tr>
            <td bgcolor="#36384A" align="left"
              style="padding: 0px 30px 20px 30px; color: #979BB4; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;">
              <p style="margin: 0;">${resetUrl}</p>
            </td>
          </tr>
          <!-- COPY -->
          <tr>
            <!-- <td bgcolor="#111111" align="left"
              style="padding: 0px 30px 40px 30px; border-radius: 0px 0px 4px 4px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;">
              <p style="margin: 0;"><a href="" target="_blank" style="color: #7c72dc;">See how easy it
                  is to get started</a></p>
            </td> -->
          </tr>
        </table>
      </td>
    </tr>

    <!-- SUPPORT CALLOUT -->
    <tr>
      <td bgcolor="#f4f4f4" align="center" style="padding: 30px 10px 0px 10px;">
        <table border="0" cellpadding="0" cellspacing="0" width="480">
          <!-- HEADLINE -->
          <tr>
            <td bgcolor="#FFC0B3" align="center"
              style="padding: 30px 30px 30px 30px; border-radius: 4px 4px 4px 4px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;">
              <h2 style="font-size: 20px; font-weight: 400; color: #111111; margin: 0;">Need more help?</h2>
              <p style="margin: 0;"><a href="http://almamater.devtek-limited.tech/help" target="_blank"
                  style="color: #E62A00;">We&rsquo;re
                  here, ready to talk</a></p>
            </td>
          </tr>
        </table>
      </td>
    </tr>

    <!-- FOOTER -->
    <tr>
      <td bgcolor="#f4f4f4" align="center" style="padding: 0px 10px 0px 10px;">
        <table border="0" cellpadding="0" cellspacing="0" width="480">

          <!-- PERMISSION REMINDER -->
          <tr>
            <td bgcolor="#f4f4f4" align="left"
              style="padding: 10px 30px 30px 30px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 400; line-height: 18px;">
              <p style="margin: 0;">You received this email because you requested a password reset. If you did not, <a
                  href="http://almamater.devtek-limited.tech/help" target="_blank" style="color: #111111; font-weight:
                  700;">please contact us or ignore.</a>.</p>
            </td>
          </tr>

          <!-- ADDRESS -->
          <tr>
            <td bgcolor="#f4f4f4" align="left"
              style="padding: 0px 30px 30px 30px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 400; line-height: 18px;">
              <p style="margin: 0;">Alma Mata (Ghana)</p>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</body>
</html>
        `,
      }
      this.myMailerService.sendMail(resetEmail);
      return true;
    }
    return false;
  }
}

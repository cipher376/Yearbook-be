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
import {ACL_USER} from '../acls';
import {PasswordHasherBindings, TokenServiceBindings, UserServiceBindings} from '../keys';
import {User} from '../models';
import {UserRepository} from '../repositories';
import {validateCredentials} from '../services';
import {BcryptHasher} from '../services/hash.password';
import {Credentials, MyJWTService, MyUserService} from '../services/jwt-authentication';
import {OPERATION_SECURITY_SPEC} from '../utils/security-spec';
import {CasbinDbEnforcer} from './../services/casbin-authorization/casbin.enforcers';

const applyFilter = require('loopback-filters');

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
          schema: getJsonSchemaRef(User)
        }
      }
    }
  })
  async signup(@requestBody() userData: User) {
    validateCredentials(_.pick(userData, ['email', 'phone', 'password']));
    // check if user exist
    const isUser = await this.userService.userExist(_.pick(userData, ['email', 'phone', 'password']));

    // console.log(userData)
    if (isUser) {
      // prevent registration
      throw new HttpErrors.Conflict('Email or Phone is taken!')
    }
    userData.password = await this.hasher.hashPassword(userData.password as string)
    const savedUser = await this.userRepository.create(userData);

    // update user policies
    (await this.enforcer).addGroupingPolicy(...[`u${savedUser?.id}`, 'authUser']).then(_ => {
    }).catch(error => {
      console.debug(error);
    })

    delete savedUser.password;
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
    const user = await this.userService.verifyCredentials(credentials);

    delete user.password;
    // console.log(user);
    const userProfile = this.userService.convertToUserProfile(user);
    // console.log(userProfile);

    const token = await this.jwtService.generateToken(userProfile);
    return Promise.resolve({token: token})
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
    this.jwtService.expiresSecret;
    delete currentUser?.password
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
    delete currentUser?.password
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
    await this.userRepository.userConfig(currentUser.id).get().then(config => {
      user.userConfig = config
    }, error => {
      console.debug(error);
    })

    await this.userRepository.address(currentUser.id).get().then(add => {
      user.address = add;
    }, error => {
      console.debug(error);
    })
    delete user.password;
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
    delete user.password;
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
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(User, {partial: true}),
        },
      },
    })
    user: User,
  ): Promise<User> {

    // clear the sensitive fields
    const returnUser = await this.userService.updateUser(id, user);
    delete returnUser.password;
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
      delete fs.user?.password;
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
          {relation: 'userConfig'},

        ]
      }
    }
    // console.log(filter);
    const users = await this.userService.getUsers(filter);
    users.map(user => {
      delete user?.password;
    })

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
    }) users: User[]) {
    console.log(users);
    const res: number[] = [];
    const errors: string[] = [];
    for (const user of users) {
      try {
        validateCredentials(_.pick(user, ['email', 'phone', 'password']));
        // check if user exist
        const isUser = await this.userService.userExist(_.pick(user, ['email', 'phone', 'password']));

        // console.log(userData)
        if (isUser) {
          // prevent registration
          throw new HttpErrors.Conflict('Email or Phone is taken!')
        }
        user.password = await this.hasher.hashPassword(user.password as string)
        const savedUser = await this.userRepository.create(user);
        delete savedUser.password;
        res.push(savedUser.id as number);

      } catch (error) {
        errors.push(error);
      }
    }
    return {res, errors};
  }





}

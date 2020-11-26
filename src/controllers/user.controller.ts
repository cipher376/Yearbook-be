import {authenticate, AuthenticationBindings} from '@loopback/authentication';
import {inject} from '@loopback/core';
import {
  Count,
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
import _ from 'lodash';
import {PasswordHasherBindings, TokenServiceBindings, UserServiceBindings} from '../keys';
import {User} from '../models';
import {UserRepository} from '../repositories';
import {validateCredentials} from '../services';
import {BcryptHasher} from '../services/hash.password';
import {Credentials, MyJWTService, MyUserService} from '../services/jwt-authentication';
import {OPERATION_SECURITY_SPEC} from '../utils/security-spec';

// export interface UserInfo {
//   firstName: string;
//   lastName: string;
//   otherName: string
//   nickname: string
//   dob: string
// }


export class UserController {
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

    // @repository(PhotoRepository)
    // public photoRepository: PhotoRepository
  ) { }

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
  // @authorize(ACL_PROJECT['signup'])
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
  // @authorize(ACL_PROJECT['login'])
  async login(
    @requestBody() credentials: Credentials,
  ): Promise<{token: string}> {
    validateCredentials(_.pick(credentials, ['email', 'phone', 'password']));

    // make sure user exist,password should be valid
    const user = await this.userService.verifyCredentials(credentials);
    // console.log(user);
    const userProfile = this.userService.convertToUserProfile(user);
    // console.log(userProfile);

    const token = await this.jwtService.generateToken(userProfile);
    return Promise.resolve({token: token})
  }



  // @authenticate("jwt")
  // @get('/logout', {
  //   security: OPERATION_SECURITY_SPEC,
  //   responses: {
  //     '200': {
  //       description: 'The current user profile',
  //       content: {
  //         'application/json': {
  //           schema: getJsonSchemaRef(User),
  //         },
  //       },
  //     },
  //   },
  // })
  // async logout(
  //   @inject(AuthenticationBindings.CURRENT_USER)
  //   currentUser: UserProfile,
  // ): Promise<UserProfile> {
  //   this.jwtService.expiresSecret
  //   return Promise.resolve(currentUser);
  // }





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
  // @authorize(ACL_USER['me'])
  async me(
    @inject(AuthenticationBindings.CURRENT_USER)
    currentUser: UserProfile,
  ): Promise<UserProfile> {
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
  // @authorize(ACL_USER['my-profile'])
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

    return Promise.resolve(user);
  }


  // @authenticate("jwt")


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
  // @authorize(ACL_USER['my-profile'])
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
  // @authorize(ACL_USER['update-by-id'])
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
    return this.userService.updateUser(id, user)
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
  // @authorize(ACL_USER['count'])
  async count(
    @param.where(User) where?: Where<User>,
  ): Promise<Count> {
    return this.userRepository.count(where);
  }

  // @authenticate("jwt")
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
  // @authorize(ACL_USER['list-all'])
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
    return this.userService.getUsers(filter);
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
  // @authorize(ACL_USER['create-many'])
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

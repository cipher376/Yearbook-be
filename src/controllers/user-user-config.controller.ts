import {authenticate, AuthenticationBindings} from '@loopback/authentication';
import {inject} from '@loopback/core';
import {
  Count,
  CountSchema,
  Filter,
  repository,
  Where
} from '@loopback/repository';
import {
  del,
  get,
  getModelSchemaRef,
  getWhereSchemaFor,
  HttpErrors,
  param,
  patch,
  post,
  requestBody
} from '@loopback/rest';
import {UserProfile} from '@loopback/security';
import {
  User,
  UserConfig
} from '../models';
import {UserRepository} from '../repositories';

export class UserUserConfigController {
  constructor(
    @repository(UserRepository) protected userRepository: UserRepository,
  ) { }


  @authenticate("jwt")
  @get('/users/{id}/user-configs', {
    responses: {
      '200': {
        description: 'Array of User has many UserConfig',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(UserConfig)},
          },
        },
      },
    },
  })
  async find(
    @inject(AuthenticationBindings.CURRENT_USER)
    currentUser: UserProfile,
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<UserConfig>,

  ): Promise<UserConfig[]> {
    if (id === currentUser?.id) {
      return this.userRepository.userConfigs(id).find(filter);
    }
    return [];
  }

  @authenticate("jwt")
  @post('/users/{id}/user-configs', {
    responses: {
      '200': {
        description: 'User model instance',
        content: {'application/json': {schema: getModelSchemaRef(UserConfig)}},
      },
    },
  })
  async create(
    @inject(AuthenticationBindings.CURRENT_USER)
    currentUser: UserProfile,
    @param.path.number('id') id: typeof User.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(UserConfig, {
            title: 'NewUserConfigInUser',
            exclude: ['id'],
            optional: ['userId']
          }),
        },
      },
    }) userConfig: Omit<UserConfig, 'id'>,
  ): Promise<UserConfig> {
    if (id === currentUser?.id) {
      return this.userRepository.userConfigs(id).create(userConfig);
    }
    throw HttpErrors[403];
  }

  @authenticate("jwt")
  @patch('/users/{id}/user-configs', {
    responses: {
      '200': {
        description: 'User.UserConfig PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @inject(AuthenticationBindings.CURRENT_USER)
    currentUser: UserProfile,
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(UserConfig, {partial: true}),
        },
      },
    })
    userConfig: Partial<UserConfig>,
    @param.query.object('where', getWhereSchemaFor(UserConfig)) where?: Where<UserConfig>,
  ): Promise<Count> {
    if (id === currentUser?.id) {
      return this.userRepository.userConfigs(id).patch(userConfig, where);
    }
    throw HttpErrors[403];
  }

  @authenticate("jwt")
  @del('/users/{id}/user-configs', {
    responses: {
      '200': {
        description: 'User.UserConfig DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @inject(AuthenticationBindings.CURRENT_USER)
    currentUser: UserProfile,
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(UserConfig)) where?: Where<UserConfig>,
  ): Promise<Count> {
    if (id === currentUser?.id) {
      return this.userRepository.userConfigs(id).delete(where);
    }
    throw HttpErrors[403];
  }
}

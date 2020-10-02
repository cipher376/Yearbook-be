import {
  Count,
  CountSchema,
  Filter,
  repository,
  Where,
} from '@loopback/repository';
import {
  del,
  get,
  getModelSchemaRef,
  getWhereSchemaFor,
  param,
  patch,
  post,
  requestBody,
} from '@loopback/rest';
import {
  User,
  UserConfig,
} from '../models';
import {UserRepository} from '../repositories';

export class UserUserConfigController {
  constructor(
    @repository(UserRepository) protected userRepository: UserRepository,
  ) { }

  @get('/users/{id}/user-config', {
    responses: {
      '200': {
        description: 'User has one UserConfig',
        content: {
          'application/json': {
            schema: getModelSchemaRef(UserConfig),
          },
        },
      },
    },
  })
  async get(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<UserConfig>,
  ): Promise<UserConfig> {
    return this.userRepository.userConfig(id).get(filter);
  }

  @post('/users/{id}/user-config', {
    responses: {
      '200': {
        description: 'User model instance',
        content: {'application/json': {schema: getModelSchemaRef(UserConfig)}},
      },
    },
  })
  async create(
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
    return this.userRepository.userConfig(id).create(userConfig);
  }

  @patch('/users/{id}/user-config', {
    responses: {
      '200': {
        description: 'User.UserConfig PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
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
    return this.userRepository.userConfig(id).patch(userConfig, where);
  }

  @del('/users/{id}/user-config', {
    responses: {
      '200': {
        description: 'User.UserConfig DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(UserConfig)) where?: Where<UserConfig>,
  ): Promise<Count> {
    return this.userRepository.userConfig(id).delete(where);
  }
}

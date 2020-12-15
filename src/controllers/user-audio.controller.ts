import {authenticate} from '@loopback/authentication';
import {authorize} from '@loopback/authorization';
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
  param,

  post,
  requestBody
} from '@loopback/rest';
import {
  Audio, User
} from '../models';
import {UserRepository} from '../repositories';
import {ACL_MEDIA} from './../acls/media.acl';

export class UserAudioController {
  constructor(
    @repository(UserRepository) protected userRepository: UserRepository,
  ) { }

  @get('/users/{id}/audio', {
    responses: {
      '200': {
        description: 'Array of User has many Audio',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Audio)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Audio>,
  ): Promise<Audio[]> {
    return this.userRepository.audio(id).find(filter);
  }

  @post('/users/{id}/audio', {
    responses: {
      '200': {
        description: 'User model instance',
        content: {'application/json': {schema: getModelSchemaRef(Audio)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_MEDIA['create'])
  async create(
    @param.path.number('id') id: typeof User.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Audio, {
            title: 'NewAudioInUser',
            exclude: ['id'],
            optional: ['userId']
          }),
        },
      },
    }) audio: Omit<Audio, 'id'>,
  ): Promise<Audio> {
    return this.userRepository.audio(id).create(audio);
  }

  // @patch('/users/{id}/audio', {
  //   responses: {
  //     '200': {
  //       description: 'User.Audio PATCH success count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })

  // async patch(
  //   @param.path.number('id') id: number,
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(Audio, {partial: true}),
  //       },
  //     },
  //   })
  //   audio: Partial<Audio>,
  //   @param.query.object('where', getWhereSchemaFor(Audio)) where?: Where<Audio>,
  // ): Promise<Count> {
  //   return this.userRepository.audio(id).patch(audio, where);
  // }

  @del('/users/{id}/audio', {
    responses: {
      '200': {
        description: 'User.Audio DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_MEDIA['delete-by-id'])
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Audio)) where?: Where<Audio>,
  ): Promise<Count> {
    return this.userRepository.audio(id).delete(where);
  }
}

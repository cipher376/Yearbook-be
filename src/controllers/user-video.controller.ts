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
  User,
  Video
} from '../models';
import {UserRepository} from '../repositories';
import {ACL_MEDIA} from './../acls/media.acl';

export class UserVideoController {
  constructor(
    @repository(UserRepository) protected userRepository: UserRepository,
  ) { }

  @get('/users/{id}/videos', {
    responses: {
      '200': {
        description: 'Array of User has many Video',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Video)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Video>,
  ): Promise<Video[]> {
    return this.userRepository.videos(id).find(filter);
  }

  @post('/users/{id}/videos', {
    responses: {
      '200': {
        description: 'User model instance',
        content: {'application/json': {schema: getModelSchemaRef(Video)}},
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
          schema: getModelSchemaRef(Video, {
            title: 'NewVideoInUser',
            exclude: ['id'],
            optional: ['userId']
          }),
        },
      },
    }) video: Omit<Video, 'id'>,
  ): Promise<Video> {
    return this.userRepository.videos(id).create(video);
  }

  // @patch('/users/{id}/videos', {
  //   responses: {
  //     '200': {
  //       description: 'User.Video PATCH success count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async patch(
  //   @param.path.number('id') id: number,
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(Video, {partial: true}),
  //       },
  //     },
  //   })
  //   video: Partial<Video>,
  //   @param.query.object('where', getWhereSchemaFor(Video)) where?: Where<Video>,
  // ): Promise<Count> {
  //   return this.userRepository.videos(id).patch(video, where);
  // }

  @del('/users/{id}/videos', {
    responses: {
      '200': {
        description: 'User.Video DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_MEDIA['delete-by-id'])
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Video)) where?: Where<Video>,
  ): Promise<Count> {
    return this.userRepository.videos(id).delete(where);
  }
}

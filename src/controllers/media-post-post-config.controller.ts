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
  MediaPost,
  PostConfig,
} from '../models';
import {MediaPostRepository} from '../repositories';

export class MediaPostPostConfigController {
  constructor(
    @repository(MediaPostRepository) protected mediaPostRepository: MediaPostRepository,
  ) { }

  @get('/media-posts/{id}/post-config', {
    responses: {
      '200': {
        description: 'MediaPost has one PostConfig',
        content: {
          'application/json': {
            schema: getModelSchemaRef(PostConfig),
          },
        },
      },
    },
  })
  async get(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<PostConfig>,
  ): Promise<PostConfig> {
    return this.mediaPostRepository.postConfig(id).get(filter);
  }

  @post('/media-posts/{id}/post-config', {
    responses: {
      '200': {
        description: 'MediaPost model instance',
        content: {'application/json': {schema: getModelSchemaRef(PostConfig)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof MediaPost.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PostConfig, {
            title: 'NewPostConfigInMediaPost',
            exclude: ['id'],
            optional: ['mediaPostId']
          }),
        },
      },
    }) postConfig: Omit<PostConfig, 'id'>,
  ): Promise<PostConfig> {
    return this.mediaPostRepository.postConfig(id).create(postConfig);
  }

  @patch('/media-posts/{id}/post-config', {
    responses: {
      '200': {
        description: 'MediaPost.PostConfig PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PostConfig, {partial: true}),
        },
      },
    })
    postConfig: Partial<PostConfig>,
    @param.query.object('where', getWhereSchemaFor(PostConfig)) where?: Where<PostConfig>,
  ): Promise<Count> {
    return this.mediaPostRepository.postConfig(id).patch(postConfig, where);
  }

  @del('/media-posts/{id}/post-config', {
    responses: {
      '200': {
        description: 'MediaPost.PostConfig DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(PostConfig)) where?: Where<PostConfig>,
  ): Promise<Count> {
    return this.mediaPostRepository.postConfig(id).delete(where);
  }
}

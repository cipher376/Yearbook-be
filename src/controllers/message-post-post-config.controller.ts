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
  MessagePost,
  PostConfig,
} from '../models';
import {MessagePostRepository} from '../repositories';

export class MessagePostPostConfigController {
  constructor(
    @repository(MessagePostRepository) protected messagePostRepository: MessagePostRepository,
  ) { }

  @get('/message-posts/{id}/post-config', {
    responses: {
      '200': {
        description: 'MessagePost has one PostConfig',
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
    return this.messagePostRepository.postConfig(id).get(filter);
  }

  @post('/message-posts/{id}/post-config', {
    responses: {
      '200': {
        description: 'MessagePost model instance',
        content: {'application/json': {schema: getModelSchemaRef(PostConfig)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof MessagePost.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PostConfig, {
            title: 'NewPostConfigInMessagePost',
            exclude: ['id'],
            optional: ['messagePostId']
          }),
        },
      },
    }) postConfig: Omit<PostConfig, 'id'>,
  ): Promise<PostConfig> {
    return this.messagePostRepository.postConfig(id).create(postConfig);
  }

  @patch('/message-posts/{id}/post-config', {
    responses: {
      '200': {
        description: 'MessagePost.PostConfig PATCH success count',
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
    return this.messagePostRepository.postConfig(id).patch(postConfig, where);
  }

  @del('/message-posts/{id}/post-config', {
    responses: {
      '200': {
        description: 'MessagePost.PostConfig DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(PostConfig)) where?: Where<PostConfig>,
  ): Promise<Count> {
    return this.messagePostRepository.postConfig(id).delete(where);
  }
}

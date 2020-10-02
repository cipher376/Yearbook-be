import {
  Count,
  CountSchema,
  Filter,
  FilterExcludingWhere,
  repository,
  Where,
} from '@loopback/repository';
import {
  post,
  param,
  get,
  getModelSchemaRef,
  patch,
  put,
  del,
  requestBody,
} from '@loopback/rest';
import {MessagePost} from '../models';
import {MessagePostRepository} from '../repositories';

export class MessagePostController {
  constructor(
    @repository(MessagePostRepository)
    public messagePostRepository : MessagePostRepository,
  ) {}

  @post('/message-posts', {
    responses: {
      '200': {
        description: 'MessagePost model instance',
        content: {'application/json': {schema: getModelSchemaRef(MessagePost)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(MessagePost, {
            title: 'NewMessagePost',
            exclude: ['id'],
          }),
        },
      },
    })
    messagePost: Omit<MessagePost, 'id'>,
  ): Promise<MessagePost> {
    return this.messagePostRepository.create(messagePost);
  }

  @get('/message-posts/count', {
    responses: {
      '200': {
        description: 'MessagePost model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(MessagePost) where?: Where<MessagePost>,
  ): Promise<Count> {
    return this.messagePostRepository.count(where);
  }

  @get('/message-posts', {
    responses: {
      '200': {
        description: 'Array of MessagePost model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(MessagePost, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(MessagePost) filter?: Filter<MessagePost>,
  ): Promise<MessagePost[]> {
    return this.messagePostRepository.find(filter);
  }

  @patch('/message-posts', {
    responses: {
      '200': {
        description: 'MessagePost PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(MessagePost, {partial: true}),
        },
      },
    })
    messagePost: MessagePost,
    @param.where(MessagePost) where?: Where<MessagePost>,
  ): Promise<Count> {
    return this.messagePostRepository.updateAll(messagePost, where);
  }

  @get('/message-posts/{id}', {
    responses: {
      '200': {
        description: 'MessagePost model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(MessagePost, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(MessagePost, {exclude: 'where'}) filter?: FilterExcludingWhere<MessagePost>
  ): Promise<MessagePost> {
    return this.messagePostRepository.findById(id, filter);
  }

  @patch('/message-posts/{id}', {
    responses: {
      '204': {
        description: 'MessagePost PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(MessagePost, {partial: true}),
        },
      },
    })
    messagePost: MessagePost,
  ): Promise<void> {
    await this.messagePostRepository.updateById(id, messagePost);
  }

  @put('/message-posts/{id}', {
    responses: {
      '204': {
        description: 'MessagePost PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() messagePost: MessagePost,
  ): Promise<void> {
    await this.messagePostRepository.replaceById(id, messagePost);
  }

  @del('/message-posts/{id}', {
    responses: {
      '204': {
        description: 'MessagePost DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.messagePostRepository.deleteById(id);
  }
}

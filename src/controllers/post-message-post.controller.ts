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
  Post,
  MessagePost,
} from '../models';
import {PostRepository} from '../repositories';

export class PostMessagePostController {
  constructor(
    @repository(PostRepository) protected postRepository: PostRepository,
  ) { }

  @get('/posts/{id}/message-posts', {
    responses: {
      '200': {
        description: 'Array of Post has many MessagePost',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(MessagePost)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<MessagePost>,
  ): Promise<MessagePost[]> {
    return this.postRepository.messagePosts(id).find(filter);
  }

  @post('/posts/{id}/message-posts', {
    responses: {
      '200': {
        description: 'Post model instance',
        content: {'application/json': {schema: getModelSchemaRef(MessagePost)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof Post.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(MessagePost, {
            title: 'NewMessagePostInPost',
            exclude: ['id'],
            optional: ['postId']
          }),
        },
      },
    }) messagePost: Omit<MessagePost, 'id'>,
  ): Promise<MessagePost> {
    return this.postRepository.messagePosts(id).create(messagePost);
  }

  @patch('/posts/{id}/message-posts', {
    responses: {
      '200': {
        description: 'Post.MessagePost PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(MessagePost, {partial: true}),
        },
      },
    })
    messagePost: Partial<MessagePost>,
    @param.query.object('where', getWhereSchemaFor(MessagePost)) where?: Where<MessagePost>,
  ): Promise<Count> {
    return this.postRepository.messagePosts(id).patch(messagePost, where);
  }

  @del('/posts/{id}/message-posts', {
    responses: {
      '200': {
        description: 'Post.MessagePost DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(MessagePost)) where?: Where<MessagePost>,
  ): Promise<Count> {
    return this.postRepository.messagePosts(id).delete(where);
  }
}

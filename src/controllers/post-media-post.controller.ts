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
  MediaPost,
} from '../models';
import {PostRepository} from '../repositories';

export class PostMediaPostController {
  constructor(
    @repository(PostRepository) protected postRepository: PostRepository,
  ) { }

  @get('/posts/{id}/media-posts', {
    responses: {
      '200': {
        description: 'Array of Post has many MediaPost',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(MediaPost)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<MediaPost>,
  ): Promise<MediaPost[]> {
    return this.postRepository.mediaPosts(id).find(filter);
  }

  @post('/posts/{id}/media-posts', {
    responses: {
      '200': {
        description: 'Post model instance',
        content: {'application/json': {schema: getModelSchemaRef(MediaPost)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof Post.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(MediaPost, {
            title: 'NewMediaPostInPost',
            exclude: ['id'],
            optional: ['postId']
          }),
        },
      },
    }) mediaPost: Omit<MediaPost, 'id'>,
  ): Promise<MediaPost> {
    return this.postRepository.mediaPosts(id).create(mediaPost);
  }

  @patch('/posts/{id}/media-posts', {
    responses: {
      '200': {
        description: 'Post.MediaPost PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(MediaPost, {partial: true}),
        },
      },
    })
    mediaPost: Partial<MediaPost>,
    @param.query.object('where', getWhereSchemaFor(MediaPost)) where?: Where<MediaPost>,
  ): Promise<Count> {
    return this.postRepository.mediaPosts(id).patch(mediaPost, where);
  }

  @del('/posts/{id}/media-posts', {
    responses: {
      '200': {
        description: 'Post.MediaPost DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(MediaPost)) where?: Where<MediaPost>,
  ): Promise<Count> {
    return this.postRepository.mediaPosts(id).delete(where);
  }
}

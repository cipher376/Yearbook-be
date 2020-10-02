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
  PhotoPost,
} from '../models';
import {PostRepository} from '../repositories';

export class PostPhotoPostController {
  constructor(
    @repository(PostRepository) protected postRepository: PostRepository,
  ) { }

  @get('/posts/{id}/photo-posts', {
    responses: {
      '200': {
        description: 'Array of Post has many PhotoPost',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(PhotoPost)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<PhotoPost>,
  ): Promise<PhotoPost[]> {
    return this.postRepository.photoPosts(id).find(filter);
  }

  @post('/posts/{id}/photo-posts', {
    responses: {
      '200': {
        description: 'Post model instance',
        content: {'application/json': {schema: getModelSchemaRef(PhotoPost)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof Post.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PhotoPost, {
            title: 'NewPhotoPostInPost',
            exclude: ['id'],
            optional: ['postId']
          }),
        },
      },
    }) photoPost: Omit<PhotoPost, 'id'>,
  ): Promise<PhotoPost> {
    return this.postRepository.photoPosts(id).create(photoPost);
  }

  @patch('/posts/{id}/photo-posts', {
    responses: {
      '200': {
        description: 'Post.PhotoPost PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PhotoPost, {partial: true}),
        },
      },
    })
    photoPost: Partial<PhotoPost>,
    @param.query.object('where', getWhereSchemaFor(PhotoPost)) where?: Where<PhotoPost>,
  ): Promise<Count> {
    return this.postRepository.photoPosts(id).patch(photoPost, where);
  }

  @del('/posts/{id}/photo-posts', {
    responses: {
      '200': {
        description: 'Post.PhotoPost DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(PhotoPost)) where?: Where<PhotoPost>,
  ): Promise<Count> {
    return this.postRepository.photoPosts(id).delete(where);
  }
}

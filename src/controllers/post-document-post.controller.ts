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
  DocumentPost,
} from '../models';
import {PostRepository} from '../repositories';

export class PostDocumentPostController {
  constructor(
    @repository(PostRepository) protected postRepository: PostRepository,
  ) { }

  @get('/posts/{id}/document-posts', {
    responses: {
      '200': {
        description: 'Array of Post has many DocumentPost',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(DocumentPost)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<DocumentPost>,
  ): Promise<DocumentPost[]> {
    return this.postRepository.documentPosts(id).find(filter);
  }

  @post('/posts/{id}/document-posts', {
    responses: {
      '200': {
        description: 'Post model instance',
        content: {'application/json': {schema: getModelSchemaRef(DocumentPost)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof Post.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(DocumentPost, {
            title: 'NewDocumentPostInPost',
            exclude: ['id'],
            optional: ['postId']
          }),
        },
      },
    }) documentPost: Omit<DocumentPost, 'id'>,
  ): Promise<DocumentPost> {
    return this.postRepository.documentPosts(id).create(documentPost);
  }

  @patch('/posts/{id}/document-posts', {
    responses: {
      '200': {
        description: 'Post.DocumentPost PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(DocumentPost, {partial: true}),
        },
      },
    })
    documentPost: Partial<DocumentPost>,
    @param.query.object('where', getWhereSchemaFor(DocumentPost)) where?: Where<DocumentPost>,
  ): Promise<Count> {
    return this.postRepository.documentPosts(id).patch(documentPost, where);
  }

  @del('/posts/{id}/document-posts', {
    responses: {
      '200': {
        description: 'Post.DocumentPost DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(DocumentPost)) where?: Where<DocumentPost>,
  ): Promise<Count> {
    return this.postRepository.documentPosts(id).delete(where);
  }
}

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
  patch,
  post,
  requestBody
} from '@loopback/rest';
import {ACL_MEDIA} from '../acls/media.acl';
import {
  Document, Post
} from '../models';
import {PostRepository} from '../repositories';

export class PostDocumentController {
  constructor(
    @repository(PostRepository) protected postRepository: PostRepository,
  ) { }

  @get('/posts/{id}/documents', {
    responses: {
      '200': {
        description: 'Array of Post has many Document through PostDocumentThrough',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Document)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Document>,
  ): Promise<Document[]> {
    return this.postRepository.documentsThrough(id).find(filter);
  }

  @post('/posts/{id}/documents', {
    responses: {
      '200': {
        description: 'create a Document model instance',
        content: {'application/json': {schema: getModelSchemaRef(Document)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_MEDIA['create'])
  async create(
    @param.path.number('id') id: typeof Post.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Document, {
            title: 'NewDocumentInPost',
            exclude: ['id'],
          }),
        },
      },
    }) document: Omit<Document, 'id'>,
  ): Promise<Document> {
    return this.postRepository.documentsThrough(id).create(document);
  }

  @patch('/posts/{id}/documents', {
    responses: {
      '200': {
        description: 'Post.Document PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_MEDIA['update-by-id'])
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Document, {partial: true}),
        },
      },
    })
    document: Partial<Document>,
    @param.query.object('where', getWhereSchemaFor(Document)) where?: Where<Document>,
  ): Promise<Count> {
    return this.postRepository.documentsThrough(id).patch(document, where);
  }

  @del('/posts/{id}/documents', {
    responses: {
      '200': {
        description: 'Post.Document DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_MEDIA['delete-by-id'])
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Document)) where?: Where<Document>,
  ): Promise<Count> {
    return this.postRepository.documentsThrough(id).delete(where);
  }
}

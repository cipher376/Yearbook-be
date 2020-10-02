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
import {DocumentPost} from '../models';
import {DocumentPostRepository} from '../repositories';

export class DocumentPostController {
  constructor(
    @repository(DocumentPostRepository)
    public documentPostRepository : DocumentPostRepository,
  ) {}

  @post('/document-posts', {
    responses: {
      '200': {
        description: 'DocumentPost model instance',
        content: {'application/json': {schema: getModelSchemaRef(DocumentPost)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(DocumentPost, {
            title: 'NewDocumentPost',
            exclude: ['id'],
          }),
        },
      },
    })
    documentPost: Omit<DocumentPost, 'id'>,
  ): Promise<DocumentPost> {
    return this.documentPostRepository.create(documentPost);
  }

  @get('/document-posts/count', {
    responses: {
      '200': {
        description: 'DocumentPost model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(DocumentPost) where?: Where<DocumentPost>,
  ): Promise<Count> {
    return this.documentPostRepository.count(where);
  }

  @get('/document-posts', {
    responses: {
      '200': {
        description: 'Array of DocumentPost model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(DocumentPost, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(DocumentPost) filter?: Filter<DocumentPost>,
  ): Promise<DocumentPost[]> {
    return this.documentPostRepository.find(filter);
  }

  @patch('/document-posts', {
    responses: {
      '200': {
        description: 'DocumentPost PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(DocumentPost, {partial: true}),
        },
      },
    })
    documentPost: DocumentPost,
    @param.where(DocumentPost) where?: Where<DocumentPost>,
  ): Promise<Count> {
    return this.documentPostRepository.updateAll(documentPost, where);
  }

  @get('/document-posts/{id}', {
    responses: {
      '200': {
        description: 'DocumentPost model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(DocumentPost, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(DocumentPost, {exclude: 'where'}) filter?: FilterExcludingWhere<DocumentPost>
  ): Promise<DocumentPost> {
    return this.documentPostRepository.findById(id, filter);
  }

  @patch('/document-posts/{id}', {
    responses: {
      '204': {
        description: 'DocumentPost PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(DocumentPost, {partial: true}),
        },
      },
    })
    documentPost: DocumentPost,
  ): Promise<void> {
    await this.documentPostRepository.updateById(id, documentPost);
  }

  @put('/document-posts/{id}', {
    responses: {
      '204': {
        description: 'DocumentPost PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() documentPost: DocumentPost,
  ): Promise<void> {
    await this.documentPostRepository.replaceById(id, documentPost);
  }

  @del('/document-posts/{id}', {
    responses: {
      '204': {
        description: 'DocumentPost DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.documentPostRepository.deleteById(id);
  }
}

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
  DocumentPost,
  PostConfig,
} from '../models';
import {DocumentPostRepository} from '../repositories';

export class DocumentPostPostConfigController {
  constructor(
    @repository(DocumentPostRepository) protected documentPostRepository: DocumentPostRepository,
  ) { }

  @get('/document-posts/{id}/post-config', {
    responses: {
      '200': {
        description: 'DocumentPost has one PostConfig',
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
    return this.documentPostRepository.postConfig(id).get(filter);
  }

  @post('/document-posts/{id}/post-config', {
    responses: {
      '200': {
        description: 'DocumentPost model instance',
        content: {'application/json': {schema: getModelSchemaRef(PostConfig)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof DocumentPost.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PostConfig, {
            title: 'NewPostConfigInDocumentPost',
            exclude: ['id'],
            optional: ['documentPostId']
          }),
        },
      },
    }) postConfig: Omit<PostConfig, 'id'>,
  ): Promise<PostConfig> {
    return this.documentPostRepository.postConfig(id).create(postConfig);
  }

  @patch('/document-posts/{id}/post-config', {
    responses: {
      '200': {
        description: 'DocumentPost.PostConfig PATCH success count',
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
    return this.documentPostRepository.postConfig(id).patch(postConfig, where);
  }

  @del('/document-posts/{id}/post-config', {
    responses: {
      '200': {
        description: 'DocumentPost.PostConfig DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(PostConfig)) where?: Where<PostConfig>,
  ): Promise<Count> {
    return this.documentPostRepository.postConfig(id).delete(where);
  }
}

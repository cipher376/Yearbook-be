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
  PhotoPost,
  PostConfig,
} from '../models';
import {PhotoPostRepository} from '../repositories';

export class PhotoPostPostConfigController {
  constructor(
    @repository(PhotoPostRepository) protected photoPostRepository: PhotoPostRepository,
  ) { }

  @get('/photo-posts/{id}/post-config', {
    responses: {
      '200': {
        description: 'PhotoPost has one PostConfig',
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
    return this.photoPostRepository.postConfig(id).get(filter);
  }

  @post('/photo-posts/{id}/post-config', {
    responses: {
      '200': {
        description: 'PhotoPost model instance',
        content: {'application/json': {schema: getModelSchemaRef(PostConfig)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof PhotoPost.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PostConfig, {
            title: 'NewPostConfigInPhotoPost',
            exclude: ['id'],
            optional: ['photoPostId']
          }),
        },
      },
    }) postConfig: Omit<PostConfig, 'id'>,
  ): Promise<PostConfig> {
    return this.photoPostRepository.postConfig(id).create(postConfig);
  }

  @patch('/photo-posts/{id}/post-config', {
    responses: {
      '200': {
        description: 'PhotoPost.PostConfig PATCH success count',
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
    return this.photoPostRepository.postConfig(id).patch(postConfig, where);
  }

  @del('/photo-posts/{id}/post-config', {
    responses: {
      '200': {
        description: 'PhotoPost.PostConfig DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(PostConfig)) where?: Where<PostConfig>,
  ): Promise<Count> {
    return this.photoPostRepository.postConfig(id).delete(where);
  }
}

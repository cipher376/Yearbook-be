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
import {MediaPost} from '../models';
import {MediaPostRepository} from '../repositories';

export class MediaPostController {
  constructor(
    @repository(MediaPostRepository)
    public mediaPostRepository : MediaPostRepository,
  ) {}

  @post('/media-posts', {
    responses: {
      '200': {
        description: 'MediaPost model instance',
        content: {'application/json': {schema: getModelSchemaRef(MediaPost)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(MediaPost, {
            title: 'NewMediaPost',
            exclude: ['id'],
          }),
        },
      },
    })
    mediaPost: Omit<MediaPost, 'id'>,
  ): Promise<MediaPost> {
    return this.mediaPostRepository.create(mediaPost);
  }

  @get('/media-posts/count', {
    responses: {
      '200': {
        description: 'MediaPost model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(MediaPost) where?: Where<MediaPost>,
  ): Promise<Count> {
    return this.mediaPostRepository.count(where);
  }

  @get('/media-posts', {
    responses: {
      '200': {
        description: 'Array of MediaPost model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(MediaPost, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(MediaPost) filter?: Filter<MediaPost>,
  ): Promise<MediaPost[]> {
    return this.mediaPostRepository.find(filter);
  }

  @patch('/media-posts', {
    responses: {
      '200': {
        description: 'MediaPost PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(MediaPost, {partial: true}),
        },
      },
    })
    mediaPost: MediaPost,
    @param.where(MediaPost) where?: Where<MediaPost>,
  ): Promise<Count> {
    return this.mediaPostRepository.updateAll(mediaPost, where);
  }

  @get('/media-posts/{id}', {
    responses: {
      '200': {
        description: 'MediaPost model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(MediaPost, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(MediaPost, {exclude: 'where'}) filter?: FilterExcludingWhere<MediaPost>
  ): Promise<MediaPost> {
    return this.mediaPostRepository.findById(id, filter);
  }

  @patch('/media-posts/{id}', {
    responses: {
      '204': {
        description: 'MediaPost PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(MediaPost, {partial: true}),
        },
      },
    })
    mediaPost: MediaPost,
  ): Promise<void> {
    await this.mediaPostRepository.updateById(id, mediaPost);
  }

  @put('/media-posts/{id}', {
    responses: {
      '204': {
        description: 'MediaPost PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() mediaPost: MediaPost,
  ): Promise<void> {
    await this.mediaPostRepository.replaceById(id, mediaPost);
  }

  @del('/media-posts/{id}', {
    responses: {
      '204': {
        description: 'MediaPost DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.mediaPostRepository.deleteById(id);
  }
}

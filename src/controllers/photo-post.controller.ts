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
import {PhotoPost} from '../models';
import {PhotoPostRepository} from '../repositories';

export class PhotoPostController {
  constructor(
    @repository(PhotoPostRepository)
    public photoPostRepository : PhotoPostRepository,
  ) {}

  @post('/photo-posts', {
    responses: {
      '200': {
        description: 'PhotoPost model instance',
        content: {'application/json': {schema: getModelSchemaRef(PhotoPost)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PhotoPost, {
            title: 'NewPhotoPost',
            exclude: ['id'],
          }),
        },
      },
    })
    photoPost: Omit<PhotoPost, 'id'>,
  ): Promise<PhotoPost> {
    return this.photoPostRepository.create(photoPost);
  }

  @get('/photo-posts/count', {
    responses: {
      '200': {
        description: 'PhotoPost model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(PhotoPost) where?: Where<PhotoPost>,
  ): Promise<Count> {
    return this.photoPostRepository.count(where);
  }

  @get('/photo-posts', {
    responses: {
      '200': {
        description: 'Array of PhotoPost model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(PhotoPost, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(PhotoPost) filter?: Filter<PhotoPost>,
  ): Promise<PhotoPost[]> {
    return this.photoPostRepository.find(filter);
  }

  @patch('/photo-posts', {
    responses: {
      '200': {
        description: 'PhotoPost PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PhotoPost, {partial: true}),
        },
      },
    })
    photoPost: PhotoPost,
    @param.where(PhotoPost) where?: Where<PhotoPost>,
  ): Promise<Count> {
    return this.photoPostRepository.updateAll(photoPost, where);
  }

  @get('/photo-posts/{id}', {
    responses: {
      '200': {
        description: 'PhotoPost model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(PhotoPost, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(PhotoPost, {exclude: 'where'}) filter?: FilterExcludingWhere<PhotoPost>
  ): Promise<PhotoPost> {
    return this.photoPostRepository.findById(id, filter);
  }

  @patch('/photo-posts/{id}', {
    responses: {
      '204': {
        description: 'PhotoPost PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PhotoPost, {partial: true}),
        },
      },
    })
    photoPost: PhotoPost,
  ): Promise<void> {
    await this.photoPostRepository.updateById(id, photoPost);
  }

  @put('/photo-posts/{id}', {
    responses: {
      '204': {
        description: 'PhotoPost PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() photoPost: PhotoPost,
  ): Promise<void> {
    await this.photoPostRepository.replaceById(id, photoPost);
  }

  @del('/photo-posts/{id}', {
    responses: {
      '204': {
        description: 'PhotoPost DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.photoPostRepository.deleteById(id);
  }
}

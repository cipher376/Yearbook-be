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
import {Photo, School} from '../models';
import {SchoolRepository} from '../repositories';

export class SchoolPhotoController {
  constructor(
    @repository(SchoolRepository) protected schoolRepository: SchoolRepository,
  ) {}

  @get('/schools/{id}/photos', {
    responses: {
      '200': {
        description: 'Array of School has many Photo',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Photo)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Photo>,
  ): Promise<Photo[]> {
    return this.schoolRepository.photos(id).find(filter);
  }

  @post('/schools/{id}/photos', {
    responses: {
      '200': {
        description: 'School model instance',
        content: {'application/json': {schema: getModelSchemaRef(Photo)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof School.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Photo, {
            title: 'NewPhotoInSchool',
            exclude: ['id'],
            optional: ['schoolId']
          }),
        },
      },
    }) photo: Omit<Photo, 'id'>,
  ): Promise<Photo> {
    return this.schoolRepository.photos(id).create(photo);
  }

  @patch('/schools/{id}/photos', {
    responses: {
      '200': {
        description: 'School.Photo PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Photo, {partial: true}),
        },
      },
    })
    photo: Partial<Photo>,
    @param.query.object('where', getWhereSchemaFor(Photo)) where?: Where<Photo>,
  ): Promise<Count> {
    return this.schoolRepository.photos(id).patch(photo, where);
  }

  @del('/schools/{id}/photos', {
    responses: {
      '200': {
        description: 'School.Photo DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Photo)) where?: Where<Photo>,
  ): Promise<Count> {
    return this.schoolRepository.photos(id).delete(where);
  }
}

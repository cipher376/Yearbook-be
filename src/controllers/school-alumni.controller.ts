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
  School,
  Alumni,
} from '../models';
import {SchoolRepository} from '../repositories';

export class SchoolAlumniController {
  constructor(
    @repository(SchoolRepository) protected schoolRepository: SchoolRepository,
  ) { }

  @get('/schools/{id}/alumni', {
    responses: {
      '200': {
        description: 'Array of School has many Alumni',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Alumni)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Alumni>,
  ): Promise<Alumni[]> {
    return this.schoolRepository.alumni(id).find(filter);
  }

  @post('/schools/{id}/alumni', {
    responses: {
      '200': {
        description: 'School model instance',
        content: {'application/json': {schema: getModelSchemaRef(Alumni)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof School.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Alumni, {
            title: 'NewAlumniInSchool',
            exclude: ['id'],
            optional: ['schoolId']
          }),
        },
      },
    }) alumni: Omit<Alumni, 'id'>,
  ): Promise<Alumni> {
    return this.schoolRepository.alumni(id).create(alumni);
  }

  @patch('/schools/{id}/alumni', {
    responses: {
      '200': {
        description: 'School.Alumni PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Alumni, {partial: true}),
        },
      },
    })
    alumni: Partial<Alumni>,
    @param.query.object('where', getWhereSchemaFor(Alumni)) where?: Where<Alumni>,
  ): Promise<Count> {
    return this.schoolRepository.alumni(id).patch(alumni, where);
  }

  @del('/schools/{id}/alumni', {
    responses: {
      '200': {
        description: 'School.Alumni DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Alumni)) where?: Where<Alumni>,
  ): Promise<Count> {
    return this.schoolRepository.alumni(id).delete(where);
  }
}

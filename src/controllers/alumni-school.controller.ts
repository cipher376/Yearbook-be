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
  Alumni,
  School,
} from '../models';
import {AlumniRepository} from '../repositories';

export class AlumniSchoolController {
  constructor(
    @repository(AlumniRepository) protected alumniRepository: AlumniRepository,
  ) { }

  @get('/alumni/{id}/school', {
    responses: {
      '200': {
        description: 'Alumni has one School',
        content: {
          'application/json': {
            schema: getModelSchemaRef(School),
          },
        },
      },
    },
  })
  async get(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<School>,
  ): Promise<School> {
    return this.alumniRepository.school(id).get(filter);
  }

  @post('/alumni/{id}/school', {
    responses: {
      '200': {
        description: 'Alumni model instance',
        content: {'application/json': {schema: getModelSchemaRef(School)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof Alumni.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(School, {
            title: 'NewSchoolInAlumni',
            exclude: ['id'],
            optional: ['alumniId']
          }),
        },
      },
    }) school: Omit<School, 'id'>,
  ): Promise<School> {
    return this.alumniRepository.school(id).create(school);
  }

  @patch('/alumni/{id}/school', {
    responses: {
      '200': {
        description: 'Alumni.School PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(School, {partial: true}),
        },
      },
    })
    school: Partial<School>,
    @param.query.object('where', getWhereSchemaFor(School)) where?: Where<School>,
  ): Promise<Count> {
    return this.alumniRepository.school(id).patch(school, where);
  }

  @del('/alumni/{id}/school', {
    responses: {
      '200': {
        description: 'Alumni.School DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(School)) where?: Where<School>,
  ): Promise<Count> {
    return this.alumniRepository.school(id).delete(where);
  }
}

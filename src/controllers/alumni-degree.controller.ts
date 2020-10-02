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
  Degree,
} from '../models';
import {AlumniRepository} from '../repositories';

export class AlumniDegreeController {
  constructor(
    @repository(AlumniRepository) protected alumniRepository: AlumniRepository,
  ) { }

  @get('/alumni/{id}/degree', {
    responses: {
      '200': {
        description: 'Alumni has one Degree',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Degree),
          },
        },
      },
    },
  })
  async get(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Degree>,
  ): Promise<Degree> {
    return this.alumniRepository.degree(id).get(filter);
  }

  @post('/alumni/{id}/degree', {
    responses: {
      '200': {
        description: 'Alumni model instance',
        content: {'application/json': {schema: getModelSchemaRef(Degree)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof Alumni.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Degree, {
            title: 'NewDegreeInAlumni',
            exclude: ['id'],
            optional: ['alumniId']
          }),
        },
      },
    }) degree: Omit<Degree, 'id'>,
  ): Promise<Degree> {
    return this.alumniRepository.degree(id).create(degree);
  }

  @patch('/alumni/{id}/degree', {
    responses: {
      '200': {
        description: 'Alumni.Degree PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Degree, {partial: true}),
        },
      },
    })
    degree: Partial<Degree>,
    @param.query.object('where', getWhereSchemaFor(Degree)) where?: Where<Degree>,
  ): Promise<Count> {
    return this.alumniRepository.degree(id).patch(degree, where);
  }

  @del('/alumni/{id}/degree', {
    responses: {
      '200': {
        description: 'Alumni.Degree DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Degree)) where?: Where<Degree>,
  ): Promise<Count> {
    return this.alumniRepository.degree(id).delete(where);
  }
}

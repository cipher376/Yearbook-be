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
import {School} from '../models';
import {SchoolRepository} from '../repositories';

export class SchoolController {
  constructor(
    @repository(SchoolRepository)
    public schoolRepository : SchoolRepository,
  ) {}

  @post('/schools', {
    responses: {
      '200': {
        description: 'School model instance',
        content: {'application/json': {schema: getModelSchemaRef(School)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(School, {
            title: 'NewSchool',
            exclude: ['id'],
          }),
        },
      },
    })
    school: Omit<School, 'id'>,
  ): Promise<School> {
    return this.schoolRepository.create(school);
  }

  @get('/schools/count', {
    responses: {
      '200': {
        description: 'School model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(School) where?: Where<School>,
  ): Promise<Count> {
    return this.schoolRepository.count(where);
  }

  @get('/schools', {
    responses: {
      '200': {
        description: 'Array of School model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(School, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(School) filter?: Filter<School>,
  ): Promise<School[]> {
    return this.schoolRepository.find(filter);
  }

  @patch('/schools', {
    responses: {
      '200': {
        description: 'School PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(School, {partial: true}),
        },
      },
    })
    school: School,
    @param.where(School) where?: Where<School>,
  ): Promise<Count> {
    return this.schoolRepository.updateAll(school, where);
  }

  @get('/schools/{id}', {
    responses: {
      '200': {
        description: 'School model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(School, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(School, {exclude: 'where'}) filter?: FilterExcludingWhere<School>
  ): Promise<School> {
    return this.schoolRepository.findById(id, filter);
  }

  @patch('/schools/{id}', {
    responses: {
      '204': {
        description: 'School PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(School, {partial: true}),
        },
      },
    })
    school: School,
  ): Promise<void> {
    await this.schoolRepository.updateById(id, school);
  }

  @put('/schools/{id}', {
    responses: {
      '204': {
        description: 'School PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() school: School,
  ): Promise<void> {
    await this.schoolRepository.replaceById(id, school);
  }

  @del('/schools/{id}', {
    responses: {
      '204': {
        description: 'School DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.schoolRepository.deleteById(id);
  }

  
}

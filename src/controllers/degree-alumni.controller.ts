import {
  repository,
} from '@loopback/repository';
import {
  param,
  get,
  getModelSchemaRef,
} from '@loopback/rest';
import {
  Degree,
  Alumni,
} from '../models';
import {DegreeRepository} from '../repositories';

export class DegreeAlumniController {
  constructor(
    @repository(DegreeRepository)
    public degreeRepository: DegreeRepository,
  ) { }

  @get('/degrees/{id}/alumni', {
    responses: {
      '200': {
        description: 'Alumni belonging to Degree',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Alumni)},
          },
        },
      },
    },
  })
  async getAlumni(
    @param.path.number('id') id: typeof Degree.prototype.id,
  ): Promise<Alumni> {
    return this.degreeRepository.alumni(id);
  }
}

import {authenticate} from '@loopback/authentication';
import {authorize} from '@loopback/authorization';
import {
  repository
} from '@loopback/repository';
import {
  get,
  getModelSchemaRef, param
} from '@loopback/rest';
import {ACL_DEGREE_ALUMNI} from '../acls/degree-alumni.acl';
import {
  Alumni, Degree
} from '../models';
import {DegreeRepository} from '../repositories';

export class DegreeAlumniController {
  constructor(
    @repository(DegreeRepository)
    public degreeRepository: DegreeRepository,
  ) {}

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
  @authenticate("jwt")
  @authorize(ACL_DEGREE_ALUMNI['find-by-id'])
  async getAlumni(
    @param.path.number('id') id: typeof Degree.prototype.id,
  ): Promise<Alumni> {
    return this.degreeRepository.alumni(id);
  }
}

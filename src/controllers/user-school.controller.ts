import {
  Filter,
  repository
} from '@loopback/repository';
import {
  get,
  getModelSchemaRef,

  param
} from '@loopback/rest';
import {
  School
} from '../models';
import {UserRepository} from '../repositories';

export class UserSchoolController {
  constructor(
    @repository(UserRepository) protected userRepository: UserRepository,
  ) {}

  @get('/users/{id}/schools', {
    responses: {
      '200': {
        description: 'Array of User has many School through Alumni',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(School)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<School>,
  ): Promise<School[]> {
    return this.userRepository.schools(id).find(filter);
  }
}

import {
  repository,
} from '@loopback/repository';
import {
  param,
  get,
  getModelSchemaRef,
} from '@loopback/rest';
import {
  User,
  Alumni,
} from '../models';
import {UserRepository} from '../repositories';

export class UserAlumniController {
  constructor(
    @repository(UserRepository)
    public userRepository: UserRepository,
  ) { }

  @get('/users/{id}/alumni', {
    responses: {
      '200': {
        description: 'Alumni belonging to User',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Alumni)},
          },
        },
      },
    },
  })
  async getAlumni(
    @param.path.number('id') id: typeof User.prototype.id,
  ): Promise<Alumni> {
    return this.userRepository.alumni(id);
  }
}

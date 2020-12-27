import {
  repository,
} from '@loopback/repository';
import {
  param,
  get,
  getModelSchemaRef,
} from '@loopback/rest';
import {
  Password,
  User,
} from '../models';
import {PasswordRepository} from '../repositories';

export class PasswordUserController {
  constructor(
    @repository(PasswordRepository)
    public passwordRepository: PasswordRepository,
  ) { }

  @get('/passwords/{id}/user', {
    responses: {
      '200': {
        description: 'User belonging to Password',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(User)},
          },
        },
      },
    },
  })
  async getUser(
    @param.path.number('id') id: typeof Password.prototype.id,
  ): Promise<User> {
    return this.passwordRepository.user(id);
  }
}

import {authenticate} from '@loopback/authentication';
import {authorize} from '@loopback/authorization';
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
  User
} from '../models';
import {AlumniRepository} from '../repositories';
import {ACL_ALUMNI_USER} from './../acls/alumni-user.acl';

export class AlumniUserController {
  constructor(
    @repository(AlumniRepository) protected alumniRepository: AlumniRepository,
  ) { }

  @get('/alumni/{id}/user', {
    responses: {
      '200': {
        description: 'Alumni has one User',
        content: {
          'application/json': {
            schema: getModelSchemaRef(User),
          },
        },
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_ALUMNI_USER['find-by-id'])
  async get(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<User>,
  ): Promise<User> {
    const user = await this.alumniRepository.user(id).get(filter);
    delete user.password;
    return user;
  }


}

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
  ) { }

  @get('/users/{id}/followed-schools', {
    responses: {
      '200': {
        description: 'Array of User has many School through FollowThrough',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(School)},
          },
        },
      },
    },
  })
  async findFollowedSchool(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<School>,
  ): Promise<School[]> {
    return this.userRepository.followedSchools(id).find(filter);
  }

  // @post('/users/{id}/followed-schools', {
  //   responses: {
  //     '200': {
  //       description: 'create a School model instance',
  //       content: {'application/json': {schema: getModelSchemaRef(School)}},
  //     },
  //   },
  // })
  // async createFollowedSchool(
  //   @param.path.number('id') id: typeof User.prototype.id,
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(School, {
  //           title: 'NewSchoolInUser',
  //           exclude: ['id'],
  //         }),
  //       },
  //     },
  //   }) school: Omit<School, 'id'>,
  // ): Promise<School> {
  //   return this.userRepository.followedSchools(id).create(school);
  // }

  // @patch('/users/{id}/followed-schools', {
  //   responses: {
  //     '200': {
  //       description: 'User.School PATCH success count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async patchFollowedSchool(
  //   @param.path.number('id') id: number,
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(School, {partial: true}),
  //       },
  //     },
  //   })
  //   school: Partial<School>,
  //   @param.query.object('where', getWhereSchemaFor(School)) where?: Where<School>,
  // ): Promise<Count> {
  //   return this.userRepository.followedSchools(id).patch(school, where);
  // }

  // @del('/users/{id}/followed-schools', {
  //   responses: {
  //     '200': {
  //       description: 'User.School DELETE success count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async deleteFollowedSchools(
  //   @param.path.number('id') id: number,
  //   @param.query.object('where', getWhereSchemaFor(School)) where?: Where<School>,
  // ): Promise<Count> {
  //   return this.userRepository.followedSchools(id).delete(where);
  // }


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

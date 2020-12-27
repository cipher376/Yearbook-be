import {
  CountSchema,
  Filter,
  repository,
  Where
} from '@loopback/repository';
import {
  get,
  getModelSchemaRef,

  param
} from '@loopback/rest';
import {

  User
} from '../models';
import {FollowThroughRepository, SchoolRepository, UserRepository} from '../repositories';
import {FollowThrough} from './../models/follow-through.model';
const applyFilter = require('loopback-filters');

export class SchoolUserController {
  constructor(
    @repository(SchoolRepository) protected schoolRepository: SchoolRepository,
    @repository(UserRepository) protected userRepository: UserRepository,
    @repository(FollowThroughRepository) protected followRepository: FollowThroughRepository,
  ) { }

  @get('/schools/{id}/users', {
    responses: {
      '200': {
        description: 'Array of School has many User through Alumni',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(User)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<User>,
  ): Promise<User[]> {
    const users = await this.schoolRepository.users(id).find(filter);
    return users.map(user => {
      return user;
    });
  }

  // @post('/schools/{id}/users', {
  //   responses: {
  //     '200': {
  //       description: 'create a User model instance',
  //       content: {'application/json': {schema: getModelSchemaRef(User)}},
  //     },
  //   },
  // })
  // async create(
  //   @param.path.number('id') id: typeof School.prototype.id,
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(User, {
  //           title: 'NewUserInSchool',
  //           exclude: ['id'],
  //         }),
  //       },
  //     },
  //   }) user: Omit<User, 'id'>,
  // ): Promise<User> {
  //   return this.schoolRepository.users(id).create(user);
  // }

  // @patch('/schools/{id}/users', {
  //   responses: {
  //     '200': {
  //       description: 'School.User PATCH success count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async patch(
  //   @param.path.number('id') id: number,
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(User, {partial: true}),
  //       },
  //     },
  //   })
  //   user: Partial<User>,
  //   @param.query.object('where', getWhereSchemaFor(User)) where?: Where<User>,
  // ): Promise<Count> {
  //   return this.schoolRepository.users(id).patch(user, where);
  // }

  // @del('/schools/{id}/users', {
  //   responses: {
  //     '200': {
  //       description: 'School.User DELETE success count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async delete(
  //   @param.path.number('id') id: number,
  //   @param.query.object('where', getWhereSchemaFor(User)) where?: Where<User>,
  // ): Promise<Count> {
  //   return this.schoolRepository.users(id).delete(where);
  // }


  /*******************************Followers queries*********************************** */

  @get('/schools/{id}/followers', {
    responses: {
      '200': {
        description: 'Array of School has many User through FollowThrough',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(User)},
          },
        },
      },
    },
  })
  async findFollowers(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<User>,
  ): Promise<User[]> {
    filter = filter ?? {};

    const followers = await this.followRepository.find({
      where: {leaderId: id, isFollowing: true}
    });

    const usersIds: any = [];
    followers.forEach(f => {
      usersIds.push(f.followerId);
    });

    filter.where = filter.where ?? {};
    (filter.where as any).id = {inq: usersIds}
    const users = await this.userRepository.find(filter);

    return users;
  }



  @get('/schools/{id}/followers/count', {
    responses: {
      '200': {
        description: 'Follow model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  // @authenticate("jwt")
  // @authorize(ACL_SCHOOL['count'])
  async followerCount(
    @param.path.number('id') id: number,
    @param.where(FollowThrough) where?: Where<FollowThrough>,
  ): Promise<number> {
    const _where: any = where ?? {};
    _where.leaderId = id;
    _where.isFollowing = true;

    const count = await this.followRepository.count(_where);
    return count.count;
  }



  // @post('/schools/{id}/followers', {
  //   responses: {
  //     '200': {
  //       description: 'create a User model instance',
  //       content: {'application/json': {schema: getModelSchemaRef(User)}},
  //     },
  //   },
  // })
  // async createFollower(
  //   @param.path.number('id') id: typeof School.prototype.id,
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(User, {
  //           title: 'NewUserInSchool',
  //           exclude: ['id'],
  //         }),
  //       },
  //     },
  //   }) user: Omit<User, 'id'>,
  // ): Promise<User> {
  //   return this.schoolRepository.followers(id).create(user);
  // }

  // @patch('/schools/{id}/followers', {
  //   responses: {
  //     '200': {
  //       description: 'School.User PATCH success count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async patchFollower(
  //   @param.path.number('id') id: number,
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(User, {partial: true}),
  //       },
  //     },
  //   })
  //   user: Partial<User>,
  //   @param.query.object('where', getWhereSchemaFor(User)) where?: Where<User>,
  // ): Promise<Count> {
  //   return this.schoolRepository.followers(id).patch(user, where);
  // }

  // @del('/schools/{id}/followers', {
  //   responses: {
  //     '200': {
  //       description: 'School.User DELETE success count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async deleteFollower(
  //   @param.path.number('id') id: number,
  //   @param.query.object('where', getWhereSchemaFor(User)) where?: Where<User>,
  // ): Promise<Count> {
  //   return this.schoolRepository.followers(id).delete(where);
  // }
}

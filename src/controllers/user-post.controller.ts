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
  User,
  Post,
} from '../models';
import {UserRepository} from '../repositories';

export class UserPostController {
  constructor(
    @repository(UserRepository) protected userRepository: UserRepository,
  ) { }

  @get('/users/{id}/post', {
    responses: {
      '200': {
        description: 'User has one Post',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Post),
          },
        },
      },
    },
  })
  async get(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Post>,
  ): Promise<Post> {
    return this.userRepository.post(id).get(filter);
  }

  @post('/users/{id}/post', {
    responses: {
      '200': {
        description: 'User model instance',
        content: {'application/json': {schema: getModelSchemaRef(Post)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof User.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Post, {
            title: 'NewPostInUser',
            exclude: ['id'],
            optional: ['userId']
          }),
        },
      },
    }) post: Omit<Post, 'id'>,
  ): Promise<Post> {
    return this.userRepository.post(id).create(post);
  }

  @patch('/users/{id}/post', {
    responses: {
      '200': {
        description: 'User.Post PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Post, {partial: true}),
        },
      },
    })
    post: Partial<Post>,
    @param.query.object('where', getWhereSchemaFor(Post)) where?: Where<Post>,
  ): Promise<Count> {
    return this.userRepository.post(id).patch(post, where);
  }

  @del('/users/{id}/post', {
    responses: {
      '200': {
        description: 'User.Post DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Post)) where?: Where<Post>,
  ): Promise<Count> {
    return this.userRepository.post(id).delete(where);
  }
}

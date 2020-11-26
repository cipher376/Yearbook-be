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
import {CommentRepository} from '../repositories';

export class CommentUserController {
  constructor(
    @repository(CommentRepository) protected commentRepository: CommentRepository,
  ) { }

  @get('/comments/{id}/users', {
    responses: {
      '200': {
        description: 'Array of Comment has many User through LikeThrough',
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
    return this.commentRepository.likedUsers(id).find(filter);
  }

  // @post('/comments/{id}/users', {
  //   responses: {
  //     '200': {
  //       description: 'create a User model instance',
  //       content: {'application/json': {schema: getModelSchemaRef(User)}},
  //     },
  //   },
  // })
  // async create(
  //   @param.path.number('id') id: typeof Comment.prototype.id,
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(User, {
  //           title: 'NewUserInComment',
  //           exclude: ['id'],
  //         }),
  //       },
  //     },
  //   }) user: Omit<User, 'id'>,
  // ): Promise<User> {
  //   return this.commentRepository.likedUsers(id).create(user);
  // }

  // @patch('/comments/{id}/users', {
  //   responses: {
  //     '200': {
  //       description: 'Comment.User PATCH success count',
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
  //   return this.commentRepository.likedUsers(id).patch(user, where);
  // }

  // @del('/comments/{id}/users', {
  //   responses: {
  //     '200': {
  //       description: 'Comment.User DELETE success count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async delete(
  //   @param.path.number('id') id: number,
  //   @param.query.object('where', getWhereSchemaFor(User)) where?: Where<User>,
  // ): Promise<Count> {
  //   return this.commentRepository.likedUsers(id).delete(where);
  // }


}

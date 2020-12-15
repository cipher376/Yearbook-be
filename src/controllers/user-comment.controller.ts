import {authenticate} from '@loopback/authentication';
import {authorize} from '@loopback/authorization';
import {
  CountSchema,
  Filter,
  repository,
  Where
} from '@loopback/repository';
import {
  del,
  get,
  getModelSchemaRef,
  getWhereSchemaFor,
  param,

  post,
  requestBody
} from '@loopback/rest';
import {
  Comment, User
} from '../models';
import {UserRepository} from '../repositories';
import {ACL_COMMENT} from './../acls/comment.acl';

export class UserCommentController {
  constructor(
    @repository(UserRepository) protected userRepository: UserRepository,
  ) { }

  @get('/users/{id}/comments', {
    responses: {
      '200': {
        description: 'Array of User has many Comment through LikeThrough',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Comment)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Comment>,
  ): Promise<Comment[]> {
    return this.userRepository.likedComments(id).find(filter);
  }

  @post('/users/{id}/comments', {
    responses: {
      '200': {
        description: 'create a Comment model instance',
        content: {'application/json': {schema: getModelSchemaRef(Comment)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_COMMENT['create'])
  async create(
    @param.path.number('id') id: typeof User.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Comment, {
            title: 'NewCommentInUser',
            exclude: ['id'],
          }),
        },
      },
    }) comment: Omit<Comment, 'id'>,
  ): Promise<Comment> {
    return this.userRepository.likedComments(id).create(comment);
  }

  // @patch('/users/{id}/comments', {
  //   responses: {
  //     '200': {
  //       description: 'User.Comment PATCH success count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async patch(
  //   @param.path.number('id') id: number,
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(Comment, {partial: true}),
  //       },
  //     },
  //   })
  //   comment: Partial<Comment>,
  //   @param.query.object('where', getWhereSchemaFor(Comment)) where?: Where<Comment>,
  // ): Promise<Count> {
  //   return this.userRepository.likedComments(id).patch(comment, where);
  // }

  @del('/users/{id}/comments', {
    responses: {
      '200': {
        description: 'User.Comment DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_COMMENT['delete-by-id'])
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Comment)) where?: Where<Comment>,
  ): Promise<number> {
    return (await this.userRepository.likedComments(id).delete(where)).count;
  }
}

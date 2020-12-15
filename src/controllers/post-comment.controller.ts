import {authenticate} from '@loopback/authentication';
import {authorize} from '@loopback/authorization';
import {
  Count,
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
import {ACL_COMMENT} from '../acls/comment.acl';
import {
  Comment, Post
} from '../models';
import {PostRepository} from '../repositories';

export class PostCommentController {
  constructor(
    @repository(PostRepository) protected postRepository: PostRepository,
  ) { }

  @get('/posts/{id}/comments', {
    responses: {
      '200': {
        description: 'Array of Post has many Comment',
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
    return this.postRepository.comments(id).find(filter);
  }

  @get('/posts/{id}/comments/count', {
    responses: {
      '200': {
        description: 'Array of Post has many Comment',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Comment)},
          },
        },
      },
    },
  })
  async count(
    @param.path.number('id') id: number
  ): Promise<number> {
    return (await this.postRepository.comments(id).find()).length;
  }

  @post('/posts/{id}/comments', {
    responses: {
      '200': {
        description: 'Post model instance',
        content: {'application/json': {schema: getModelSchemaRef(Comment)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_COMMENT['create'])
  async create(
    @param.path.number('id') id: typeof Post.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Comment, {
            title: 'NewCommentInPost',
            exclude: ['id'],
            optional: ['postId']
          }),
        },
      },
    }) comment: Omit<Comment, 'id'>,
  ): Promise<Comment> {
    return this.postRepository.comments(id).create(comment);
  }

  // @patch('/posts/{id}/comments', {
  //   responses: {
  //     '200': {
  //       description: 'Post.Comment PATCH success count',
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
  //   return this.postRepository.comments(id).patch(comment, where);
  // }

  @del('/posts/{id}/comments', {
    responses: {
      '200': {
        description: 'Post.Comment DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_COMMENT['delete-by-id'])
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Comment)) where?: Where<Comment>,
  ): Promise<Count> {
    return this.postRepository.comments(id).delete(where);
  }
}

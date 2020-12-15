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
  Post,

  User
} from '../models';
import {PostRepository} from '../repositories';
import {ACL_USER} from './../acls/user.acl';

export class PostUserController {
  constructor(
    @repository(PostRepository) protected postRepository: PostRepository,
  ) { }

  @get('/posts/{id}/likedUsers', {
    responses: {
      '200': {
        description: 'Array of Post has many User through LikeThrough',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(User)},
          },
        },
      },
    },
  })
  async findLikedUser(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<User>,
  ): Promise<User[]> {
    return this.postRepository.likedUsers(id).find(filter);
  }


  @get('/posts/{id}/user', {
    responses: {
      '200': {
        description: 'User belonging to Post',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(User)},
          },
        },
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_USER['find-by-id'])
  async getUser(
    @param.path.number('id') id: typeof Post.prototype.id,
  ): Promise<User> {
    return this.postRepository.user(id);
  }
}

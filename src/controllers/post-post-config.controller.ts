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
  patch,
  post,
  requestBody
} from '@loopback/rest';
import {ACL_POST_CONFIG} from '../acls/post-config.acl';
import {
  Post,
  PostConfig
} from '../models';
import {PostRepository} from '../repositories';

export class PostPostConfigController {
  constructor(
    @repository(PostRepository) protected postRepository: PostRepository,
  ) { }


  @get('/posts/{id}/post-config', {
    responses: {
      '200': {
        description: 'Post has one PostConfig',
        content: {
          'application/json': {
            schema: getModelSchemaRef(PostConfig),
          },
        },
      },
    },
  })
  @authenticate("jwt")
  // @authorize(ACL_POST_CONFIG['list-all'])
  async get(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<PostConfig>,
  ): Promise<PostConfig> {
    return this.postRepository.postConfig(id).get(filter);
  }

  @post('/posts/{id}/post-config', {
    responses: {
      '200': {
        description: 'Post model instance',
        content: {'application/json': {schema: getModelSchemaRef(PostConfig)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POST_CONFIG['create'])
  async create(
    @param.path.number('id') id: typeof Post.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PostConfig, {
            title: 'NewPostConfigInPost',
            exclude: ['id'],
            optional: ['postId']
          }),
        },
      },
    }) postConfig: Omit<PostConfig, 'id'>,
  ): Promise<PostConfig> {
    return this.postRepository.postConfig(id).create(postConfig);
  }

  @patch('/posts/{id}/post-config', {
    responses: {
      '200': {
        description: 'Post.PostConfig PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POST_CONFIG['update-by-id'])
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PostConfig, {partial: true}),
        },
      },
    })
    postConfig: Partial<PostConfig>,
    @param.query.object('where', getWhereSchemaFor(PostConfig)) where?: Where<PostConfig>,
  ): Promise<Count> {
    return this.postRepository.postConfig(id).patch(postConfig, where);
  }

  @del('/posts/{id}/post-config', {
    responses: {
      '200': {
        description: 'Post.PostConfig DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POST_CONFIG['delete-by-id'])
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(PostConfig)) where?: Where<PostConfig>,
  ): Promise<Count> {
    return this.postRepository.postConfig(id).delete(where);
  }
}

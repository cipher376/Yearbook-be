import {authenticate} from '@loopback/authentication';
import {authorize} from '@loopback/authorization';
import {
  CountSchema,
  Filter,
  FilterExcludingWhere,
  repository,
  Where
} from '@loopback/repository';
import {
  del, get,
  getModelSchemaRef, param,
  patch, post,

  requestBody
} from '@loopback/rest';
import {Post} from '../models';
import {PostAudioThroughRepository, PostRepository, PostVideoThroughRepository} from '../repositories';
import {ACL_POST} from './../acls/post.acl';
import {PostPhotoThroughRepository} from './../repositories/post-photo-through.repository';

export class PostController {
  constructor(
    @repository(PostRepository)
    public postRepository: PostRepository,
    @repository(PostPhotoThroughRepository)
    public postPhotoThroughRepository: PostPhotoThroughRepository,
    @repository(PostVideoThroughRepository)
    public postVideoThroughRepository: PostVideoThroughRepository,
    @repository(PostAudioThroughRepository)
    public postAudioThroughRepository: PostAudioThroughRepository,
  ) { }

  @post('/posts', {
    responses: {
      '200': {
        description: 'Post model instance',
        content: {'application/json': {schema: getModelSchemaRef(Post)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POST['create'])
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Post, {
            title: 'NewPost',
            exclude: ['id', 'photos', 'documents', 'videos', 'audios'],
          }),
        },
      },
    })
    post: Omit<Post, 'id'>,
  ): Promise<Post> {
    return this.postRepository.create(post);
  }

  @get('/posts/count', {
    responses: {
      '200': {
        description: 'Post model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(Post) where?: Where<Post>,
  ): Promise<number> {
    return (await this.postRepository.count(where)).count;
  }

  @get('/posts', {
    responses: {
      '200': {
        description: 'Array of Post model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(Post, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(Post) filter?: Filter<Post>,
  ): Promise<Post[]> {
    const posts = await this.postRepository.find(filter);
    // load through relations
    for (const post of posts) {
      if (!post.photos) {
        post.photos = [];
      }
      post.photos = post.photos.concat(await this.postRepository.photosThrough(post.id).find())


      if (!post.audios) {
        post.audios = [];
      }
      post.audios = post.audios.concat(await this.postRepository.audioThrough(post.id).find())


      if (!post.videos) {
        post.videos = [];
      }
      post.videos = post.videos.concat(await this.postRepository.videosThrough(post.id).find())


      if (!post.documents) {
        post.documents = [];
      }
      post.documents = post.documents.concat(await this.postRepository.documentsThrough(post.id).find())


    }
    console.log();
    // })
    return posts;
  }

  // @patch('/posts', {
  //   responses: {
  //     '200': {
  //       description: 'Post PATCH success count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })

  // async updateAll(
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(Post, {partial: true}),
  //       },
  //     },
  //   })
  //   post: Post,
  //   @param.where(Post) where?: Where<Post>,
  // ): Promise<Count> {
  //   return this.postRepository.updateAll(post, where);
  // }

  @get('/posts/{id}', {
    responses: {
      '200': {
        description: 'Post model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Post, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Post, {exclude: 'where'}) filter?: FilterExcludingWhere<Post>
  ): Promise<Post> {
    return this.postRepository.findById(id, filter);
  }

  @patch('/posts/{id}', {
    responses: {
      '204': {
        description: 'Post PATCH success',
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POST['update-by-id'])
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Post, {partial: true}),
        },
      },
    })
    post: Post,
  ): Promise<void> {
    await this.postRepository.updateById(id, post);
  }

  // @put('/posts/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'Post PUT success',
  //     },
  //   },
  // })
  // async replaceById(
  //   @param.path.number('id') id: number,
  //   @requestBody() post: Post,
  // ): Promise<void> {
  //   await this.postRepository.replaceById(id, post);
  // }

  @del('/posts/{id}', {
    responses: {
      '204': {
        description: 'Post DELETE success',
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POST['delete-by-id'])
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.postRepository.deleteById(id);
  }
}

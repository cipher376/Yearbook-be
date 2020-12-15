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
import {ACL_MEDIA} from '../acls/media.acl';
import {
  Post,

  Video
} from '../models';
import {PostRepository} from '../repositories';

export class PostVideoController {
  constructor(
    @repository(PostRepository) protected postRepository: PostRepository,
  ) { }

  @get('/posts/{id}/videos', {
    responses: {
      '200': {
        description: 'Array of Post has many Video through PostVideoThrough',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Video)},
          },
        },
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_MEDIA['list-all'])
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Video>,
  ): Promise<Video[]> {
    return this.postRepository.videosThrough(id).find(filter);
  }

  @post('/posts/{id}/videos', {
    responses: {
      '200': {
        description: 'create a Video model instance',
        content: {'application/json': {schema: getModelSchemaRef(Video)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_MEDIA['create'])
  async create(
    @param.path.number('id') id: typeof Post.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Video, {
            title: 'NewVideoInPost',
            exclude: ['id'],
          }),
        },
      },
    }) video: Omit<Video, 'id'>,
  ): Promise<Video> {
    return this.postRepository.videosThrough(id).create(video);
  }

  @patch('/posts/{id}/videos', {
    responses: {
      '200': {
        description: 'Post.Video PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_MEDIA['update-by-id'])
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Video, {partial: true}),
        },
      },
    })
    video: Partial<Video>,
    @param.query.object('where', getWhereSchemaFor(Video)) where?: Where<Video>,
  ): Promise<Count> {
    return this.postRepository.videosThrough(id).patch(video, where);
  }

  @del('/posts/{id}/videos', {
    responses: {
      '200': {
        description: 'Post.Video DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_MEDIA['delete-by-id'])
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Video)) where?: Where<Video>,
  ): Promise<Count> {
    return this.postRepository.videosThrough(id).delete(where);
  }
}

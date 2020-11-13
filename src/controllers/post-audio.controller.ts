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
Post,
PostAudioThrough,
Audio,
} from '../models';
import {PostRepository} from '../repositories';

export class PostAudioController {
  constructor(
    @repository(PostRepository) protected postRepository: PostRepository,
  ) { }

  @get('/posts/{id}/audio', {
    responses: {
      '200': {
        description: 'Array of Post has many Audio through PostAudioThrough',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Audio)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Audio>,
  ): Promise<Audio[]> {
    return this.postRepository.audioThrough(id).find(filter);
  }

  @post('/posts/{id}/audio', {
    responses: {
      '200': {
        description: 'create a Audio model instance',
        content: {'application/json': {schema: getModelSchemaRef(Audio)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof Post.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Audio, {
            title: 'NewAudioInPost',
            exclude: ['id'],
          }),
        },
      },
    }) audio: Omit<Audio, 'id'>,
  ): Promise<Audio> {
    return this.postRepository.audioThrough(id).create(audio);
  }

  @patch('/posts/{id}/audio', {
    responses: {
      '200': {
        description: 'Post.Audio PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Audio, {partial: true}),
        },
      },
    })
    audio: Partial<Audio>,
    @param.query.object('where', getWhereSchemaFor(Audio)) where?: Where<Audio>,
  ): Promise<Count> {
    return this.postRepository.audioThrough(id).patch(audio, where);
  }

  @del('/posts/{id}/audio', {
    responses: {
      '200': {
        description: 'Post.Audio DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Audio)) where?: Where<Audio>,
  ): Promise<Count> {
    return this.postRepository.audioThrough(id).delete(where);
  }
}

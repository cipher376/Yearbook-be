import {authenticate} from '@loopback/authentication';
import {
  repository
} from '@loopback/repository';
import {
  del, getModelSchemaRef, param, post,






  requestBody
} from '@loopback/rest';
import {PostAudioThrough} from '../models';
import {PostAudioThroughRepository} from '../repositories';

export class PostAudioThroughController {
  constructor(
    @repository(PostAudioThroughRepository)
    public postAudioThroughRepository: PostAudioThroughRepository,
  ) { }

  @post('/link-post-to-audio', {
    responses: {
      '200': {
        description: 'PostAudioThrough model instance',
        content: {'application/json': {schema: getModelSchemaRef(PostAudioThrough)}},
      },
    },
  })
  @authenticate("jwt")
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PostAudioThrough, {
            title: 'NewPostAudioThrough',
            exclude: ['id'],
          }),
        },
      },
    })
    postAudioThrough: Omit<PostAudioThrough, 'id'>,
  ): Promise<PostAudioThrough> {
    return this.postAudioThroughRepository.create(postAudioThrough);
  }
  @post('/link-post-to-audio-many', {
    responses: {
      '200': {
        description: 'Link audio to post',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              "items": getModelSchemaRef(PostAudioThrough, {includeRelations: false})
            }
          },
        },
      }
    }
  })
  @authenticate("jwt")
  // @authorize(ACL_USER['create-many'])
  async createMany(
    @requestBody({
      content: {
        'application/json': {
          schema: {
            type: 'array',
            "items": getModelSchemaRef(PostAudioThrough, {includeRelations: false})
          }
        },
      },
    }) postAudioLinks: Omit<PostAudioThrough, 'id'>[]) {
    console.log(postAudioLinks);
    try {
      return this.postAudioThroughRepository.createAll(postAudioLinks);
    } catch (error) {
      console.log(error);
    }
  }

  // @get('/post-audio-throughs/count', {
  //   responses: {
  //     '200': {
  //       description: 'PostAudioThrough model count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async count(
  //   @param.where(PostAudioThrough) where?: Where<PostAudioThrough>,
  // ): Promise<Count> {
  //   return this.postAudioThroughRepository.count(where);
  // }

  // @get('/post-audio-throughs', {
  //   responses: {
  //     '200': {
  //       description: 'Array of PostAudioThrough model instances',
  //       content: {
  //         'application/json': {
  //           schema: {
  //             type: 'array',
  //             items: getModelSchemaRef(PostAudioThrough, {includeRelations: true}),
  //           },
  //         },
  //       },
  //     },
  //   },
  // })
  // async find(
  //   @param.filter(PostAudioThrough) filter?: Filter<PostAudioThrough>,
  // ): Promise<PostAudioThrough[]> {
  //   return this.postAudioThroughRepository.find(filter);
  // }

  // @patch('/post-audio-throughs', {
  //   responses: {
  //     '200': {
  //       description: 'PostAudioThrough PATCH success count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async updateAll(
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(PostAudioThrough, {partial: true}),
  //       },
  //     },
  //   })
  //   postAudioThrough: PostAudioThrough,
  //   @param.where(PostAudioThrough) where?: Where<PostAudioThrough>,
  // ): Promise<Count> {
  //   return this.postAudioThroughRepository.updateAll(postAudioThrough, where);
  // }

  // @get('/post-audio-throughs/{id}', {
  //   responses: {
  //     '200': {
  //       description: 'PostAudioThrough model instance',
  //       content: {
  //         'application/json': {
  //           schema: getModelSchemaRef(PostAudioThrough, {includeRelations: true}),
  //         },
  //       },
  //     },
  //   },
  // })
  // async findById(
  //   @param.path.number('id') id: number,
  //   @param.filter(PostAudioThrough, {exclude: 'where'}) filter?: FilterExcludingWhere<PostAudioThrough>
  // ): Promise<PostAudioThrough> {
  //   return this.postAudioThroughRepository.findById(id, filter);
  // }

  // @patch('/post-audio-throughs/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'PostAudioThrough PATCH success',
  //     },
  //   },
  // })
  // async updateById(
  //   @param.path.number('id') id: number,
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(PostAudioThrough, {partial: true}),
  //       },
  //     },
  //   })
  //   postAudioThrough: PostAudioThrough,
  // ): Promise<void> {
  //   await this.postAudioThroughRepository.updateById(id, postAudioThrough);
  // }

  // @put('/post-audio-throughs/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'PostAudioThrough PUT success',
  //     },
  //   },
  // })
  // async replaceById(
  //   @param.path.number('id') id: number,
  //   @requestBody() postAudioThrough: PostAudioThrough,
  // ): Promise<void> {
  //   await this.postAudioThroughRepository.replaceById(id, postAudioThrough);
  // }

  @del('/post-audio-links/{id}', {
    responses: {
      '204': {
        description: 'PostAudioThrough DELETE success',
      },
    },
  })
  @authenticate("jwt")
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.postAudioThroughRepository.deleteById(id);
  }
}

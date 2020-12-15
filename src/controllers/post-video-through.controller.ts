import {authenticate} from '@loopback/authentication';
import {authorize} from '@loopback/authorization/dist/decorators/authorize';
import {
  repository
} from '@loopback/repository';
import {
  del, getModelSchemaRef, param, post,
  requestBody
} from '@loopback/rest';
import {PostVideoThrough} from '../models';
import {PostVideoThroughRepository} from '../repositories';
import {ACL_MEDIA} from './../acls/media.acl';

export class PostVideoThroughController {
  constructor(
    @repository(PostVideoThroughRepository)
    public postVideoThroughRepository: PostVideoThroughRepository,
  ) { }

  @post('/link-post-to-video', {
    responses: {
      '200': {
        description: 'PostVideoThrough model instance',
        content: {'application/json': {schema: getModelSchemaRef(PostVideoThrough)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_MEDIA['create'])
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PostVideoThrough, {
            title: 'NewPostVideoThrough',
            exclude: ['id'],
          }),
        },
      },
    })
    postVideoThrough: Omit<PostVideoThrough, 'id'>,
  ): Promise<PostVideoThrough> {
    return this.postVideoThroughRepository.create(postVideoThrough);
  }
  @post('/link-post-to-video-many', {
    responses: {
      '200': {
        description: 'Link video to post',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              "items": getModelSchemaRef(PostVideoThrough, {includeRelations: false})
            }
          },
        },
      }
    }
  })
  @authenticate("jwt")
  @authorize(ACL_MEDIA['create'])
  async createMany(
    @requestBody({
      content: {
        'application/json': {
          schema: {
            type: 'array',
            "items": getModelSchemaRef(PostVideoThrough, {includeRelations: false})
          }
        },
      },
    }) postVideoLinks: Omit<PostVideoThrough, 'id'>[]) {
    console.log(postVideoLinks);
    try {
      return this.postVideoThroughRepository.createAll(postVideoLinks);
    } catch (error) {
      console.log(error);
    }
  }
  // @get('/post-video-throughs/count', {
  //   responses: {
  //     '200': {
  //       description: 'PostVideoThrough model count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async count(
  //   @param.where(PostVideoThrough) where?: Where<PostVideoThrough>,
  // ): Promise<Count> {
  //   return this.postVideoThroughRepository.count(where);
  // }

  // @get('/post-video-throughs', {
  //   responses: {
  //     '200': {
  //       description: 'Array of PostVideoThrough model instances',
  //       content: {
  //         'application/json': {
  //           schema: {
  //             type: 'array',
  //             items: getModelSchemaRef(PostVideoThrough, {includeRelations: true}),
  //           },
  //         },
  //       },
  //     },
  //   },
  // })
  // async find(
  //   @param.filter(PostVideoThrough) filter?: Filter<PostVideoThrough>,
  // ): Promise<PostVideoThrough[]> {
  //   return this.postVideoThroughRepository.find(filter);
  // }

  // @patch('/post-video-throughs', {
  //   responses: {
  //     '200': {
  //       description: 'PostVideoThrough PATCH success count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async updateAll(
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(PostVideoThrough, {partial: true}),
  //       },
  //     },
  //   })
  //   postVideoThrough: PostVideoThrough,
  //   @param.where(PostVideoThrough) where?: Where<PostVideoThrough>,
  // ): Promise<Count> {
  //   return this.postVideoThroughRepository.updateAll(postVideoThrough, where);
  // }

  // @get('/post-video-throughs/{id}', {
  //   responses: {
  //     '200': {
  //       description: 'PostVideoThrough model instance',
  //       content: {
  //         'application/json': {
  //           schema: getModelSchemaRef(PostVideoThrough, {includeRelations: true}),
  //         },
  //       },
  //     },
  //   },
  // })
  // async findById(
  //   @param.path.number('id') id: number,
  //   @param.filter(PostVideoThrough, {exclude: 'where'}) filter?: FilterExcludingWhere<PostVideoThrough>
  // ): Promise<PostVideoThrough> {
  //   return this.postVideoThroughRepository.findById(id, filter);
  // }

  // @patch('/post-video-throughs/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'PostVideoThrough PATCH success',
  //     },
  //   },
  // })
  // async updateById(
  //   @param.path.number('id') id: number,
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(PostVideoThrough, {partial: true}),
  //       },
  //     },
  //   })
  //   postVideoThrough: PostVideoThrough,
  // ): Promise<void> {
  //   await this.postVideoThroughRepository.updateById(id, postVideoThrough);
  // }

  // @put('/post-video-throughs/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'PostVideoThrough PUT success',
  //     },
  //   },
  // })
  // async replaceById(
  //   @param.path.number('id') id: number,
  //   @requestBody() postVideoThrough: PostVideoThrough,
  // ): Promise<void> {
  //   await this.postVideoThroughRepository.replaceById(id, postVideoThrough);
  // }

  @del('/post-video-links/{id}', {
    responses: {
      '204': {
        description: 'PostVideoThrough DELETE success',
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_MEDIA['delete-by-id'])
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.postVideoThroughRepository.deleteById(id);
  }
}

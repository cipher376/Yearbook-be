import {authenticate} from '@loopback/authentication';
import {authorize} from '@loopback/authorization';
import {
  repository
} from '@loopback/repository';
import {
  del, getModelSchemaRef, param, post,
  requestBody
} from '@loopback/rest';
import {ACL_PHOTO} from '../acls/photo.acl';
import {PostPhotoThrough} from '../models';
import {PostPhotoThroughRepository} from '../repositories';

export class PostPhotoThroughController {
  constructor(
    @repository(PostPhotoThroughRepository)
    public postPhotoThroughRepository: PostPhotoThroughRepository,
  ) { }

  @post('/link-post-to-photo', {
    responses: {
      '200': {
        description: 'PostPhotoThrough model instance',
        content: {'application/json': {schema: getModelSchemaRef(PostPhotoThrough)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_PHOTO['create'])
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PostPhotoThrough, {
            title: 'NewPostPhotoThrough',
            exclude: ['id'],
          }),
        },
      },
    })
    postPhotoThrough: Omit<PostPhotoThrough, 'id'>,
  ): Promise<PostPhotoThrough> {
    return this.postPhotoThroughRepository.create(postPhotoThrough);
  }

  @post('/link-post-to-photo-many', {
    responses: {
      '200': {
        description: 'Link photo to post',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              "items": getModelSchemaRef(PostPhotoThrough, {includeRelations: false})
            }
          },
        },
      }
    }
  })
  @authenticate("jwt")
  @authorize(ACL_PHOTO['create-many'])
  async createMany(
    @requestBody({
      content: {
        'application/json': {
          schema: {
            type: 'array',
            "items": getModelSchemaRef(PostPhotoThrough, {includeRelations: false})
          }
        },
      },
    }) postPhotoLinks: Omit<PostPhotoThrough, 'id'>[]) {
    console.log(postPhotoLinks);
    try {
      return await this.postPhotoThroughRepository.createAll(postPhotoLinks);
    } catch (error) {
      console.log(error);
    }
  }

  // @get('/post-photo-through/count', {
  //   responses: {
  //     '200': {
  //       description: 'PostPhotoThrough model count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async count(
  //   @param.where(PostPhotoThrough) where?: Where<PostPhotoThrough>,
  // ): Promise<Count> {
  //   return this.postPhotoThroughRepository.count(where);
  // }

  // @get('/post-photo-through', {
  //   responses: {
  //     '200': {
  //       description: 'Array of PostPhotoThrough model instances',
  //       content: {
  //         'application/json': {
  //           schema: {
  //             type: 'array',
  //             items: getModelSchemaRef(PostPhotoThrough, {includeRelations: true}),
  //           },
  //         },
  //       },
  //     },
  //   },
  // })
  // async find(
  //   @param.filter(PostPhotoThrough) filter?: Filter<PostPhotoThrough>,
  // ): Promise<PostPhotoThrough[]> {
  //   return this.postPhotoThroughRepository.find(filter);
  // }

  // @patch('/post-photo-through', {
  //   responses: {
  //     '200': {
  //       description: 'PostPhotoThrough PATCH success count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async updateAll(
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(PostPhotoThrough, {partial: true}),
  //       },
  //     },
  //   })
  //   postPhotoThrough: PostPhotoThrough,
  //   @param.where(PostPhotoThrough) where?: Where<PostPhotoThrough>,
  // ): Promise<Count> {
  //   return this.postPhotoThroughRepository.updateAll(postPhotoThrough, where);
  // }

  // @get('/post-photo-through/{id}', {
  //   responses: {
  //     '200': {
  //       description: 'PostPhotoThrough model instance',
  //       content: {
  //         'application/json': {
  //           schema: getModelSchemaRef(PostPhotoThrough, {includeRelations: true}),
  //         },
  //       },
  //     },
  //   },
  // })
  // async findById(
  //   @param.path.number('id') id: number,
  //   @param.filter(PostPhotoThrough, {exclude: 'where'}) filter?: FilterExcludingWhere<PostPhotoThrough>
  // ): Promise<PostPhotoThrough> {
  //   return this.postPhotoThroughRepository.findById(id, filter);
  // }

  // @patch('/post-photo-through/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'PostPhotoThrough PATCH success',
  //     },
  //   },
  // })
  // async updateById(
  //   @param.path.number('id') id: number,
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(PostPhotoThrough, {partial: true}),
  //       },
  //     },
  //   })
  //   postPhotoThrough: PostPhotoThrough,
  // ): Promise<void> {
  //   await this.postPhotoThroughRepository.updateById(id, postPhotoThrough);
  // }

  // @put('/post-photo-through/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'PostPhotoThrough PUT success',
  //     },
  //   },
  // })
  // async replaceById(
  //   @param.path.number('id') id: number,
  //   @requestBody() postPhotoThrough: PostPhotoThrough,
  // ): Promise<void> {
  //   await this.postPhotoThroughRepository.replaceById(id, postPhotoThrough);
  // }


  @del('/post-to-photo-link/{id}', {
    responses: {
      '204': {
        description: 'PostPhotoThrough DELETE success',
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_PHOTO['delete-by-id'])
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.postPhotoThroughRepository.deleteById(id);
  }
}

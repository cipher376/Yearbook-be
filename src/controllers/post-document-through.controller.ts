import {authenticate} from '@loopback/authentication';
import {
  repository
} from '@loopback/repository';
import {
  del, getModelSchemaRef, param, post,






  requestBody
} from '@loopback/rest';
import {PostDocumentThrough} from '../models';
import {PostDocumentThroughRepository} from '../repositories';

export class PostDocumentThroughController {
  constructor(
    @repository(PostDocumentThroughRepository)
    public postDocumentThroughRepository: PostDocumentThroughRepository,
  ) { }

  @post('/post-document-throughs', {
    responses: {
      '200': {
        description: 'PostDocumentThrough model instance',
        content: {'application/json': {schema: getModelSchemaRef(PostDocumentThrough)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PostDocumentThrough, {
            title: 'NewPostDocumentThrough',
            exclude: ['id'],
          }),
        },
      },
    })
    postDocumentThrough: Omit<PostDocumentThrough, 'id'>,
  ): Promise<PostDocumentThrough> {
    return this.postDocumentThroughRepository.create(postDocumentThrough);
  }

  @post('/link-post-to-document-many', {
    responses: {
      '200': {
        description: 'Link document to post',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              "items": getModelSchemaRef(PostDocumentThrough, {includeRelations: false})
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
            "items": getModelSchemaRef(PostDocumentThrough, {includeRelations: false})
          }
        },
      },
    }) postDocumentLinks: Omit<PostDocumentThrough, 'id'>[]) {
    console.log(postDocumentLinks);
    try {
      return this.postDocumentThroughRepository.createAll(postDocumentLinks);
    } catch (error) {
      console.log(error);
    }
  }

  // @get('/post-document-throughs/count', {
  //   responses: {
  //     '200': {
  //       description: 'PostDocumentThrough model count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async count(
  //   @param.where(PostDocumentThrough) where?: Where<PostDocumentThrough>,
  // ): Promise<Count> {
  //   return this.postDocumentThroughRepository.count(where);
  // }

  // @get('/post-document-throughs', {
  //   responses: {
  //     '200': {
  //       description: 'Array of PostDocumentThrough model instances',
  //       content: {
  //         'application/json': {
  //           schema: {
  //             type: 'array',
  //             items: getModelSchemaRef(PostDocumentThrough, {includeRelations: true}),
  //           },
  //         },
  //       },
  //     },
  //   },
  // })
  // async find(
  //   @param.filter(PostDocumentThrough) filter?: Filter<PostDocumentThrough>,
  // ): Promise<PostDocumentThrough[]> {
  //   return this.postDocumentThroughRepository.find(filter);
  // }

  // @patch('/post-document-throughs', {
  //   responses: {
  //     '200': {
  //       description: 'PostDocumentThrough PATCH success count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async updateAll(
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(PostDocumentThrough, {partial: true}),
  //       },
  //     },
  //   })
  //   postDocumentThrough: PostDocumentThrough,
  //   @param.where(PostDocumentThrough) where?: Where<PostDocumentThrough>,
  // ): Promise<Count> {
  //   return this.postDocumentThroughRepository.updateAll(postDocumentThrough, where);
  // }

  // @get('/post-document-throughs/{id}', {
  //   responses: {
  //     '200': {
  //       description: 'PostDocumentThrough model instance',
  //       content: {
  //         'application/json': {
  //           schema: getModelSchemaRef(PostDocumentThrough, {includeRelations: true}),
  //         },
  //       },
  //     },
  //   },
  // })
  // async findById(
  //   @param.path.number('id') id: number,
  //   @param.filter(PostDocumentThrough, {exclude: 'where'}) filter?: FilterExcludingWhere<PostDocumentThrough>
  // ): Promise<PostDocumentThrough> {
  //   return this.postDocumentThroughRepository.findById(id, filter);
  // }

  // @patch('/post-document-throughs/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'PostDocumentThrough PATCH success',
  //     },
  //   },
  // })
  // async updateById(
  //   @param.path.number('id') id: number,
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(PostDocumentThrough, {partial: true}),
  //       },
  //     },
  //   })
  //   postDocumentThrough: PostDocumentThrough,
  // ): Promise<void> {
  //   await this.postDocumentThroughRepository.updateById(id, postDocumentThrough);
  // }

  // @put('/post-document-throughs/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'PostDocumentThrough PUT success',
  //     },
  //   },
  // })
  // async replaceById(
  //   @param.path.number('id') id: number,
  //   @requestBody() postDocumentThrough: PostDocumentThrough,
  // ): Promise<void> {
  //   await this.postDocumentThroughRepository.replaceById(id, postDocumentThrough);
  // }

  @del('/post-document-links/{id}', {
    responses: {
      '204': {
        description: 'PostDocumentThrough DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.postDocumentThroughRepository.deleteById(id);
  }
}

import {authenticate} from '@loopback/authentication';
import {authorize} from '@loopback/authorization';
import {
  Count,
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
import {ACL_LIKE} from '../acls/like.acl';
import {LikeThrough} from '../models';
import {LikeThroughRepository} from '../repositories';

export class LikeController {
  constructor(
    @repository(LikeThroughRepository)
    public likeThroughRepository: LikeThroughRepository,
  ) { }

  @post('/likes', {
    responses: {
      '200': {
        description: 'LikeThrough model instance',
        content: {'application/json': {schema: getModelSchemaRef(LikeThrough)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_LIKE['create'])
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(LikeThrough, {
            title: 'NewLikeThrough',
            exclude: ['id'],
          }),
        },
      },
    })
    likeThrough: Omit<LikeThrough, 'id'>,
  ): Promise<LikeThrough> {
    return this.likeThroughRepository.create(likeThrough);
  }



  @get('/likes/count', {
    responses: {
      '200': {
        description: 'LikeThrough model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(LikeThrough) where?: Where<LikeThrough>,
  ): Promise<Count> {
    return this.likeThroughRepository.count(where);
  }




  @get('/likes', {
    responses: {
      '200': {
        description: 'Array of LikeThrough model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(LikeThrough, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(LikeThrough) filter?: Filter<LikeThrough>,
  ): Promise<LikeThrough[]> {
    return this.likeThroughRepository.find(filter);
  }

  // @patch('/like-throughs', {
  //   responses: {
  //     '200': {
  //       description: 'LikeThrough PATCH success count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async updateAll(
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(LikeThrough, {partial: true}),
  //       },
  //     },
  //   })
  //   likeThrough: LikeThrough,
  //   @param.where(LikeThrough) where?: Where<LikeThrough>,
  // ): Promise<Count> {
  //   return this.likeThroughRepository.updateAll(likeThrough, where);
  // }

  @get('/likes/{id}', {
    responses: {
      '200': {
        description: 'LikeThrough model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(LikeThrough, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(LikeThrough, {exclude: 'where'}) filter?: FilterExcludingWhere<LikeThrough>
  ): Promise<LikeThrough> {
    return this.likeThroughRepository.findById(id, filter);
  }

  @patch('/likes/{id}', {
    responses: {
      '204': {
        description: 'LikeThrough PATCH success',
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_LIKE['update-by-id'])
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(LikeThrough, {partial: true}),
        },
      },
    })
    likeThrough: LikeThrough,
  ): Promise<void> {
    await this.likeThroughRepository.updateById(id, likeThrough);
  }

  // @put('/like-throughs/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'LikeThrough PUT success',
  //     },
  //   },
  // })
  // async replaceById(
  //   @param.path.number('id') id: number,
  //   @requestBody() likeThrough: LikeThrough,
  // ): Promise<void> {
  //   await this.likeThroughRepository.replaceById(id, likeThrough);
  // }
  @authenticate("jwt")
  @authorize(ACL_LIKE['delete-by-id'])
  @del('/likes/{id}', {
    responses: {
      '204': {
        description: 'LikeThrough DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.likeThroughRepository.deleteById(id);
  }
}

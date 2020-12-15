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
import {FollowThrough} from '../models';
import {FollowThroughRepository} from '../repositories';
import {ACL_FOLLOW} from './../acls/follow.acl';

export class FollowController {
  constructor(
    @repository(FollowThroughRepository)
    public followThroughRepository: FollowThroughRepository,
  ) { }

  @post('/follows', {
    responses: {
      '200': {
        description: 'FollowThrough model instance',
        content: {'application/json': {schema: getModelSchemaRef(FollowThrough)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_FOLLOW['create'])
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(FollowThrough, {
            title: 'NewFollowThrough',
            exclude: ['id'],
          }),
        },
      },
    })
    followThrough: Omit<FollowThrough, 'id'>,
  ): Promise<FollowThrough> {
    return this.followThroughRepository.create(followThrough);
  }

  @get('/follows/count', {
    responses: {
      '200': {
        description: 'FollowThrough model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_FOLLOW['count'])
  async count(
    @param.where(FollowThrough) where?: Where<FollowThrough>,
  ): Promise<Count> {
    return this.followThroughRepository.count(where);
  }

  @get('/follows', {
    responses: {
      '200': {
        description: 'Array of FollowThrough model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(FollowThrough, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  // @authenticate("jwt")
  // @authorize(ACL_FOLLOW['list-all'])
  async find(
    @param.filter(FollowThrough) filter?: Filter<FollowThrough>,
  ): Promise<FollowThrough[]> {
    return this.followThroughRepository.find(filter);
  }



  @get('/follows/{id}', {
    responses: {
      '200': {
        description: 'FollowThrough model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(FollowThrough, {includeRelations: true}),
          },
        },
      },
    },
  })
  // @authenticate("jwt")
  // @authorize(ACL_FOLLOW['find-by-id'])
  async findById(
    @param.path.number('id') id: number,
    @param.filter(FollowThrough, {exclude: 'where'}) filter?: FilterExcludingWhere<FollowThrough>
  ): Promise<FollowThrough> {
    return this.followThroughRepository.findById(id, filter);
  }

  @patch('/follows/{id}', {
    responses: {
      '204': {
        description: 'FollowThrough PATCH success',
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_FOLLOW['update-by-id'])
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(FollowThrough, {partial: true}),
        },
      },
    })
    followThrough: FollowThrough,
  ): Promise<void> {
    await this.followThroughRepository.updateById(id, followThrough);
  }



  @del('/follows/{id}', {
    responses: {
      '204': {
        description: 'FollowThrough DELETE success',
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_FOLLOW['delete-by-id'])
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.followThroughRepository.deleteById(id);
  }
}

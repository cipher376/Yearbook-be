import {
  Count,
  CountSchema,
  Filter,
  FilterExcludingWhere,
  repository,
  Where,
} from '@loopback/repository';
import {
  post,
  param,
  get,
  getModelSchemaRef,
  patch,
  put,
  del,
  requestBody,
} from '@loopback/rest';
import {PushTopic} from '../models';
import {PushTopicRepository} from '../repositories';

export class PushTopicController {
  constructor(
    @repository(PushTopicRepository)
    public pushTopicRepository : PushTopicRepository,
  ) {}

  @post('/topics', {
    responses: {
      '200': {
        description: 'PushTopic model instance',
        content: {'application/json': {schema: getModelSchemaRef(PushTopic)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PushTopic, {
            title: 'NewPushTopic',
            exclude: ['id'],
          }),
        },
      },
    })
    pushTopic: Omit<PushTopic, 'id'>,
  ): Promise<PushTopic> {
    return this.pushTopicRepository.create(pushTopic);
  }

  @get('/topics/count', {
    responses: {
      '200': {
        description: 'PushTopic model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(PushTopic) where?: Where<PushTopic>,
  ): Promise<Count> {
    return this.pushTopicRepository.count(where);
  }

  @get('/topics', {
    responses: {
      '200': {
        description: 'Array of PushTopic model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(PushTopic, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(PushTopic) filter?: Filter<PushTopic>,
  ): Promise<PushTopic[]> {
    return this.pushTopicRepository.find(filter);
  }

  @patch('/topics', {
    responses: {
      '200': {
        description: 'PushTopic PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PushTopic, {partial: true}),
        },
      },
    })
    pushTopic: PushTopic,
    @param.where(PushTopic) where?: Where<PushTopic>,
  ): Promise<Count> {
    return this.pushTopicRepository.updateAll(pushTopic, where);
  }

  @get('/topics/{id}', {
    responses: {
      '200': {
        description: 'PushTopic model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(PushTopic, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(PushTopic, {exclude: 'where'}) filter?: FilterExcludingWhere<PushTopic>
  ): Promise<PushTopic> {
    return this.pushTopicRepository.findById(id, filter);
  }

  @patch('/topics/{id}', {
    responses: {
      '204': {
        description: 'PushTopic PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PushTopic, {partial: true}),
        },
      },
    })
    pushTopic: PushTopic,
  ): Promise<void> {
    await this.pushTopicRepository.updateById(id, pushTopic);
  }

  @put('/topics/{id}', {
    responses: {
      '204': {
        description: 'PushTopic PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() pushTopic: PushTopic,
  ): Promise<void> {
    await this.pushTopicRepository.replaceById(id, pushTopic);
  }

  @del('/topics/{id}', {
    responses: {
      '204': {
        description: 'PushTopic DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.pushTopicRepository.deleteById(id);
  }
}

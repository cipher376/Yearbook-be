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
Device,
DeviceTopicThrough,
PushTopic,
} from '../models';
import {DeviceRepository} from '../repositories';

export class DevicePushTopicController {
  constructor(
    @repository(DeviceRepository) protected deviceRepository: DeviceRepository,
  ) { }

  @get('/devices/{id}/push-topics', {
    responses: {
      '200': {
        description: 'Array of Device has many PushTopic through DeviceTopicThrough',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(PushTopic)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<PushTopic>,
  ): Promise<PushTopic[]> {
    return this.deviceRepository.topics(id).find(filter);
  }

  @post('/devices/{id}/push-topics', {
    responses: {
      '200': {
        description: 'create a PushTopic model instance',
        content: {'application/json': {schema: getModelSchemaRef(PushTopic)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof Device.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PushTopic, {
            title: 'NewPushTopicInDevice',
            exclude: ['id'],
          }),
        },
      },
    }) pushTopic: Omit<PushTopic, 'id'>,
  ): Promise<PushTopic> {
    return this.deviceRepository.topics(id).create(pushTopic);
  }

  @patch('/devices/{id}/push-topics', {
    responses: {
      '200': {
        description: 'Device.PushTopic PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PushTopic, {partial: true}),
        },
      },
    })
    pushTopic: Partial<PushTopic>,
    @param.query.object('where', getWhereSchemaFor(PushTopic)) where?: Where<PushTopic>,
  ): Promise<Count> {
    return this.deviceRepository.topics(id).patch(pushTopic, where);
  }

  @del('/devices/{id}/push-topics', {
    responses: {
      '200': {
        description: 'Device.PushTopic DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(PushTopic)) where?: Where<PushTopic>,
  ): Promise<Count> {
    return this.deviceRepository.topics(id).delete(where);
  }
}

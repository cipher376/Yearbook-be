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
PushTopic,
DeviceTopicThrough,
Device,
} from '../models';
import {PushTopicRepository} from '../repositories';

export class PushTopicDeviceController {
  constructor(
    @repository(PushTopicRepository) protected pushTopicRepository: PushTopicRepository,
  ) { }

  @get('/push-topics/{id}/devices', {
    responses: {
      '200': {
        description: 'Array of PushTopic has many Device through DeviceTopicThrough',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Device)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Device>,
  ): Promise<Device[]> {
    return this.pushTopicRepository.devices(id).find(filter);
  }

  @post('/push-topics/{id}/devices', {
    responses: {
      '200': {
        description: 'create a Device model instance',
        content: {'application/json': {schema: getModelSchemaRef(Device)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof PushTopic.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Device, {
            title: 'NewDeviceInPushTopic',
            exclude: ['id'],
          }),
        },
      },
    }) device: Omit<Device, 'id'>,
  ): Promise<Device> {
    return this.pushTopicRepository.devices(id).create(device);
  }

  @patch('/push-topics/{id}/devices', {
    responses: {
      '200': {
        description: 'PushTopic.Device PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Device, {partial: true}),
        },
      },
    })
    device: Partial<Device>,
    @param.query.object('where', getWhereSchemaFor(Device)) where?: Where<Device>,
  ): Promise<Count> {
    return this.pushTopicRepository.devices(id).patch(device, where);
  }

  @del('/push-topics/{id}/devices', {
    responses: {
      '200': {
        description: 'PushTopic.Device DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Device)) where?: Where<Device>,
  ): Promise<Count> {
    return this.pushTopicRepository.devices(id).delete(where);
  }
}

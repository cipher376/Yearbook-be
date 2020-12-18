import {Entity, model, property} from '@loopback/repository';

@model()
export class DeviceTopicThrough extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'number',
    required: true,
  })
  deviceId: number;

  @property({
    type: 'number',
    required: true,
  })
  topicId: number;


  constructor(data?: Partial<DeviceTopicThrough>) {
    super(data);
  }
}

export interface DeviceTopicThroughRelations {
  // describe navigational properties here
}

export type DeviceTopicThroughWithRelations = DeviceTopicThrough & DeviceTopicThroughRelations;

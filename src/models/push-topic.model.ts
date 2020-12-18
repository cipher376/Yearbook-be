import {Entity, model, property, hasMany} from '@loopback/repository';
import {PushMessage} from './push-message.model';
import {Device} from './device.model';
import {DeviceTopicThrough} from './device-topic-through.model';

@model()
export class PushTopic extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'string',
    required: true
  })
  name: string;

  @property({
    type: 'string',
    required: true,
  })
  channelId: string;

  @property({
    type: 'date',
    required: true,
    defaultFnx: 'now'
  })
  dateCreated: string;

  @hasMany(() => PushMessage, {keyTo: 'topicId'})
  pushMessages: PushMessage[];

  @hasMany(() => Device, {through: {model: () => DeviceTopicThrough, keyFrom: 'topicId'}})
  devices: Device[];

  constructor(data?: Partial<PushTopic>) {
    super(data);
  }
}

export interface PushTopicRelations {
  // describe navigational properties here
}

export type PushTopicWithRelations = PushTopic & PushTopicRelations;

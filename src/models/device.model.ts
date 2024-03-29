import {belongsTo, Entity, hasMany, model, property} from '@loopback/repository';
import {DeviceTopicThrough} from './device-topic-through.model';
import {PushTopic} from './push-topic.model';
import {User} from './user.model';

@model()
export class Device extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'string',
  })
  token?: string;

  @property({
    type: 'string',
    required: true,
  })
  platform: string;

  @property({
    type: 'string',
  })
  uuid?: string;

  @belongsTo(() => User)
  playerId: number;

  @hasMany(() => PushTopic, {through: {model: () => DeviceTopicThrough, keyTo: 'topicId'}})
  topics: PushTopic[];

  constructor(data?: Partial<Device>) {
    super(data);
  }
}

export interface DeviceRelations {
  // describe navigational properties here
}

export type DeviceWithRelations = Device & DeviceRelations;

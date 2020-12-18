import {belongsTo, Entity, model, property} from '@loopback/repository';
import {PushTopic} from './push-topic.model';

@model()
export class PushMessage extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'string',
    required: true,
  })
  body: string;
  @property({
    type: 'string',
  })
  subject?: string;

  @property({
    type: 'string',
  })
  dateCreated?: string;

  @property({
    type: 'string',
  })
  file?: string;

  @property({
    type: 'array',
    itemType: 'string',
  })
  fileUrls?: string[];
  @property({
    type: 'string',
  })
  channel?: string;

  @belongsTo(() => PushTopic)
  topicId: number;

  constructor(data?: Partial<PushMessage>) {
    super(data);
  }
}

export interface PushMessageRelations {
  // describe navigational properties here
}

export type PushMessageWithRelations = PushMessage & PushMessageRelations;

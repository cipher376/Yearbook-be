import {Entity, model, property} from '@loopback/repository';
import {Message, MessageOptions, MessageType, Receiver} from 'loopback4-notifications';


@model()
export class Notification extends Entity implements Message {

  constructor(data?: Partial<Notification>) {
    super(data);
  }

  @property({
    type: 'number',
    id: true,
    generated: true,

  })
  id?: number;

  @property({
    type: 'string',
    jsonSchema: {
      nullable: true,
    },
  })
  subject?: string;

  @property({
    type: 'string',
    required: true,
  })
  body: string;

  @property({
    type: 'object',
    required: true,
  })
  receiver: Receiver;

  @property({
    type: 'number',
    required: true,
  })
  type: MessageType;

  @property({
    type: 'date',
    name: 'sent',
  })
  sentDate: Date;

  @property({
    type: 'object',
  })
  options?: MessageOptions;

}

export interface NotificationRelations {
  // describe navigational properties here
}

export type NotificationWithRelations = Notification & NotificationRelations;

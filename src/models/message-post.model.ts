import {Entity, model, property, hasOne} from '@loopback/repository';
import {PostConfig} from './post-config.model';

@model()
export class MessagePost extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'string',
  })
  title?: string;

  @property({
    type: 'string',
    required: true,
  })
  message: string;

  @property({
    type: 'number',
  })
  postId?: number;

  @hasOne(() => PostConfig)
  postConfig: PostConfig;
  // @hasOne(() => PostConfig)
  // postConfig: PostConfig;

  constructor(data?: Partial<MessagePost>) {
    super(data);
  }
}

export interface MessagePostRelations {
  // describe navigational properties here
}

export type MessagePostWithRelations = MessagePost & MessagePostRelations;

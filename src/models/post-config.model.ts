import {Entity, model, property, hasOne} from '@loopback/repository';
import {MessagePost} from './message-post.model';

@model()
export class PostConfig extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'boolean',
    default: false,
  })
  isAnnouncement?: boolean;

  @property({
    type: 'boolean',
    default: false,
  })
  isPrivate?: boolean;

  @property({
    type: 'number',
  })
  documentPostId?: number;

  @property({
    type: 'number',
  })
  mediaPostId?: number;

  @hasOne(() => MessagePost)
  messagePost: MessagePost;

  @property({
    type: 'number',
  })
  photoPostId?: number;

  @property({
    type: 'number',
  })
  messagePostId?: number;
  // @property({
  //   type: 'number',
  // })
  // messagePostId?: number;

  constructor(data?: Partial<PostConfig>) {
    super(data);
  }
}

export interface PostConfigRelations {
  // describe navigational properties here
}

export type PostConfigWithRelations = PostConfig & PostConfigRelations;

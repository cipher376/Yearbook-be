import {Entity, model, property} from '@loopback/repository';

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
  postId?: number;

  constructor(data?: Partial<PostConfig>) {
    super(data);
  }


}

export interface PostConfigRelations {
  // describe navigational properties here
}

export type PostConfigWithRelations = PostConfig & PostConfigRelations;

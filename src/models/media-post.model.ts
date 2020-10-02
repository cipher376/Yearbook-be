import {Entity, model, property, hasOne} from '@loopback/repository';
import {PostConfig} from './post-config.model';

@model()
export class MediaPost extends Entity {
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
  mediaType: number;

  @property({
    type: 'string',
    required: true,
  })
  sourceUrl: string;

  @property({
    type: 'string',
  })
  coverUrl?: string;

  @property({
    type: 'string',
  })
  description?: string;

  @property({
    type: 'number',
  })
  postId?: number;

  @hasOne(() => PostConfig)
  postConfig: PostConfig;

  constructor(data?: Partial<MediaPost>) {
    super(data);
  }
}

export interface MediaPostRelations {
  // describe navigational properties here
}

export type MediaPostWithRelations = MediaPost & MediaPostRelations;

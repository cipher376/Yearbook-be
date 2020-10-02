import {Entity, model, property, hasOne} from '@loopback/repository';
import {PostConfig} from './post-config.model';

@model()
export class PhotoPost extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'string',
  })
  legend?: string;

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

  constructor(data?: Partial<PhotoPost>) {
    super(data);
  }
}

export interface PhotoPostRelations {
  // describe navigational properties here
}

export type PhotoPostWithRelations = PhotoPost & PhotoPostRelations;

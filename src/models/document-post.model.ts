import {Entity, model, property, hasOne} from '@loopback/repository';
import {PostConfig} from './post-config.model';

@model()
export class DocumentPost extends Entity {
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
  title: string;

  @property({
    type: 'string',
  })
  author?: string;

  @property({
    type: 'number',
  })
  postId?: number;

  @hasOne(() => PostConfig)
  postConfig: PostConfig;

  constructor(data?: Partial<DocumentPost>) {
    super(data);
  }
}

export interface DocumentPostRelations {
  // describe navigational properties here
}

export type DocumentPostWithRelations = DocumentPost & DocumentPostRelations;

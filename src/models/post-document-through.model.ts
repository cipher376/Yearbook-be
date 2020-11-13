import {Entity, model, property} from '@loopback/repository';

@model()
export class PostDocumentThrough extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'number',
  })
  postId?: number;

  @property({
    type: 'number',
  })
  documentId?: number;

  constructor(data?: Partial<PostDocumentThrough>) {
    super(data);
  }
}

export interface PostDocumentThroughRelations {
  // describe navigational properties here
}

export type PostDocumentThroughWithRelations = PostDocumentThrough & PostDocumentThroughRelations;

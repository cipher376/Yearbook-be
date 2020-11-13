import {Entity, model, property} from '@loopback/repository';

@model({settings: {strict: true}})
export class PostPhotoThrough extends Entity {
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
  photoId?: number;
  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<PostPhotoThrough>) {
    super(data);
  }
}

export interface PostPhotoThroughRelations {
  // describe navigational properties here
}

export type PostPhotoThroughWithRelations = PostPhotoThrough & PostPhotoThroughRelations;

import {Entity, model, property} from '@loopback/repository';

@model()
export class PostAudioThrough extends Entity {
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
  audioId?: number;

  constructor(data?: Partial<PostAudioThrough>) {
    super(data);
  }
}

export interface PostAudioThroughRelations {
  // describe navigational properties here
}

export type PostAudioThroughWithRelations = PostAudioThrough & PostAudioThroughRelations;

import {Entity, model, property} from '@loopback/repository';

@model()
export class PostVideoThrough extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'number',
  })
  postId: number;

  @property({
    type: 'number',
    required: true,
  })
  videoId: number;


  constructor(data?: Partial<PostVideoThrough>) {
    super(data);
  }
}

export interface PostVideoThroughRelations {
  // describe navigational properties here
}

export type PostVideoThroughWithRelations = PostVideoThrough & PostVideoThroughRelations;

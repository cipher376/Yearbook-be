import {Entity, model, property} from '@loopback/repository';

@model()
export class LikeThrough extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'boolean',
    required: true,
  })
  rate: boolean;

  @property({
    type: 'number',
    required: true,
  })
  initiatorId: number;

  @property({
    type: 'number',
  })
  receiverId?: number;

  @property({
    type: 'string',
  })
  receiverName?: string;



  constructor(data?: Partial<LikeThrough>) {
    super(data);
  }
}

export interface LikeThroughRelations {
  // describe navigational properties here
}

export type LikeThroughWithRelations = LikeThrough & LikeThroughRelations;

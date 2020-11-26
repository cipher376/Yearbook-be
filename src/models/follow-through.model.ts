import {Entity, model, property} from '@loopback/repository';

@model()
export class FollowThrough extends Entity {
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
  leaderId: number;

  @property({
    type: 'number',
    required: true,
  })
  followerId: number;

  @property({
    type: 'date',
    required: true,
  })
  dateFollowed: string;


  constructor(data?: Partial<FollowThrough>) {
    super(data);
  }
}

export interface FollowThroughRelations {
  // describe navigational properties here
}

export type FollowThroughWithRelations = FollowThrough & FollowThroughRelations;

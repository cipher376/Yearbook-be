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
    defaultFn: 'now'
  })
  dateFollowed: string;

  @property({
    type: 'date',
    defaultFn: 'now'
  })
  lastModified: string;

  @property({
    type: 'boolean',
    default: true
  })
  isFollowing: boolean;

  @property({
    type: 'string',
  })
  leaderModelName: string; // School or User

  constructor(data?: Partial<FollowThrough>) {
    super(data);
  }
}

export interface FollowThroughRelations {
  // describe navigational properties here
}

export type FollowThroughWithRelations = FollowThrough & FollowThroughRelations;

import {Entity, model, property} from '@loopback/repository';

@model()
export class FriendshipThrough extends Entity {
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
  initiatorId: number;

  @property({
    type: 'number',
    required: true,
  })
  acceptorId: number;

  @property({
    type: 'boolean',
  })
  accepted?: boolean;

  @property({
    type: 'date',
    required: true,
  })
  dateCreated: string;

  @property({
    type: 'date',
  })
  dateAccepted: string;


  constructor(data?: Partial<FriendshipThrough>) {
    super(data);
  }
}

export interface FriendshipThroughRelations {
  // describe navigational properties here
}

export type FriendshipThroughWithRelations = FriendshipThrough & FriendshipThroughRelations;

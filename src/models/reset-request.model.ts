import {Entity, model, property, belongsTo} from '@loopback/repository';
import {User} from './user.model';

@model()
export class ResetRequest extends Entity {
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
  resetToken: string;

  @property({
    type: 'date',
    required: true,
  })
  dateCreated: string;

  @property({
    type: 'date',
    required: true,
  })
  dateModified: string;

  @property({
    type: 'number',
    required: true,
  })
  state: number;

  @property({
    type: 'number',
    required: true,
  })
  expiredTimeInMin: number;

  @property({
    type: 'number',
    required: true,
  })
  requestType: number;

  @belongsTo(() => User)
  userId: number;

  constructor(data?: Partial<ResetRequest>) {
    super(data);
  }
}

export interface ResetRequestRelations {
  // describe navigational properties here
}

export type ResetRequestWithRelations = ResetRequest & ResetRequestRelations;

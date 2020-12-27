import {Entity, model, property, belongsTo} from '@loopback/repository';
import {User} from './user.model';

@model()
export class Authentication extends Entity {
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
  email: string;

  @property({
    type: 'number',
    required: true,
  })
  retryCount: number;

  @property({
    type: 'number',
    required: true,
  })
  state: number;

  @property({
    type: 'date',
    required: true,
  })
  lastLoggedIn: string;

  @belongsTo(() => User)
  userId: number;

  constructor(data?: Partial<Authentication>) {
    super(data);
  }
}

export interface AuthenticationRelations {
  // describe navigational properties here
}

export type AuthenticationWithRelations = Authentication & AuthenticationRelations;

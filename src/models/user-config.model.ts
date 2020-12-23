import {Entity, model, property} from '@loopback/repository';

@model()
export class UserConfig extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'string',
    required: true
  })
  action: string;

  @property({
    type: 'string',
    required: true,
  })
  response: string;

  @property({
    type: 'string',
  })
  reason: string;

  @property({
    type: 'number',
  })
  userId?: number;

  constructor(data?: Partial<UserConfig>) {
    super(data);
  }
}

export interface UserConfigRelations {
  // describe navigational properties here
}

export type UserConfigWithRelations = UserConfig & UserConfigRelations;

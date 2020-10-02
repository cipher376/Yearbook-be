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
    type: 'boolean',
    default: true,
  })
  fetchPublicPost?: boolean;

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
  
import {Entity, model, property, belongsTo} from '@loopback/repository';
import {User} from './user.model';

@model()
export class Password extends Entity {
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
  hash: string;

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
  modifiedBy: number;

  @belongsTo(() => User)
  userId: number;

  constructor(data?: Partial<Password>) {
    super(data);
  }
}

export interface PasswordRelations {
  // describe navigational properties here
}

export type PasswordWithRelations = Password & PasswordRelations;

import {Entity, hasOne, model, property} from '@loopback/repository';
import {Degree} from './degree.model';

@model()
export class Alumni extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'date',
    required: true,
  })
  yearStarted: string;

  @property({
    type: 'date',
    required: true,
  })
  yearCompleted: string;

  @property({
    type: 'string',
  })
  schoolIndexNumber: string;

  @hasOne(() => Degree)
  degree: Degree;

  @property({
    type: 'number',
  })
  schoolId?: number;

  @property({
    type: 'number',
  })
  userId?: number;

  constructor(data?: Partial<Alumni>) {
    super(data);
  }
}

export interface AlumniRelations {
  // describe navigational properties here
}

export type AlumniWithRelations = Alumni & AlumniRelations;

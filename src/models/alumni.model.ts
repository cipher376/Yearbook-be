import {belongsTo, Entity, hasOne, model, property} from '@loopback/repository';
import {Degree} from './degree.model';
import {School} from './school.model';
import {User} from './user.model';

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

  @belongsTo(() => School)
  schoolId: number;

  @hasOne(() => Degree)
  degree: Degree;

  @belongsTo(() => User)
  userId: number;

  constructor(data?: Partial<Alumni>) {
    super(data);
  }
}

export interface AlumniRelations {
  // describe navigational properties here
}

export type AlumniWithRelations = Alumni & AlumniRelations;

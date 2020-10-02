import {Entity, model, property, belongsTo} from '@loopback/repository';
import {Alumni} from './alumni.model';

@model()
export class Degree extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'string',
  })
  name?: string;

  @property({
    type: 'string',
  })
  type?: string;

  @property({
    type: 'string',
  })
  programme?: string;

  @property({
    type: 'number',
  })
  cgpa?: number;

  @belongsTo(() => Alumni)
  alumniId: number;

  constructor(data?: Partial<Degree>) {
    super(data);
  }
}

export interface DegreeRelations {
  // describe navigational properties here
}

export type DegreeWithRelations = Degree & DegreeRelations;

import {Entity, model, property} from '@loopback/repository';

@model()
export class SchoolDetails extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'number',
  })
  accommodationType?: number;

  @property({
    type: 'string',
  })
  helpline?: string;

  @property({
    type: 'string',
  })
  helpline2?: string;

  @property({
    type: 'string',
  })
  motto?: string;

  @property({
    type: 'string',
  })
  anthem?: string;

  @property({
    type: 'array',
    itemType: 'string',
  })
  departments?: string[];

  @property({
    type: 'string',
  })
  website?: string;


  @property({
    type: 'string',
  })
  about: string;

  @property({
    type: 'string',
  })
  alias: string;

  @property({
    type: 'number',
  })
  totalStudents: string;

  @property({
    type: 'string',
  })
  studentAlias: string;

  @property({
    type: 'array',
    itemType: 'string'
  })
  accommodationTypes: string[];

  @property({
    type: 'string',
  })
  helpLines: string;

  @property({
    type: 'string',
  })
  email: string;

  @property({
    type: 'string',
  })
  mission: string;


  @property({
    type: 'string',
  })
  vision: string;

  @property({
    type: 'string',
  })
  alumniCount: number;

  @property({
    type: 'number',
  })
  schoolId?: number;

  constructor(data?: Partial<SchoolDetails>) {
    super(data);
  }
}

export interface SchoolDetailsRelations {
  // describe navigational properties here
}

export type SchoolDetailsWithRelations = SchoolDetails & SchoolDetailsRelations;

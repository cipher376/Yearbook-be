import {Entity, hasMany, hasOne, model, property} from '@loopback/repository';
import {Address} from './address.model';
import {Alumni} from './alumni.model';
import {Audio} from './audio.model';
import {Document} from './document.model';
import {SchoolDetails} from './school-details.model';
import {Video} from './video.model';
import {Photo} from './photo.model';

@model()
export class School extends Entity {
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
  name: string;

  @property({
    type: 'date',
    required: true,
  })
  dateStarted: string;

  @property({
    type: 'string',
    required: true,
  })
  type: string;

  @property({
    type: 'string',
    required: true,
  })
  gender: string;


  @hasMany(() => Video)
  videos: Video[];

  @hasMany(() => Audio)
  audio: Audio[];


  @hasMany(() => Document)
  documents: Document[];

  @hasMany(() => Alumni)
  alumni: Alumni[];

  @hasOne(() => SchoolDetails)
  schoolDetails: SchoolDetails;

  @hasOne(() => Address)
  address: Address;

  @hasMany(() => Photo)
  photos: Photo[];

  constructor(data?: Partial<School>) {
    super(data);
  }
}

export interface SchoolRelations {
  // describe navigational properties here
}

export type SchoolWithRelations = School & SchoolRelations;

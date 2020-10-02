import {Entity, hasMany, hasOne, model, property} from '@loopback/repository';
import {Address} from './address.model';
import {Alumni} from './alumni.model';
import {Audio} from './audio.model';
import {Document} from './document.model';
import {Photo} from './photo.model';
import {SchoolDetails} from './school-details.model';
import {Video} from './video.model';

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

  @property({
    type: 'string',
  })

  thumbnailUrl: string;
  @property({
    type: 'string',
  })
  coverUrl: string;

  // @property({
  //   type: 'array',
  //   itemType: 'string',
  @hasMany(() => Photo)
  photos: Photo[];

  @hasMany(() => Video)
  videos: Video[];

  @hasMany(() => Audio)
  audio: Audio[];

  @hasMany(() => Document)
  documents: Document[];
  // })
  // temp?: string[];

  @hasMany(() => Alumni)
  alumni: Alumni[];

  @hasOne(() => SchoolDetails)
  schoolDetails: SchoolDetails;

  @hasOne(() => Address)
  address: Address;

  constructor(data?: Partial<School>) {
    super(data);
  }
}

export interface SchoolRelations {
  // describe navigational properties here
}

export type SchoolWithRelations = School & SchoolRelations;

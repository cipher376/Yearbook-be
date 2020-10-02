import {Entity, model, property} from '@loopback/repository';

@model({settings: {strict: false}})
export class Media extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'string',
  })
  description?: string;

  @property({
    type: 'string',
    required: true,
  })
  fileName: string;

  @property({
    type: 'string',
    required: true,
  })
  fileUrl: string;

  @property({
    type: 'string',
  })
  thumbnailUrl?: string;

  @property({
    type: 'string',
  })
  coverUrl?: string;

  @property({
    type: 'date',
  })
  dateCreated?: string;

  @property({
    type: 'number',
    required: true,
  })
  type: number;


  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<Media>) {
    super(data);
  }
}

export interface MediaRelations {
  // describe navigational properties here
}

export type MediaWithRelations = Media & MediaRelations;

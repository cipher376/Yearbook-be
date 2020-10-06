import {model, property} from '@loopback/repository';
import {Media} from './media.model';

@model()
export class Photo extends Media {
  @property({
    id: true,
    description: 'The unique identifier for a product',
  })
  id: number;

  @property({
    type: 'number',
  })
  userId?: number;

  @property({
    type: 'string',
  })
  thumbnailUrl?: string;

  @property({
    type: 'boolean',
    default: false
  })
  coverImage?: boolean;

  @property({
    type: 'boolean',
    default: false

  })
  profile?: boolean;

  @property({
    type: 'boolean',
    default: false

  })
  flag?: boolean;

  @property({
    type: 'number',
  })
  schoolId?: number;

  constructor(data?: Partial<Photo>) {
    super(data);
  }
}

export interface PhotoRelations {
  // describe navigational properties here
}

export type PhotoWithRelations = Photo & PhotoRelations;

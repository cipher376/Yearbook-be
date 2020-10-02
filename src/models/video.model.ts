import {model, property} from '@loopback/repository';
import {Media} from './media.model';

@model()
export class Video extends Media {
  @property({
    id: true,
    description: 'The unique identifier for a product',
  })
  id: number;

  @property({
    type: 'number',
  })
  schoolId?: number;

  constructor(data?: Partial<Video>) {
    super(data);
  }
}

export interface VideoRelations {
  // describe navigational properties here
}

export type VideoWithRelations = Video & VideoRelations;
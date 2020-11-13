import {model, property} from '@loopback/repository';
import {Media} from './media.model';

@model()
export class Video extends Media {
  @property({
    id: true,
    description: 'The unique identifier for a video',
  })
  id: number;

  @property({
    type: 'number',
  })
  length?: 'number'; // in seconds

  @property({
    type: 'number',
  })
  schoolId?: number;

  @property({
    type: 'string',
  })
  mimeType: string;

  @property({
    type: 'string',
  })
  thumbnailUrl?: string;

  @property({
    type: 'string',
  })
  posterUrl?: string;

  @property({
    type: 'number',
  })
  postId?: number;

  @property({
    type: 'number',
  })
  userId?: number;

  constructor(data?: Partial<Video>) {
    super(data);
  }
}

export interface VideoRelations {
  // describe navigational properties here
}

export type VideoWithRelations = Video & VideoRelations;

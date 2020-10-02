import {model, property} from '@loopback/repository';
import {Media} from './media.model';

@model()
export class Audio extends Media {
  @property({
    id: true,
    description: 'The unique identifier for a product',
  })
  id: number;

  @property({
    type: 'number',
  })
  schoolId?: number;

  constructor(data?: Partial<Audio>) {
    super(data);
  }
}

export interface AudioRelations {
  // describe navigational properties here
}

export type AudioWithRelations = Audio & AudioRelations;

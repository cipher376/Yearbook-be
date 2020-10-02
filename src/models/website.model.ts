import {model, property} from '@loopback/repository';
import {Media} from './media.model';

@model()
export class Website extends Media {
  @property({
    id: true,
    description: 'The unique identifier for a product',
  })
  id: number;

  constructor(data?: Partial<Website>) {
    super(data);
  }
}

export interface WebsiteRelations {
  // describe navigational properties here
}

export type WebsiteWithRelations = Website & WebsiteRelations;

import {model, property} from '@loopback/repository';
import {Media} from './media.model';

@model()
export class Document extends Media {
  @property({
    id: true,
    description: 'The unique identifier for a product',
  })
  id: number;

  @property({
    type: 'number',
  })
  schoolId?: number;

  @property({
    type: 'string',
    required: true,
  })
  title: string;

  @property({
    type: 'string',
  })
  author?: string;

  @property({
    type: 'number',
  })
  postId?: number;

  @property({
    type: 'number',
  })
  userId?: number;

  constructor(data?: Partial<Document>) {
    super(data);
  }
}

export interface DocumentRelations {
  // describe navigational properties here
}

export type DocumentWithRelations = Document & DocumentRelations;

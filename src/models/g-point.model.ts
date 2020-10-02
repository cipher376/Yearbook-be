import {Entity, model, property} from '@loopback/repository';

@model()
export class GPoint extends Entity {
  @property({
    type: 'string',
    required: true,
  })
  lat: string;

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
  lng: string;

  @property({
    type: 'number',
  })
  addressId?: number;

  constructor(data?: Partial<GPoint>) {
    super(data);
  }
}

export interface GPointRelations {
  // describe navigational properties here
}

export type GPointWithRelations = GPoint & GPointRelations;

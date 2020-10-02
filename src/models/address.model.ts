import {Entity, model, property} from '@loopback/repository';

@model()
export class Address extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'string',
  })
  street: string;

  @property({
    type: 'string',
  })
  suburb: string;
  @property({
    type: 'string',
  })
  postcode: string;
  @property({
    type: 'string',
    required: true,
  })
  city: string;

  @property({
    type: 'string',
    required: true,
  })
  state: string;

  @property({
    type: 'string',
    required: true,
  })
  country: string;

  @property({
    type: 'number',
  })
  schoolId?: number;

  @property({
    type: 'number',
  })
  userId?: number;

  @property({
    type: 'string',
  })
  latLng?: string; //lat,lng

  constructor(data?: Partial<Address>) {
    super(data);
  }
}

export interface AddressRelations {
  // describe navigational properties here
}

export type AddressWithRelations = Address & AddressRelations;

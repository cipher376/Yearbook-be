import {Model, model, property} from '@loopback/repository';

@model()
export class Policy extends Model {

  @property({
    type: 'string',
  })
  ptype?: string;

  @property({
    type: 'string',
  })
  subject: string;

  @property({
    type: 'string',
  })
  object?: string;

  @property({
    type: 'string',
  })
  action?: string;

  @property({
    type: 'string',
  })
  domain?: string;

  @property({
    type: 'string',
  })
  role?: string;

  constructor(data?: Partial<Policy>) {
    super(data);
  }


}


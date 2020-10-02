import {Entity, model, property} from '@loopback/repository';

@model()
export class Temp extends Entity {
  @property({
    type: 'object',
  })
  gpoint?: object;


  constructor(data?: Partial<Temp>) {
    super(data);
  }
}

export interface TempRelations {
  // describe navigational properties here
}

export type TempWithRelations = Temp & TempRelations;

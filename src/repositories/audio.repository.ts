import {DefaultCrudRepository} from '@loopback/repository';
import {Audio, AudioRelations} from '../models';
import {DbDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class AudioRepository extends DefaultCrudRepository<
  Audio,
  typeof Audio.prototype.id,
  AudioRelations
> {
  constructor(
    @inject('datasources.db') dataSource: DbDataSource,
  ) {
    super(Audio, dataSource);
  }
}

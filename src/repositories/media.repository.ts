import {DefaultCrudRepository} from '@loopback/repository';
import {Media, MediaRelations} from '../models';
import {DbDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class MediaRepository extends DefaultCrudRepository<
  Media,
  typeof Media.prototype.id,
  MediaRelations
> {
  constructor(
    @inject('datasources.db') dataSource: DbDataSource,
  ) {
    super(Media, dataSource);
  }
}

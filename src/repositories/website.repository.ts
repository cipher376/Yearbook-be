import {DefaultCrudRepository} from '@loopback/repository';
import {Website, WebsiteRelations} from '../models';
import {DbDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class WebsiteRepository extends DefaultCrudRepository<
  Website,
  typeof Website.prototype.id,
  WebsiteRelations
> {
  constructor(
    @inject('datasources.db') dataSource: DbDataSource,
  ) {
    super(Website, dataSource);
  }
}

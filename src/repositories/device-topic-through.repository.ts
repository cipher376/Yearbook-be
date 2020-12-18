import {DefaultCrudRepository} from '@loopback/repository';
import {DeviceTopicThrough, DeviceTopicThroughRelations} from '../models';
import {DbDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class DeviceTopicThroughRepository extends DefaultCrudRepository<
  DeviceTopicThrough,
  typeof DeviceTopicThrough.prototype.id,
  DeviceTopicThroughRelations
> {
  constructor(
    @inject('datasources.db') dataSource: DbDataSource,
  ) {
    super(DeviceTopicThrough, dataSource);
  }
}

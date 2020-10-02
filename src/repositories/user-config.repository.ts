import {DefaultCrudRepository} from '@loopback/repository';
import {UserConfig, UserConfigRelations} from '../models';
import {DbDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class UserConfigRepository extends DefaultCrudRepository<
  UserConfig,
  typeof UserConfig.prototype.id,
  UserConfigRelations
> {
  constructor(
    @inject('datasources.db') dataSource: DbDataSource,
  ) {
    super(UserConfig, dataSource);
  }
}

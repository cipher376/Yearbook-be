import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {DbDataSource} from '../datasources';
import {PostConfig, PostConfigRelations} from '../models';

export class PostConfigRepository extends DefaultCrudRepository<
  PostConfig,
  typeof PostConfig.prototype.id,
  PostConfigRelations
  > {



  constructor(
    @inject('datasources.db') dataSource: DbDataSource,

  ) {
    super(PostConfig, dataSource);

  }
}

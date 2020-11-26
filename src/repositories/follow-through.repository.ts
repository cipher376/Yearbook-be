import {DefaultCrudRepository} from '@loopback/repository';
import {FollowThrough, FollowThroughRelations} from '../models';
import {DbDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class FollowThroughRepository extends DefaultCrudRepository<
  FollowThrough,
  typeof FollowThrough.prototype.id,
  FollowThroughRelations
> {
  constructor(
    @inject('datasources.db') dataSource: DbDataSource,
  ) {
    super(FollowThrough, dataSource);
  }
}

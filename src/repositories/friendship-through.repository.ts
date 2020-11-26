import {DefaultCrudRepository} from '@loopback/repository';
import {FriendshipThrough, FriendshipThroughRelations} from '../models';
import {DbDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class FriendshipThroughRepository extends DefaultCrudRepository<
  FriendshipThrough,
  typeof FriendshipThrough.prototype.id,
  FriendshipThroughRelations
> {
  constructor(
    @inject('datasources.db') dataSource: DbDataSource,
  ) {
    super(FriendshipThrough, dataSource);
  }
}

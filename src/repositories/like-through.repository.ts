import {DefaultCrudRepository} from '@loopback/repository';
import {LikeThrough, LikeThroughRelations} from '../models';
import {DbDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class LikeThroughRepository extends DefaultCrudRepository<
  LikeThrough,
  typeof LikeThrough.prototype.id,
  LikeThroughRelations
> {
  constructor(
    @inject('datasources.db') dataSource: DbDataSource,
  ) {
    super(LikeThrough, dataSource);
  }
}

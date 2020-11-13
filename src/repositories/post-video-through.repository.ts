import {DefaultCrudRepository} from '@loopback/repository';
import {PostVideoThrough, PostVideoThroughRelations} from '../models';
import {DbDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class PostVideoThroughRepository extends DefaultCrudRepository<
  PostVideoThrough,
  typeof PostVideoThrough.prototype.id,
  PostVideoThroughRelations
> {
  constructor(
    @inject('datasources.db') dataSource: DbDataSource,
  ) {
    super(PostVideoThrough, dataSource);
  }
}

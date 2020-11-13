import {DefaultCrudRepository} from '@loopback/repository';
import {PostPhotoThrough, PostPhotoThroughRelations} from '../models';
import {DbDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class PostPhotoThroughRepository extends DefaultCrudRepository<
  PostPhotoThrough,
  typeof PostPhotoThrough.prototype.id,
  PostPhotoThroughRelations
> {
  constructor(
    @inject('datasources.db') dataSource: DbDataSource,
  ) {
    super(PostPhotoThrough, dataSource);
  }
}

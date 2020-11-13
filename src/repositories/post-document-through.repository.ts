import {DefaultCrudRepository} from '@loopback/repository';
import {PostDocumentThrough, PostDocumentThroughRelations} from '../models';
import {DbDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class PostDocumentThroughRepository extends DefaultCrudRepository<
  PostDocumentThrough,
  typeof PostDocumentThrough.prototype.id,
  PostDocumentThroughRelations
> {
  constructor(
    @inject('datasources.db') dataSource: DbDataSource,
  ) {
    super(PostDocumentThrough, dataSource);
  }
}

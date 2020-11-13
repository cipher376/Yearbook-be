import {DefaultCrudRepository} from '@loopback/repository';
import {PostAudioThrough, PostAudioThroughRelations} from '../models';
import {DbDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class PostAudioThroughRepository extends DefaultCrudRepository<
  PostAudioThrough,
  typeof PostAudioThrough.prototype.id,
  PostAudioThroughRelations
> {
  constructor(
    @inject('datasources.db') dataSource: DbDataSource,
  ) {
    super(PostAudioThrough, dataSource);
  }
}

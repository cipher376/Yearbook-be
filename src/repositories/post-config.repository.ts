import {DefaultCrudRepository, repository, HasOneRepositoryFactory} from '@loopback/repository';
import {PostConfig, PostConfigRelations, MessagePost} from '../models';
import {DbDataSource} from '../datasources';
import {inject, Getter} from '@loopback/core';
import {MessagePostRepository} from './message-post.repository';

export class PostConfigRepository extends DefaultCrudRepository<
  PostConfig,
  typeof PostConfig.prototype.id,
  PostConfigRelations
> {

 

  constructor(
    @inject('datasources.db') dataSource: DbDataSource, @repository.getter('MessagePostRepository') protected messagePostRepositoryGetter: Getter<MessagePostRepository>,
  ) {
    super(PostConfig, dataSource);
    
  }
}

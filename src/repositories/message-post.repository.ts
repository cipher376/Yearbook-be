import {DefaultCrudRepository, repository, HasOneRepositoryFactory} from '@loopback/repository';
import {MessagePost, MessagePostRelations, PostConfig} from '../models';
import {DbDataSource} from '../datasources';
import {inject, Getter} from '@loopback/core';
import {PostConfigRepository} from './post-config.repository';

export class MessagePostRepository extends DefaultCrudRepository<
  MessagePost,
  typeof MessagePost.prototype.id,
  MessagePostRelations
> {

  public readonly postConfig: HasOneRepositoryFactory<PostConfig, typeof MessagePost.prototype.id>;

  constructor(
    @inject('datasources.db') dataSource: DbDataSource, @repository.getter('PostConfigRepository') protected postConfigRepositoryGetter: Getter<PostConfigRepository>,
  ) {
    super(MessagePost, dataSource);
    this.postConfig = this.createHasOneRepositoryFactoryFor('postConfig', postConfigRepositoryGetter);
    this.registerInclusionResolver('postConfig', this.postConfig.inclusionResolver);
   
  }
}

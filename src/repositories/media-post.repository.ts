import {DefaultCrudRepository, repository, HasOneRepositoryFactory} from '@loopback/repository';
import {MediaPost, MediaPostRelations, PostConfig} from '../models';
import {DbDataSource} from '../datasources';
import {inject, Getter} from '@loopback/core';
import {PostConfigRepository} from './post-config.repository';

export class MediaPostRepository extends DefaultCrudRepository<
  MediaPost,
  typeof MediaPost.prototype.id,
  MediaPostRelations
> {

  public readonly postConfig: HasOneRepositoryFactory<PostConfig, typeof MediaPost.prototype.id>;

  constructor(
    @inject('datasources.db') dataSource: DbDataSource, @repository.getter('PostConfigRepository') protected postConfigRepositoryGetter: Getter<PostConfigRepository>,
  ) {
    super(MediaPost, dataSource);
    this.postConfig = this.createHasOneRepositoryFactoryFor('postConfig', postConfigRepositoryGetter);
    this.registerInclusionResolver('postConfig', this.postConfig.inclusionResolver);
  }
}

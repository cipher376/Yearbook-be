import {DefaultCrudRepository, repository, HasOneRepositoryFactory} from '@loopback/repository';
import {PhotoPost, PhotoPostRelations, PostConfig} from '../models';
import {DbDataSource} from '../datasources';
import {inject, Getter} from '@loopback/core';
import {PostConfigRepository} from './post-config.repository';

export class PhotoPostRepository extends DefaultCrudRepository<
  PhotoPost,
  typeof PhotoPost.prototype.id,
  PhotoPostRelations
> {

  public readonly postConfig: HasOneRepositoryFactory<PostConfig, typeof PhotoPost.prototype.id>;

  constructor(
    @inject('datasources.db') dataSource: DbDataSource, @repository.getter('PostConfigRepository') protected postConfigRepositoryGetter: Getter<PostConfigRepository>,
  ) {
    super(PhotoPost, dataSource);
    this.postConfig = this.createHasOneRepositoryFactoryFor('postConfig', postConfigRepositoryGetter);
    this.registerInclusionResolver('postConfig', this.postConfig.inclusionResolver);
  }
}

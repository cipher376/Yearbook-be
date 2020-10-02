import {DefaultCrudRepository, repository, HasOneRepositoryFactory} from '@loopback/repository';
import {DocumentPost, DocumentPostRelations, PostConfig} from '../models';
import {DbDataSource} from '../datasources';
import {inject, Getter} from '@loopback/core';
import {PostConfigRepository} from './post-config.repository';

export class DocumentPostRepository extends DefaultCrudRepository<
  DocumentPost,
  typeof DocumentPost.prototype.id,
  DocumentPostRelations
> {

  public readonly postConfig: HasOneRepositoryFactory<PostConfig, typeof DocumentPost.prototype.id>;

  constructor(
    @inject('datasources.db') dataSource: DbDataSource, @repository.getter('PostConfigRepository') protected postConfigRepositoryGetter: Getter<PostConfigRepository>,
  ) {
    super(DocumentPost, dataSource);
    this.postConfig = this.createHasOneRepositoryFactoryFor('postConfig', postConfigRepositoryGetter);
    this.registerInclusionResolver('postConfig', this.postConfig.inclusionResolver);
  }
}

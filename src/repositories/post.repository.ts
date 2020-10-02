import {DefaultCrudRepository, repository, BelongsToAccessor, HasManyRepositoryFactory} from '@loopback/repository';
import {Post, PostRelations, User, DocumentPost, MediaPost, MessagePost, PhotoPost} from '../models';
import {DbDataSource} from '../datasources';
import {inject, Getter} from '@loopback/core';
import {UserRepository} from './user.repository';
import {DocumentPostRepository} from './document-post.repository';
import {MediaPostRepository} from './media-post.repository';
import {MessagePostRepository} from './message-post.repository';
import {PhotoPostRepository} from './photo-post.repository';

export class PostRepository extends DefaultCrudRepository<
  Post,
  typeof Post.prototype.id,
  PostRelations
> {

  public readonly user: BelongsToAccessor<User, typeof Post.prototype.id>;

  public readonly documentPosts: HasManyRepositoryFactory<DocumentPost, typeof Post.prototype.id>;

  public readonly mediaPosts: HasManyRepositoryFactory<MediaPost, typeof Post.prototype.id>;

  public readonly messagePosts: HasManyRepositoryFactory<MessagePost, typeof Post.prototype.id>;

  public readonly photoPosts: HasManyRepositoryFactory<PhotoPost, typeof Post.prototype.id>;

  constructor(
    @inject('datasources.db') dataSource: DbDataSource, @repository.getter('UserRepository') protected userRepositoryGetter: Getter<UserRepository>, @repository.getter('DocumentPostRepository') protected documentPostRepositoryGetter: Getter<DocumentPostRepository>, @repository.getter('MediaPostRepository') protected mediaPostRepositoryGetter: Getter<MediaPostRepository>, @repository.getter('MessagePostRepository') protected messagePostRepositoryGetter: Getter<MessagePostRepository>, @repository.getter('PhotoPostRepository') protected photoPostRepositoryGetter: Getter<PhotoPostRepository>,
  ) {
    super(Post, dataSource);
    this.photoPosts = this.createHasManyRepositoryFactoryFor('photoPosts', photoPostRepositoryGetter,);
    this.registerInclusionResolver('photoPosts', this.photoPosts.inclusionResolver);
    this.messagePosts = this.createHasManyRepositoryFactoryFor('messagePosts', messagePostRepositoryGetter,);
    this.registerInclusionResolver('messagePosts', this.messagePosts.inclusionResolver);
    this.mediaPosts = this.createHasManyRepositoryFactoryFor('mediaPosts', mediaPostRepositoryGetter,);
    this.registerInclusionResolver('mediaPosts', this.mediaPosts.inclusionResolver);
    this.documentPosts = this.createHasManyRepositoryFactoryFor('documentPosts', documentPostRepositoryGetter,);
    this.registerInclusionResolver('documentPosts', this.documentPosts.inclusionResolver);
    this.user = this.createBelongsToAccessorFor('user', userRepositoryGetter,);
    this.registerInclusionResolver('user', this.user.inclusionResolver);
  }
}

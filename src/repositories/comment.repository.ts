import {Getter, inject} from '@loopback/core';
import {DefaultCrudRepository, HasManyThroughRepositoryFactory, repository} from '@loopback/repository';
import {DbDataSource} from '../datasources';
import {Comment, CommentRelations, LikeThrough, User} from '../models';
import {LikeThroughRepository} from './like-through.repository';
import {UserRepository} from './user.repository';

export class CommentRepository extends DefaultCrudRepository<
  Comment,
  typeof Comment.prototype.id,
  CommentRelations
  > {

  public readonly likedUsers: HasManyThroughRepositoryFactory<User, typeof User.prototype.id,
    LikeThrough,
    typeof Comment.prototype.id
  >;

  constructor(
    @inject('datasources.db') dataSource: DbDataSource, @repository.getter('LikeThroughRepository') protected likeThroughRepositoryGetter: Getter<LikeThroughRepository>, @repository.getter('UserRepository') protected userRepositoryGetter: Getter<UserRepository>,
  ) {
    super(Comment, dataSource);
    this.likedUsers = this.createHasManyThroughRepositoryFactoryFor('likedUsers', userRepositoryGetter, likeThroughRepositoryGetter,);
    // this.registerInclusionResolver('likedUsers', this.likedUsers.inclusionResolver);
  }
}

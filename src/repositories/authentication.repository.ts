import {DefaultCrudRepository, repository, BelongsToAccessor} from '@loopback/repository';
import {Authentication, AuthenticationRelations, User} from '../models';
import {DbDataSource} from '../datasources';
import {inject, Getter} from '@loopback/core';
import {UserRepository} from './user.repository';

export class AuthenticationRepository extends DefaultCrudRepository<
  Authentication,
  typeof Authentication.prototype.id,
  AuthenticationRelations
> {

  public readonly user: BelongsToAccessor<User, typeof Authentication.prototype.id>;

  constructor(
    @inject('datasources.db') dataSource: DbDataSource, @repository.getter('UserRepository') protected userRepositoryGetter: Getter<UserRepository>,
  ) {
    super(Authentication, dataSource);
    this.user = this.createBelongsToAccessorFor('user', userRepositoryGetter,);
  }
}

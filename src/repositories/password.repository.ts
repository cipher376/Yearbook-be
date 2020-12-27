import {DefaultCrudRepository, repository, BelongsToAccessor} from '@loopback/repository';
import {Password, PasswordRelations, User} from '../models';
import {DbDataSource} from '../datasources';
import {inject, Getter} from '@loopback/core';
import {UserRepository} from './user.repository';

export class PasswordRepository extends DefaultCrudRepository<
  Password,
  typeof Password.prototype.id,
  PasswordRelations
> {

  public readonly user: BelongsToAccessor<User, typeof Password.prototype.id>;

  constructor(
    @inject('datasources.db') dataSource: DbDataSource, @repository.getter('UserRepository') protected userRepositoryGetter: Getter<UserRepository>,
  ) {
    super(Password, dataSource);
    this.user = this.createBelongsToAccessorFor('user', userRepositoryGetter,);
  }
}

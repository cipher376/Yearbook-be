import {DefaultCrudRepository, repository, BelongsToAccessor} from '@loopback/repository';
import {ResetRequest, ResetRequestRelations, User} from '../models';
import {DbDataSource} from '../datasources';
import {inject, Getter} from '@loopback/core';
import {UserRepository} from './user.repository';

export class ResetRequestRepository extends DefaultCrudRepository<
  ResetRequest,
  typeof ResetRequest.prototype.id,
  ResetRequestRelations
> {

  public readonly user: BelongsToAccessor<User, typeof ResetRequest.prototype.id>;

  constructor(
    @inject('datasources.db') dataSource: DbDataSource, @repository.getter('UserRepository') protected userRepositoryGetter: Getter<UserRepository>,
  ) {
    super(ResetRequest, dataSource);
    this.user = this.createBelongsToAccessorFor('user', userRepositoryGetter,);
  }
}

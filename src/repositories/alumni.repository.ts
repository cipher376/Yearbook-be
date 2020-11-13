import {Getter, inject} from '@loopback/core';
import {DefaultCrudRepository, HasOneRepositoryFactory, repository} from '@loopback/repository';
import {DbDataSource} from '../datasources';
import {Alumni, AlumniRelations, Degree} from '../models';
import {DegreeRepository} from './degree.repository';
import {SchoolRepository} from './school.repository';
import {UserRepository} from './user.repository';

export class AlumniRepository extends DefaultCrudRepository<
  Alumni,
  typeof Alumni.prototype.id,
  AlumniRelations
  > {


  public readonly degree: HasOneRepositoryFactory<Degree, typeof Alumni.prototype.id>;


  constructor(
    @inject('datasources.db') dataSource: DbDataSource,
    @repository.getter('SchoolRepository') protected schoolRepositoryGetter: Getter<SchoolRepository>,
    @repository.getter('UserRepository') protected userRepositoryGetter: Getter<UserRepository>,
    @repository.getter('DegreeRepository') protected degreeRepositoryGetter: Getter<DegreeRepository>,
  ) {
    super(Alumni, dataSource);
    this.degree = this.createHasOneRepositoryFactoryFor('degree', degreeRepositoryGetter);
    this.registerInclusionResolver('degree', this.degree.inclusionResolver);
  }
}

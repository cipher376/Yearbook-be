import {DefaultCrudRepository, repository, BelongsToAccessor} from '@loopback/repository';
import {Degree, DegreeRelations, Alumni} from '../models';
import {DbDataSource} from '../datasources';
import {inject, Getter} from '@loopback/core';
import {AlumniRepository} from './alumni.repository';

export class DegreeRepository extends DefaultCrudRepository<
  Degree,
  typeof Degree.prototype.id,
  DegreeRelations
> {

  public readonly alumni: BelongsToAccessor<Alumni, typeof Degree.prototype.id>;

  constructor(
    @inject('datasources.db') dataSource: DbDataSource, @repository.getter('AlumniRepository') protected alumniRepositoryGetter: Getter<AlumniRepository>,
  ) {
    super(Degree, dataSource);
    this.alumni = this.createBelongsToAccessorFor('alumni', alumniRepositoryGetter,);
    this.registerInclusionResolver('alumni', this.alumni.inclusionResolver);
  }
}

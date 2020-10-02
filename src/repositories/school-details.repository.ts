import {DefaultCrudRepository} from '@loopback/repository';
import {SchoolDetails, SchoolDetailsRelations} from '../models';
import {DbDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class SchoolDetailsRepository extends DefaultCrudRepository<
  SchoolDetails,
  typeof SchoolDetails.prototype.id,
  SchoolDetailsRelations
> {
  constructor(
    @inject('datasources.db') dataSource: DbDataSource,
  ) {
    super(SchoolDetails, dataSource);
  }
}

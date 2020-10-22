import {inject, lifeCycleObserver, LifeCycleObserver} from '@loopback/core';
import {juggler} from '@loopback/repository';
export const DB_CONFIG = {
  name: 'db',
  connector: 'mysql',
  url: '',
  host: 'localhost',
  port: 3306,
  user: 'c1yearbook_user',
  password: '#Dev2020_Db@M',
  database: 'c1yearbookdb'
};


// export const DB_CONFIG = {
//   name: 'db',
//   connector: 'mysql',
//   url: '',
//   host: 'localhost',
//   port: 3306,
//   user: 'root',
//   password: '',
//   database: 'yearbook'
// };

// const DB_CONFIG = {
//   name: 'db',
//   connector: 'memory',
//   localStorage: '',
//   file: './data/db.json'
// };
// Observe application's life cycle to disconnect the datasource when
// application is stopped. This allows the application to be shut down
// gracefully. The `stop()` method is inherited from `juggler.DataSource`.
// Learn more at https://loopback.io/doc/en/lb4/Life-cycle.html
@lifeCycleObserver('datasource')
export class DbDataSource extends juggler.DataSource
  implements LifeCycleObserver {
  static dataSourceName = 'db';
  static readonly defaultConfig = DB_CONFIG;

  constructor(
    @inject('datasources.config.db', {optional: true})
    dsConfig: object = DB_CONFIG,
  ) {
    super(dsConfig);
  }

  /***
   * Casbin, a policy manager data source, makes connection to database
   * with TypeORM
   */
  // static async initCasbinDatasource() {
  //   return TypeORMAdapter.newAdapter({
  //     type: 'mysql',
  //     host: 'localhost',
  //     port: 3306,
  //     username: 'root',
  //     password: '',
  //     database: 'yearbook',
  //   }).catch(error => {
  //     // console.debug(error);
  //   });
  // }
}

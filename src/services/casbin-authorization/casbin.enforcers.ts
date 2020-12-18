// Copyright IBM Corp. 2020. All Rights Reserved.
// Node module: @loopback/example-access-control-migration
// This file is licensed under the MIT License.
// License text available at https://opensource.org/licenses/MIT
import {injectable} from '@loopback/core';
import * as casbin from 'casbin';
import path from 'path';
import TypeORMAdapter from 'typeorm-adapter';
import {DB_CONFIG} from '../../datasources';

const POLICY_PATHS = {
  anonymous: './../../../fixtures/casbin/rbac_policy.anonymous.csv',
  authUser: './../../../fixtures/casbin/rbac_policy.authUser.csv',
  owner: './../../../fixtures/casbin/rbac_policy.owner.csv',
  schoolAdmin: './../../../fixtures/casbin/rbac_policy.schoolAdmin.csv',
  admin: './../../../fixtures/casbin/rbac_policy.admin.csv',
};

export async function getCasbinEnforcerByFileName(
  name: string,
): Promise<casbin.Enforcer | undefined> {
  const CASBIN_ENFORCERS: {[key: string]: Promise<casbin.Enforcer>} = {
    anonymous: createEnforcerByRole(POLICY_PATHS.anonymous),
    authUser: createEnforcerByRole(POLICY_PATHS.authUser),
    owner: createEnforcerByRole(POLICY_PATHS.owner),
    schoolAdmin: createEnforcerByRole(POLICY_PATHS.schoolAdmin),
    admin: createEnforcerByRole(POLICY_PATHS.admin),
  };
  // console.log('getCasbinEnforcerByName: ', CASBIN_ENFORCERS);
  // console.log('getCasbinEnforcerByName: ', name);

  if (Object.prototype.hasOwnProperty.call(CASBIN_ENFORCERS, name))
    return CASBIN_ENFORCERS[name];
  return undefined;
}

export async function createEnforcerByRole(
  policyPath: string,
): Promise<casbin.Enforcer> {
  const conf = path.resolve(
    __dirname,
    './../../../fixtures/casbin/rbac_model.conf',
  );
  const policy = path.resolve(__dirname, policyPath);
  console.log('Create EnforcerByRole:', conf);

  return casbin.newEnforcer(conf, policy);
}

@injectable()
export class CasbinDbEnforcer {
  dbAdapter: Promise<TypeORMAdapter>;

  constructor() {
    this.dbAdapter = TypeORMAdapter.newAdapter({
      type: 'mysql',
      host: DB_CONFIG.host,
      port: DB_CONFIG.port,
      username: DB_CONFIG.user,
      password: DB_CONFIG.password,
      database: DB_CONFIG.database,
    })
  }

  closeConnection() {
    this.dbAdapter.then(a => {
      if (a) {
        a.close().catch(e => console.debug(e));
      }
    }).catch(error => {
      console.log(error);
    })
  }

  async enforcerFactory() {
    const conf = path.resolve(
      __dirname,
      './../../../fixtures/casbin/rbac_model.conf',
    );
    // console.log(await this.dbAdapter);
    if (!await this.dbAdapter) {
      throw new Error('Cannot connect to database');
    }
    return casbin.newEnforcer(conf, await this.dbAdapter);
  }


}

// Copyright IBM Corp. 2020. All Rights Reserved.
// Node module: @loopback/example-access-control-migration
// This file is licensed under the MIT License.
// License text available at https://opensource.org/licenses/MIT

import {
  AuthorizationContext,
  AuthorizationDecision,
  AuthorizationMetadata,
  AuthorizationRequest,
  Authorizer
} from '@loopback/authorization';
import {inject, Provider} from '@loopback/core';
import * as casbin from 'casbin';
import {CasbinDbEnforcer} from '.';
import {RESOURCE_ID} from '../../keys';

const debug = require('debug')('loopback:example:acl');
const DEFAULT_SCOPE = 'execute';

// Class level authorizer
export class CasbinAuthorizationProvider implements Provider<Authorizer> {
  enforcer: Promise<casbin.Enforcer>;

  constructor(
    @inject('casbin.enforcer.factory')
    private enforcerFactoryClass: CasbinDbEnforcer,
  ) {
    this.enforcer = this.enforcerFactoryClass.enforcerFactory();
    // console.log(this.enforcer);
  }

  /**
   * @returns authenticateFn
   */
  value(): Authorizer {
    return this.Authorizer.bind(this);
  }

  async Authorizer(
    authorizationCtx: AuthorizationContext,
    metadata: AuthorizationMetadata,
  ): Promise<AuthorizationDecision> {
    // handle unauthenticated errors
    // console.log(authorizationCtx?.principals);
    if (!(authorizationCtx?.principals?.length > 0)) {
      return AuthorizationDecision.DENY;
    }
    const subject = this.getUserName(authorizationCtx.principals[0].id);
    // console.log('authorize subject:', subject);

    const resourceId = await authorizationCtx.invocationContext.get(
      RESOURCE_ID,
      {optional: true},
    );
    const object = resourceId ?? metadata.resource ?? authorizationCtx.resource;

    const request: AuthorizationRequest = {
      subject,
      object,
      action: metadata.scopes?.[0] ?? DEFAULT_SCOPE,
    };

    // console.debug('authorize request: ', request);

    const allowedRoles = metadata.allowedRoles;
    // console.debug('authorize allowed roles: ', allowedRoles)

    if (!allowedRoles) return AuthorizationDecision.ALLOW;
    if (allowedRoles.length < 1) return AuthorizationDecision.ALLOW; // No role restrictions

    let allow = false;
    // An optimization for ONLY searching among the allowed roles' policies
    for (const role of allowedRoles) {

      const objects: string[] = request.object.split('_');
      const id = objects.length > 1 ? objects[1] : ''; // handling ownership, getting logged in user id

      // console.log('Objects: ' + JSON.stringify(objects))
      const allowedByRole: boolean = await (await this.enforcer).enforce(
        request.subject,
        objects[0],
        request.action
      );

      // console.debug(`authorizer role: ${role}, result: ${JSON.stringify(allowedByRole)}`);
      if (allowedByRole) {
        allow = true;
        break;
      }
    }

    // console.debug('final result: ', allow);

    if (allow) return AuthorizationDecision.ALLOW;
    else if (allow === false) return AuthorizationDecision.DENY;
    return AuthorizationDecision.ABSTAIN;
  }

  // Generate the user name according to the naming convention
  // in casbin policy
  // A user's name would be `u${id}`
  getUserName(id: number): string {
    return `u${id}`;
  }
}

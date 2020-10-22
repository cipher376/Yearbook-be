// Copyright IBM Corp. 2020. All Rights Reserved.
// Node module: @loopback/example-access-control-migration
// This file is licensed under the MIT License.
// License text available at https://opensource.org/licenses/MIT

import {AuthorizationTags} from '@loopback/authorization';
import {Binding, BindingScope, Component} from '@loopback/core';
import {CasbinAuthorizationProvider, CasbinDbEnforcer} from '.';

export class CasbinAuthorizationComponent implements Component {
  bindings: Binding[] = [
    Binding.bind('casbin.enforcer.factory').toClass(CasbinDbEnforcer).inScope(BindingScope.SINGLETON),
    Binding.bind('authorizationProviders.casbin-provider')
      .toProvider(CasbinAuthorizationProvider)
      .tag(AuthorizationTags.AUTHORIZER),
  ];
}

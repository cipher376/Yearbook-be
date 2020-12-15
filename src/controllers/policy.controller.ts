import {authenticate} from '@loopback/authentication';
import {authorize} from '@loopback/authorization';
import {inject} from '@loopback/core';
import {get, getModelSchemaRef, HttpErrors, patch, post, requestBody} from '@loopback/rest';
import * as casbin from 'casbin';
import {ACL_POLICY} from '../acls/policy.acl';
import {Policy} from '../models/policy.model';
import {CasbinDbEnforcer} from './../services/casbin-authorization/casbin.enforcers';


export class PolicyController {
  enforcer: Promise<casbin.Enforcer>;

  constructor(
    @inject('casbin.enforcer.factory')
    private enforcerService: CasbinDbEnforcer,
  ) {
    this.enforcer = enforcerService.enforcerFactory();
  }



  @get('/count-policies', {
    responses: {
      '200': {
        description: 'Count the number of policies in the system',
        // content: {'application/json': {schema: getModelSchemaRef(Policy)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POLICY['count-policies'])
  async countPolicy(): Promise<number> {
    const result = ((await this.enforcer).getPolicy());
    return (await result)?.length;
  }

  @post('/add-policy', {
    responses: {
      '200': {
        description: 'Policy model instance',
        // content: {'application/json': {schema: getModelSchemaRef(Policy)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POLICY['add-policy'])
  async addPolicy(
    @requestBody({
      description: 'Adds new policy rule to the database',
      content: {
        'application/json': {
          // schema: getModelSchemaRef(Policy, {
          // title: 'new policy'
          // }),
        },
      },
    })
    policy: Policy,
  ): Promise<Policy> {
    // console.log(policy);
    if (!policy.subject || !policy.object || !policy.action) {
      throw new HttpErrors.UnprocessableEntity('Policy object not valid!')
    }
    (await this.enforcer).addPolicy(...[policy.subject, policy.object as string, policy.action as string]).then(_ => {
    }).catch(error => {
      console.debug(error);
    })
    return policy;
  }

  @post('/add-policies', {
    responses: {
      '200': {
        description: 'Array of boolean values',
        // content: {'application/json': {schema: getModelSchemaRef(Policy)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POLICY['add-policy'])
  async addPolicies(
    @requestBody({
      description: 'AddPolicies adds authorization rules to the current policy. The operation is atomic in nature. Hence, if authorization rules consists of rules which are not consistent with the current policy, the function returns false and no policy rule is added to the current policy. If all the authorization rules are consistent with the policy rules, the function returns true and each policy rule is added to the current policy.',
      content: {
        'application/json': {
          // schema: getModelSchemaRef(Policy, {
          // title: 'new policy'
          // }),
        },
      },
    })
    policies: Policy[],
  ): Promise<Boolean> {
    const policiesArray: string[][] = [];
    policies.forEach(policy => {
      if (policy.object && policy.action) {
        policiesArray.push([policy.subject, policy.object as string, policy.action as string]);
      }
    });
    const result = (await this.enforcer).addPolicies(policiesArray);
    result.catch(error => {console.debug(error)})
    return result;
  }




  @post('/remove-policy', {
    responses: {
      '200': {
        description: 'Policy model instance',
        // content: {'application/json': {schema: getModelSchemaRef(Policy)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POLICY['remove-policy'])
  async removePolicy(
    @requestBody({
      description: 'RemovePolicy removes an authorization rule from the current policy.',
      content: {
        'application/json': {
          // schema: getModelSchemaRef(Policy, {
          // title: 'new policy'
          // }),
        },
      },
    })
    policy: Policy,
  ): Promise<Boolean> {
    if (!policy.object || !policy.action) {
      throw new HttpErrors.UnprocessableEntity('Invalid policy object!')
    }
    const result = (await this.enforcer).removePolicy(...[policy.subject, policy.object as string, policy.action as string]);
    result.then(_ => {
    }).catch(error => {
      console.debug(error);
    })
    return result;
  }

  @post('/remove-policies', {
    responses: {
      '200': {
        description: 'Array of boolean values',
        // content: {'application/json': {schema: getModelSchemaRef(Policy)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POLICY['remove-policy'])
  async removePolicies(
    @requestBody({
      description: `RemovePolicies removes authorization rules from the current policy.
      The operation is atomic in nature. Hence, if authorization rules consists of rules
       which are not consistent with the current policy, the function returns false and no
        policy rule is removed from the current policy. If all the authorization rules are
        consistent with the policy rules,
      the function returns true and each policy rule is removed from the current policy.`,
      content: {
        'application/json': {
          // schema: getModelSchemaRef(Policy, {
          // title: 'new policy'
          // }),
        },
      },
    })
    policies: Policy[],
  ): Promise<Boolean> {
    const policiesArray: string[][] = [];
    policies.forEach(policy => {
      policiesArray.push([policy.subject, policy.object as string, policy.action as string]);
    });
    const result = (await this.enforcer).removePolicies(policiesArray);
    result.catch(error => {console.debug(error)})
    return result;
  }









  @post('/has-policy', {
    responses: {
      '200': {
        description: 'Returns true if policy exist',
        // content: {'application/json': {schema: getModelSchemaRef(Boolean)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POLICY['has-policy'])
  async hasPolicy(
    @requestBody({
      description: 'Check if policy rule already exist',
      content: {
        'application/json': {
          // schema: getModelSchemaRef(Policy, {
          //   title: 'Check policy'
          // }),
        },
      },
    })
    policy: Policy,
  ): Promise<Boolean | void> {
    if (!policy.object || !policy.action) {
      throw new HttpErrors.UnprocessableEntity('Invalid policy object!')
    }
    const result = (await this.enforcer).hasPolicy(policy.subject, policy.object as string, policy.action as string);
    if (!await result) {
      return false;
    }
    return true;
  }


  @post('/has-named-policy', {
    responses: {
      '200': {
        description: 'HasNamedPolicy determines whether a named authorization rule exists.',
        // content: {'application/json': {schema: getModelSchemaRef(Boolean)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POLICY['has-policy'])
  async hasNamedPolicy(
    @requestBody({
      description: 'Check if policy rule already exist',
      content: {
        'application/json': {
          // schema: getModelSchemaRef(Policy, {
          //   title: 'Check policy'
          // }),
        },
      },
    })
    policy: Policy,
  ): Promise<Boolean | void> {
    if (!policy.object || !policy.action) {
      throw new HttpErrors.UnprocessableEntity('Invalid policy object!')
    }
    policy.ptype = policy.ptype ?? 'p';
    const result = (await this.enforcer).hasNamedPolicy(policy.ptype, policy.subject, policy.object, policy.action);
    if (!await result) {
      return false;
    }
    return true;
  }


  @get('/get-all-subjects', {
    responses: {
      '200': {
        description: 'Policy model instance',
        // content: {'application/json': {schema: getModelSchemaRef(Policy)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POLICY['has-policy'])
  async getAllSubjects(): Promise<string[]> {
    return (await this.enforcer).getAllSubjects();
  }


  @post('/get-all-named-subjects', {
    responses: {
      '200': {
        description: 'GetAllNamedSubjects gets the list of subjects that show up in the current named policy',
        // content: {'application/json': {schema: getModelSchemaRef(Policy)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POLICY['list-subject'])
  async getAllNamedSubjects(
    @requestBody({
      description: "Submit the ptype value, default to 'p'",
      content: {
        'application/json': {
          // schema: getModelSchemaRef(Policy, {
          //   title: 'Check policy'
          // }),
        },
      },
    }) ptype?: string
  ): Promise<string[]> {
    ptype = ptype ?? 'p';
    return (await this.enforcer).getAllNamedSubjects(ptype);
  }



  @get('/get-all-objects', {
    responses: {
      '200': {
        description: 'GetAllObjects gets the list of objects that show up in the current policy.',
        // content: {'application/json': {schema: getModelSchemaRef(Policy)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POLICY['list-object'])
  async getAllObjects(): Promise<string[]> {
    return (await this.enforcer).getAllObjects();
  }

  @post('/get-all-named-objects', {
    responses: {
      '200': {
        description: 'GetAllNamedObjects gets the list of objects that show up in the current named policy.',
        // content: {'application/json': {schema: getModelSchemaRef(Policy)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POLICY['list-object'])
  async getAllNamedObjects(
    @requestBody({
      description: "Submit the ptype value, default to 'p'",
      content: {
        'application/json': {
          // schema: getModelSchemaRef(Policy, {
          //   title: 'Check policy'
          // }),
        },
      },
    }) ptype?: string
  ): Promise<string[]> {
    ptype = ptype ?? 'p';
    return (await this.enforcer).getAllNamedObjects(ptype);
  }


  @get('/get-all-actions', {
    responses: {
      '200': {
        description: 'GetAllActions gets the list of actions that show up in the current policy.',
        // content: {'application/json': {schema: getModelSchemaRef(Policy)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POLICY['list-action'])
  async getAllActions(): Promise<string[]> {
    return (await this.enforcer).getAllActions();
  }

  @post('/get-all-named-actions', {
    responses: {
      '200': {
        description: 'GetAllNamedActions gets the list of actions that show up in the current named policy.',
        // content: {'application/json': {schema: getModelSchemaRef(Policy)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POLICY['list-action'])
  async getAllNamedActions(
    @requestBody({
      description: "Submit the ptype value, default to 'p'",
      content: {
        'application/json': {
          // schema: getModelSchemaRef(Policy, {
          //   title: 'Check policy'
          // }),
        },
      },
    }) ptype?: string
  ): Promise<string[]> {
    ptype = ptype ?? 'p';
    return (await this.enforcer).getAllNamedActions(ptype);
  }

  @get('/get-all-roles', {
    responses: {
      '200': {
        description: 'GetAllRoles gets the list of roles that show up in the current policy.',
        // content: {'application/json': {schema: getModelSchemaRef(Policy)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POLICY['list-role'])
  async getAllRoles(): Promise<string[]> {
    return (await this.enforcer).getAllRoles();
  }


  @get('/count-roles', {
    responses: {
      '200': {
        description: 'Count the number of roles in the system',
        // content: {'application/json': {schema: getModelSchemaRef(Policy)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POLICY['list-role'])
  async countRoles(): Promise<number> {
    const result = ((await this.enforcer).getGroupingPolicy());
    return (await result)?.length;
  }


  @post('/get-all-named-roles', {
    responses: {
      '200': {
        description: 'GetAllNamedRoles gets the list of roles that show up in the current named policy.',
        // content: {'application/json': {schema: getModelSchemaRef(Policy)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POLICY['list-role'])
  async getAllNamedRoles(
    @requestBody({
      description: "Submit the gtype value, e.g 'g'",
      content: {
        'application/json': {
          // schema: getModelSchemaRef(Policy, {
          //   title: 'Check policy'
          // }),
        },
      },
    }) ptype?: string
  ): Promise<string[]> {
    ptype = ptype ?? 'g';
    return (await this.enforcer).getAllNamedRoles(ptype);
  }



  @get('/get-all-policy', {
    responses: {
      '200': {
        description: 'GetPolicy gets all the authorization rules in the policy.',
        // content: {'application/json': {schema: getModelSchemaRef(Policy)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POLICY['list-policy'])
  async getPolicy(): Promise<Policy[]> {
    const result = (await this.enforcer).getPolicy();
    const policies: Policy[] = [];
    (await result).forEach(policy => {
      console.log(policy);
      const temPolicy = new Policy();
      temPolicy.subject = policy[0];
      temPolicy.object = policy[1];
      temPolicy.action = policy[2];
      temPolicy.domain = policy[3];
      policies.push(temPolicy);
    })
    return policies;
  }

  @post('/get-all-filtered-policy', {
    responses: {
      '200': {
        description: 'GetFilteredPolicy gets all the authorization rules in the policy, field filters can be specified.',
        // content: {'application/json': {schema: getModelSchemaRef(Policy)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POLICY['list-policy'])
  async getFilteredPolicy(
    @requestBody({
      description: "Submit the gtype value, default to 'g'",
      content: {
        'application/json': {
          schema: getModelSchemaRef(Policy),
        },
      },
    }) filter: {subject: string, index?: number}
  ): Promise<string[][]> {
    filter.index = filter.index ?? 0;
    return (await this.enforcer).getFilteredPolicy(filter.index, filter.subject);
  }

  @get('/get-group-policy', {
    responses: {
      '200': {
        description: 'GetGroupingPolicy gets all the role inheritance rules in the policy.',
        type: 'array',
        "items": getModelSchemaRef(Policy)
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POLICY['list-policy'])
  async getGroupingPolicy(): Promise<Policy[]> {
    const result = (await this.enforcer).getGroupingPolicy();
    console.log(result);
    const policies: Policy[] = [];
    (await result).forEach(policy => {
      console.log(policy);
      const temPolicy = new Policy();
      temPolicy.subject = policy[0];
      temPolicy.role = policy[1];
      policies.push(temPolicy);
    })
    return policies;
  }

  @post('/get-filtered-group-policy', {
    responses: {
      '200': {
        description: 'GetFilteredGroupingPolicy gets all the role inheritance rules in the policy, field filters can be specified.',
        // content: {'application/json': {schema: getModelSchemaRef(Policy)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POLICY['list-policy'])
  async getFilteredGroupingPolicy(
    @requestBody({
      description: "Submit the gtype value, default to 'g'",
      content: {
        'application/json': {
          schema: getModelSchemaRef(Policy),
        },
      },
    }) filter: {subject: string, index?: number}
  ): Promise<string[][]> {
    filter.index = filter.index ?? 0;
    return (await this.enforcer).getFilteredGroupingPolicy(filter.index, filter.subject);
  }


  @post('/get-named-group-policy', {
    responses: {
      '200': {
        description: 'GetNamedGroupingPolicy gets all the role inheritance rules in the policy.',
        // content: {'application/json': {schema: getModelSchemaRef(Policy)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POLICY['list-policy'])
  async getNamedGroupingPolicy(
    @requestBody({
      description: "Submit the gtype value, default to 'g'",
      content: {
        'application/json': {
          schema: getModelSchemaRef(Policy),
        },
      },
    })
    ptype: string
  ): Promise<string[][]> {
    return (await this.enforcer).getNamedGroupingPolicy(ptype ?? 'g');
  }




  @post('/add-grouping-policy', {
    responses: {
      '200': {
        description: 'Policy model instance',
        // content: {'application/json': {schema: getModelSchemaRef(Policy)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POLICY['add-policy'])
  async addGroupingPolicy(
    @requestBody({
      description: `AddGroupingPolicy adds a role inheritance rule to the current policy.
      If the rule already exists, the function returns false and the rule will not be added.
      Otherwise the function returns true by adding the new rule.`,
      content: {
        'application/json': {
          schema: getModelSchemaRef(Policy),
        },
      },
    })
    policy: Policy,
  ): Promise<Policy> {
    console.log(policy);
    if (!policy.role) {
      throw new HttpErrors.UnprocessableEntity('Invalid policy object! Subject and role must be specified')
    }
    (await this.enforcer).addGroupingPolicy(...[policy.subject, policy.role]).then(_ => {
    }).catch(error => {
      console.debug(error);
    })
    const hasP = await this.hasPolicy(policy)
    console.log('Testing');
    console.log(hasP);
    if (!hasP) {
      throw new HttpErrors.UnprocessableEntity('Policy object not valid!')
    }
    return policy;
  }



  @post('/add-grouping-policies', {
    responses: {
      '200': {
        description: 'Array of boolean values',
        // content: {'application/json': {schema: getModelSchemaRef(Policy)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POLICY['add-policy'])
  async addGroupingPolicies(
    @requestBody({
      description: `
      AddGroupingPolicies adds role inheritance rules to the current policy.
      The operation is atomic in nature. Hence, if authorization rules consists
       of rules which are not consistent with the current policy, the function
       returns false and no policy rule is added to the current policy. If all
       authorization the rules are consistent with the policy rules, the function
       returns true and each policy rule is added to the current policy.`,
      content: {
        'application/json': {
          type: 'array',
          "items": getModelSchemaRef(Policy)
        },
      },
    })
    policies: Policy[],
  ): Promise<Boolean> {
    const policiesArray: string[][] = [];
    policies.forEach(policy => {
      if (policy.role) {
        policiesArray.push([policy.subject, policy.role]);
      }
    });
    const result = (await this.enforcer).addGroupingPolicies(policiesArray);
    result.catch(error => {console.debug(error)})
    console.log(result);
    return result;
  }


  @post('/add-named-grouping-policy', {
    responses: {
      '200': {
        description: 'Policy model instance',
        // content: {'application/json': {schema: getModelSchemaRef(Policy)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POLICY['add-policy'])
  async addNamedGroupingPolicy(
    @requestBody({
      description: `AddNamedGroupingPolicy adds a named role inheritance
      rule to the current policy. If the rule already exists, the function
      returns false and the rule will not be added. Otherwise the function
      returns true by adding the new rule.`,
      content: {
        'application/json': {
          schema: getModelSchemaRef(Policy),
        },
      },
    })
    policy: Policy,
  ): Promise<Policy> {
    if (!policy.role || !policy.ptype) {
      throw new HttpErrors.UnprocessableEntity('Invalid policy object! Subject and role must be specified')
    }
    (await this.enforcer).addNamedGroupingPolicy(policy.ptype, policy.subject, policy.role).then(_ => {
    }).catch(error => {
      console.debug(error);
    })
    if (!await this.hasPolicy(policy)) {
      throw new HttpErrors.UnprocessableEntity('Policy object not valid!')
    }
    return policy;
  }



  @post('/add-named-grouping-policies', {
    responses: {
      '200': {
        description: 'Array of boolean values',
        // content: {'application/json': {schema: getModelSchemaRef(Policy)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POLICY['add-policy'])
  async addNamedGroupingPolicies(
    @requestBody({
      description: `
      AddNamedGroupingPolicies adds named role inheritance rules to the current
       policy. The operation is atomic in nature. Hence, if authorization rules
        consists of rules which are not consistent with the current policy, the
         function returns false and no policy rule is added to the current
          policy. If all the authorization rules are consistent with the policy
           rules, the function returns true and each policy rule is added to
            the current policy.`,
      content: {
        'application/json': {
          // schema: getModelSchemaRef(Policy, {
          // title: 'new policy'
          // }),
        },
      },
    })
    policies: Policy[],
  ): Promise<Boolean> {
    console.debug(policies);
    const policiesArray: string[][] = [];
    policies.forEach(policy => {
      if (policy.role) {
        policiesArray.push([policy.subject, policy.role]);
      }
    });
    console.log(policiesArray);
    let result;
    if (policies?.length && policies[0]?.ptype) {
      result = (await this.enforcer).addNamedGroupingPolicies(policies[0].ptype, policiesArray);
      result.catch(error => {console.debug(error)})
      return result;
    }
    return false;
  }


  @post('/remove-grouping-policy', {
    responses: {
      '200': {
        description: 'Policy model instance',
        // content: {'application/json': {schema: getModelSchemaRef(Policy)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POLICY['remove-policy'])
  async removeGroupingPolicy(
    @requestBody({
      description: `RemoveGroupingPolicy removes a role
      inheritance rule from the current policy.`,
      content: {
        'application/json': {
          // schema: getModelSchemaRef(Policy, {
          // title: 'new policy'
          // }),
        },
      },
    })
    policy: Policy,
  ): Promise<Policy> {
    console.log(policy);
    if (!policy.role) {
      throw new HttpErrors.UnprocessableEntity('Invalid policy object!')
    }
    (await this.enforcer).removeGroupingPolicy(policy.subject, policy.role).then(_ => {
    }).catch(error => {
      console.debug(error);
    })
    return policy;
  }

  @post('/remove-grouping-policies', {
    responses: {
      '200': {
        description: 'Array of boolean values',
        // content: {'application/json': {schema: getModelSchemaRef(Policy)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POLICY['remove-policy'])
  async removeGroupingPolicies(
    @requestBody({
      description: `RemoveGroupingPolicies removes role inheritance rules from
      the current policy. The operation is atomic in nature. Hence, if
      authorization rules consists of rules which are not consistent with the
      current policy, the function returns false and no policy rule is removed
      from the current policy. If all the authorization rules are consistent
      with the policy rules, the function returns true and each policy rule is
      removed from the current policy.`,
      content: {
        'application/json': {
          // schema: getModelSchemaRef(Policy, {
          // title: 'new policy'
          // }),
        },
      },
    })
    policies: Policy[],
  ): Promise<Boolean> {
    const policiesArray: string[][] = [];
    policies.forEach(policy => {
      if (policy.role) {
        policiesArray.push([policy.subject, policy.role]);
      }
    });
    const result = (await this.enforcer).removeGroupingPolicies(policiesArray);
    result.catch(error => {console.debug(error)});
    return result;
  }



  @patch('/update-policy', {
    responses: {
      '200': {
        description: 'Policy model instance',
        // content: {'application/json': {schema: getModelSchemaRef(Policy)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_POLICY['add-policy'])
  async updatePolicy(
    @requestBody({
      description: 'UpdatePolicy update a old policy to new policy.',
      content: {
        'application/json': {
          // schema: getModelSchemaRef(Policy, {
          // title: 'new policy'
          // }),
        },
      },
    })
    oldPolicy: Policy,
    newPolicy: Policy,
  ): Promise<Boolean> {

    if (await this.removePolicy(oldPolicy)) {
      if (!newPolicy.object || !newPolicy.action) {
        throw new HttpErrors.UnprocessableEntity('Policy object not valid!')
      }
      const result = (await this.enforcer).addPolicy(...[newPolicy.subject, newPolicy.object as string, newPolicy.action as string]);
      result.catch(error => {
        console.debug(error);
      })

      if (!await this.hasPolicy(newPolicy)) {
        throw new HttpErrors.UnprocessableEntity('Policy object not valid!')
      }
      return result;
    }
    return false;

  }








}

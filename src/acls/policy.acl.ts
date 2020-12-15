
const RESOURCE_NAME = 'policy';

export const ACL_POLICY = {
  'count-policies': {
    resource: RESOURCE_NAME,
    scopes: ['count-policies'],
    allowedRoles: ['admin'],
  },
  'add-policy': {
    resource: RESOURCE_NAME,
    scopes: ['add-policy'],
    allowedRoles: ['admin'],
  },
  'remove-policy': {
    resource: RESOURCE_NAME,
    scopes: ['remove-policy'],
    allowedRoles: ['admin'],
  },
  'has-policy': {
    resource: RESOURCE_NAME,
    scopes: ['has-policy'],
    allowedRoles: ['admin'],
  },

  'list-policy': {
    resource: RESOURCE_NAME,
    scopes: ['list-policy'],
    allowedRoles: ['admin'],
  },
  'list-subject': {
    resource: RESOURCE_NAME,
    scopes: ['list-subject'],
    allowedRoles: ['admin'],
  },
  'list-object': {
    resource: RESOURCE_NAME,
    scopes: ['list-object'],
    allowedRoles: ['admin'],
  },
  'list-action': {
    resource: RESOURCE_NAME,
    scopes: ['list-action'],
    allowedRoles: ['admin'],
  },
  'list-role': {
    resource: RESOURCE_NAME,
    scopes: ['list-role'],
    allowedRoles: ['admin'],
  }
};

import {assignInstanceId} from '../services/casbin-authorization';

const RESOURCE_NAME = 'school';

export const ACL_SCHOOL = {
  create: {
    resource: RESOURCE_NAME,
    scopes: ['create'],
    allowedRoles: ['admin'],
  },
  count: {
    resource: RESOURCE_NAME,
    scopes: ['count'],
    allowedRoles: ['authUser'],
  },
  'list-all': {
    resource: RESOURCE_NAME,
    scopes: ['list-all'],
    allowedRoles: ['anonymous'],
  },
  'update-all': {
    resource: RESOURCE_NAME,
    scopes: ['update-all'],
    allowedRoles: ['admin', 'schoolAdmin'],
  },
  'find-by-id': {
    resource: RESOURCE_NAME,
    scopes: ['find-by-id'],
    allowedRoles: ['anonymous'],
    voters: [assignInstanceId],
  },
  'update-by-id': {
    resource: RESOURCE_NAME,
    scopes: ['update-by-id'],
    allowedRoles: ['admin', 'schoolAdmin'],
    voters: [assignInstanceId],
  },
  'replace-by-id': {
    resource: RESOURCE_NAME,
    scopes: ['replace-by-id'],
    allowedRoles: ['admin'],
    voters: [assignInstanceId],
  },
  'delete-by-id': {
    resource: RESOURCE_NAME,
    scopes: ['delete-by-id'],
    allowedRoles: ['admin'],
    voters: [assignInstanceId],
  }
};

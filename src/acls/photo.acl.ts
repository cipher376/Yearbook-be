import {assignInstanceId} from '../services/casbin-authorization';

const RESOURCE_NAME = 'photo';

export const ACL_PHOTO = {
  create: {
    resource: RESOURCE_NAME,
    scopes: ['create'],
    allowedRoles: ['authUser'],
  },
  count: {
    resource: RESOURCE_NAME,
    scopes: ['count'],
    allowedRoles: ['authUser'],
  },
  'list-all': {
    resource: RESOURCE_NAME,
    scopes: ['list-all'],
    allowedRoles: ['admin'],
  },
  'update-all': {
    resource: RESOURCE_NAME,
    scopes: ['update-all'],
    allowedRoles: ['admin'],
  },
  'find-by-id': {
    resource: RESOURCE_NAME,
    scopes: ['find-by-id'],
    allowedRoles: ['authUser'],
    voters: [assignInstanceId],
  },
  'update-by-id': {
    resource: RESOURCE_NAME,
    scopes: ['update-by-id'],
    allowedRoles: ['admin', 'owner'],
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
    allowedRoles: ['admin', 'owner'],
    voters: [assignInstanceId],
  }
};

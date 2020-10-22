import {assignInstanceId} from '../services/casbin-authorization';

const RESOURCE_NAME = 'school_address';

export const ACL_SCHOOL_ADDRESS = {
  create: {
    resource: RESOURCE_NAME,
    scopes: ['create'],
    allowedRoles: ['admin', 'schoolAdmin'],
    voters: [assignInstanceId],
  },
  'list-all': {
    resource: RESOURCE_NAME,
    scopes: ['list-all'],
    allowedRoles: ['admin', 'authUser'],
  },
  'update-by-id': {
    resource: RESOURCE_NAME,
    scopes: ['update-by-id'],
    allowedRoles: ['admin', 'schoolAdmin'],
    voters: [assignInstanceId],
  },

  'delete-by-id': {
    resource: RESOURCE_NAME,
    scopes: ['delete-by-id'],
    allowedRoles: ['admin'],
    voters: [assignInstanceId],
  }
}

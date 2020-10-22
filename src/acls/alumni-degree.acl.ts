import {assignInstanceId} from '../services/casbin-authorization';

const RESOURCE_NAME = 'alumni_degree';

export const ACL_ALUMNI_DEGREE = {
  create: {
    resource: RESOURCE_NAME,
    scopes: ['create'],
    allowedRoles: ['authUser'],
    voters: [assignInstanceId],
  },
  'list-all': {
    resource: RESOURCE_NAME,
    scopes: ['list-all'],
    allowedRoles: ['admin', 'owner'],
  },
  'update-by-id': {
    resource: RESOURCE_NAME,
    scopes: ['update-by-id'],
    allowedRoles: ['admin', 'owner'],
    voters: [assignInstanceId],
  },

  'delete-by-id': {
    resource: RESOURCE_NAME,
    scopes: ['delete-by-id'],
    allowedRoles: ['admin', 'owner'],
    voters: [assignInstanceId],
  }
}

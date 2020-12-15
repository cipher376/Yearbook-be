import {assignInstanceId} from '../services/casbin-authorization';

const RESOURCE_NAME = 'post';

export const ACL_POST = {
  create: {
    resource: RESOURCE_NAME,
    scopes: ['create'],
    allowedRoles: ['authUser']
  },
  'list-all': {
    resource: RESOURCE_NAME,
    scopes: ['list-all'],
    allowedRoles: []
  },
  'update-by-id': {
    resource: RESOURCE_NAME,
    scopes: ['update-by-id'],
    allowedRoles: ['admin', 'schoolAdmin'], // school post
    voters: [assignInstanceId],
  },
  'delete-by-id': {
    resource: RESOURCE_NAME,
    scopes: ['delete-by-id'],
    allowedRoles: ['admin', 'schoolAdmin'], // school post
    voters: [assignInstanceId],
  }
}

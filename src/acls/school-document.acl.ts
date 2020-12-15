import {assignInstanceId} from '../services/casbin-authorization';

const RESOURCE_NAME = 'school_document';

export const ACL_SCHOOL_DOCUMENT = {
  create: {
    resource: RESOURCE_NAME,
    scopes: ['create'],
    allowedRoles: ['admin', 'schoolAdmin'],
    voters: [assignInstanceId],
  },
  'list-all': {
    resource: RESOURCE_NAME,
    scopes: ['list-all'],
    allowedRoles: [],
    voters: [assignInstanceId],
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
    allowedRoles: ['admin', 'schoolAdmin'],
    voters: [assignInstanceId],
  }
}

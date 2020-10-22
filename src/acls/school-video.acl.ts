import {assignInstanceId} from '../services/casbin-authorization';

const RESOURCE_NAME = 'school_video';

export const ACL_SCHOOL_VIDEO = {
  create: {
    resource: RESOURCE_NAME,
    scopes: ['create'],
    allowedRoles: ['admin', 'schoolAdmin'],
    voters: [assignInstanceId],
  },
  'list-all': {
    resource: RESOURCE_NAME,
    scopes: ['list-all'],
    allowedRoles: ['anonymous'],
    voters: [assignInstanceId],
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
    allowedRoles: ['admin', 'schoolAdmin'],
    voters: [assignInstanceId],
  }
}

import {assignInstanceId} from '../services/casbin-authorization';

const RESOURCE_NAME = 'school_audio';

export const ACL_SCHOOL_AUDIO = {
  create: {
    resource: RESOURCE_NAME,
    scopes: ['create'],
    allowedRoles: ['authUser'],
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
    allowedRoles: ['admin',],
    voters: [assignInstanceId],
  },

  'delete-by-id': {
    resource: RESOURCE_NAME,
    scopes: ['delete-by-id'],
    allowedRoles: ['admin', 'schoolAdmin'],
    voters: [assignInstanceId],
  }
}

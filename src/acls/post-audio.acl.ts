import {assignInstanceId} from '../services/casbin-authorization';

const RESOURCE_NAME = 'post_audio';

export const ACL_POST_AUDIO = {
  create: {
    resource: RESOURCE_NAME,
    scopes: ['create'],
    allowedRoles: ['authUser'],
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
    allowedRoles: ['admin', 'authUser'], // owner
    voters: [assignInstanceId],
  },

  'delete-by-id': {
    resource: RESOURCE_NAME,
    scopes: ['delete-by-id'],
    allowedRoles: ['admin', 'authUser'], // owner or admin or school admin
    voters: [assignInstanceId],
  }
}

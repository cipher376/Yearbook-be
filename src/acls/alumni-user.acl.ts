import {assignInstanceId} from '../services/casbin-authorization';

const RESOURCE_NAME = 'alumni_user';

export const ACL_ALUMNI_USER = {

  'find-by-id': {
    resource: RESOURCE_NAME,
    scopes: ['find-by-id'],
    allowedRoles: ['admin', 'owner'],
    voters: [assignInstanceId],
  }
}

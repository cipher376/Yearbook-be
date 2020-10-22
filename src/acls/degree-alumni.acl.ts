import {assignInstanceId} from '../services/casbin-authorization';

const RESOURCE_NAME = 'degree_alumni';

export const ACL_DEGREE_ALUMNI = {

  'find-by-id': {
    resource: RESOURCE_NAME,
    scopes: ['find-by-id'],
    allowedRoles: ['admin', 'owner'],
    voters: [assignInstanceId],
  }
}

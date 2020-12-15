import {assignInstanceId} from '../services/casbin-authorization';

const RESOURCE_NAME = 'user';

/********
 * Un-authentication User ->> anonymous
 * Authenticated User    ->> authUser
 * Owner                 ->> owner
 * School Administrator  ->> schoolAdmin
 * Administrator         ->> admin
 */

export const ACL_USER = {
  signup: {
    resource: RESOURCE_NAME,
    scopes: ['signup'],
    allowedRoles: [],
  },
  login: {
    resource: RESOURCE_NAME,
    scopes: ['login'],
    allowedRoles: [],
  },
  me: {
    resource: RESOURCE_NAME,
    scopes: ['me'],
    allowedRoles: ['authUser'], // owner
    voters: [assignInstanceId],
  },
  'my-profile': {
    resource: RESOURCE_NAME,
    scopes: ['my-profile'],
    allowedRoles: ['authUser'],
    voters: [assignInstanceId],
  },
  'find-by-id': {
    resource: RESOURCE_NAME,
    scopes: ['find-by-id'],
    allowedRoles: [],
    voters: [assignInstanceId],
  },
  'update-by-id': {
    resource: RESOURCE_NAME,
    scopes: ['update-by-id'],
    allowedRoles: ['authUser', 'admin'], // owner
    voters: [assignInstanceId],
  },
  'list-all': {
    resource: RESOURCE_NAME,
    scopes: ['list-all'],
    allowedRoles: [],
  },
  'create-many': {
    resource: RESOURCE_NAME,
    scopes: ['create-many'],
    allowedRoles: ['admin'],
  },
  delete: { // Delete user
    resource: RESOURCE_NAME,
    scopes: ['delete'],
    allowedRoles: ['admin'],
  },
  'ban-user': { // User can't access the account anymore forever
    resource: RESOURCE_NAME,
    scopes: ['ban-user'],
    allowedRoles: ['admin'],
  },
  'block-user': { // Temporally denied user access to his/her account
    resource: RESOURCE_NAME,
    scopes: ['delete'],
    allowedRoles: ['admin'],
  },
  count: {
    resource: RESOURCE_NAME,
    scopes: ['count'],
    allowedRoles: [],
  },
};

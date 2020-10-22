import {assignInstanceId} from '../services/casbin-authorization';

const RESOURCE_NAME = 'user';

export const ACL_USER = {
  signup: {
    resource: RESOURCE_NAME,
    scopes: ['signup'],
    allowedRoles: ['anonymous'],
  },
  login: {
    resource: RESOURCE_NAME,
    scopes: ['login'],
    allowedRoles: ['anonymous'],
  },
  me: {
    resource: RESOURCE_NAME,
    scopes: ['me'],
    allowedRoles: ['authUser', 'owner'],
    voters: [assignInstanceId],
  },
  'my-profile': {
    resource: RESOURCE_NAME,
    scopes: ['my-profile'],
    allowedRoles: ['owner'],
    voters: [assignInstanceId],
  },
  'find-by-id': {
    resource: RESOURCE_NAME,
    scopes: ['find-by-id'],
    allowedRoles: ['authUser'],
    voters: [assignInstanceId],
  },
  'update-by-id': {
    resource: RESOURCE_NAME,
    scopes: ['update-by-id'],
    allowedRoles: ['admin', 'owner'],
    voters: [assignInstanceId],
  },
  count: {
    resource: `${RESOURCE_NAME}*`,
    scopes: ['count'],
    allowedRoles: ['admin'],
  },
  'list-all': {
    resource: `${RESOURCE_NAME}*`,
    scopes: ['list-all'],
    allowedRoles: ['admin', 'schoolAdmin', 'authUser'],
    // allowedRoles: ['anonymous'],
  },
  'create-many': {
    resource: `${RESOURCE_NAME}*`,
    scopes: ['create-many'],
    allowedRoles: ['admin'],
  },
};

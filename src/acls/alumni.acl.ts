import {assignInstanceId} from '../services/casbin-authorization';

const RESOURCE_NAME = 'alumni';

export const ACL_ALUMNI = {
  create: {
    resource: RESOURCE_NAME,
    scopes: ['create'],
    allowedRoles: ['authUser'],
  },
  count: {
    resource: RESOURCE_NAME,
    scopes: ['count'],
    allowedRoles: [],
  },
  'list-all': {
    resource: RESOURCE_NAME,
    scopes: ['list-all'],
    allowedRoles: [],
  },
  'update-all': {
    resource: RESOURCE_NAME,
    scopes: ['update-all'],
    allowedRoles: ['admin'],
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
    allowedRoles: ['admin', 'authUser'], // owner
    voters: [assignInstanceId],
  },
  'replace-by-id': {
    resource: RESOURCE_NAME,
    scopes: ['replace-by-id'],
    allowedRoles: ['admin'],
    voters: [assignInstanceId],
  },
  'delete-by-id': {
    resource: RESOURCE_NAME,
    scopes: ['delete-by-id'],
    allowedRoles: ['admin', 'authUser'], // owner
    voters: [assignInstanceId],
  },
  'delete-by-user-school-id': {
    resource: RESOURCE_NAME,
    scopes: ['delete-by-user-school-id'],
    allowedRoles: ['admin'],
    voters: [assignInstanceId],
  }
};

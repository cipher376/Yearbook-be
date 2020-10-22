import {assignInstanceId} from '../services/casbin-authorization';

const RESOURCE_NAME = 'address';

export const ACL_ADDRESS = {
  count: {
    resource: RESOURCE_NAME,
    scopes: ['count'],
    allowedRoles: ['admin'],
  },
  'list-all': {
    resource: RESOURCE_NAME,
    scopes: ['list-all'],
    allowedRoles: ['admin'],
  },
  'update-all': {
    resource: RESOURCE_NAME,
    scopes: ['update-all'],
    allowedRoles: ['admin'],
  },
  'find-by-id': {
    resource: RESOURCE_NAME,
    scopes: ['find-by-id'],
    allowedRoles: ['admin'],
    voters: [assignInstanceId],
  },
  'update-by-id': {
    resource: RESOURCE_NAME,
    scopes: ['update-by-id'],
    allowedRoles: ['admin'],
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
    allowedRoles: ['admin'],
    voters: [assignInstanceId],
  }
}

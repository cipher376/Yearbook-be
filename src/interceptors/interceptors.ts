import {Interceptor} from '@loopback/core';

const transformUser: Interceptor = async (invocationCtx, next) => {
  console.log('log: before-' + invocationCtx.methodName);
  // Wait until the interceptor/method chain returns
  const result = await next();
  console.log('log: after-' + invocationCtx.methodName);
  return result;
};


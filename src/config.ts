import path from 'path';
import { ApplicationConfig } from '.';

var originsWhitelist = [
  'http://localhost:8100',      //this is my front-end url for development
  'http://www.devtek-limited.com',
  'http://www.devtek-limited.tech'
];


export const APP_CONFIG: ApplicationConfig =
{
  fileStorageDirectory: path.join(__dirname, '../files'),
  rest: {
    port: +(process.env.PORT ?? 3000),
    host: process.env.HOST,
    // The `gracePeriodForClose` provides a graceful close for http/https
    // servers with keep-alive clients. The default value is `Infinity`
    // (don't force-close). If you want to immediately destroy all sockets
    // upon stop, set its value to `0`.
    // See https://www.npmjs.com/package/stoppable
    gracePeriodForClose: 5000, // 5 seconds
    openApiSpec: {
      // useful when used with OpenAPI-to-GraphQL to locate your application
      setServersFromRequest: true,
    },
  },
  cors: {
    origin: (origin: string, callback: any) => {
      var isWhitelisted = originsWhitelist.indexOf(origin) !== -1;
      callback(null, isWhitelisted);
    },
    methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
    preflightContinue: false,
    optionsSuccessStatus: 204,
    maxAge: 86400,
    credentials: true,
    exposedHeaders: ['Content-Length','Cache-Control','Content-Language','Content-Type', 'Expires', 'Last-Modified', 'Authorization']
  }
};


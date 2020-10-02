import {AlmataBeApplication, ApplicationConfig} from './application';
import {APP_CONFIG} from './config';

export * from './application';

export async function main(options: ApplicationConfig = {}) {
  const app = new AlmataBeApplication(options);
  await app.boot();
  await app.migrateSchema(); //Auto drop and create tables
  await app.start();

  const url = app.restServer.url;
  console.log(`Server is running at ${url}`);
  console.log(`Try ${url}/ping`);

  return app;
}

if (require.main === module) {
  // Run the application
  main(APP_CONFIG).catch(err => {
    console.error('Cannot start the application.', err);
    process.exit(1);
  });
}

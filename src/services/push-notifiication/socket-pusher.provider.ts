// import {CoreBindings, inject, Provider} from '@loopback/core';
// import {SocketIoApplication} from '@loopback/socketio';
// import {ApplicationConfig} from '../..';


// export class MySocketApplicationProvider implements Provider<SocketIoApplication>{
//   /**
//    *
//    */
//   constructor(
//     @inject(CoreBindings.APPLICATION_CONFIG)
//     private cfg: ApplicationConfig,
//   ) {
//     this.cfg.rest = {
//       ...this.cfg.rest,
//       // Set the port number for the socket endpoint
//       // 1. `HTTP_PORT environment var
//       // 2. 0
//       // 3. The next port for the billing app
//       port: +(process.env.HTTP_PORT ?? this.cfg.rest.port === 0
//         ? 0
//         : this.cfg.rest.port + 1),
//       protocol: 'http',
//       host: 'localhost'
//     };
//   }


//   value() {
//     return new Promise<SocketIoApplication>(resolve => {
//       // console.log(this.config);
//       return new SocketIoApplication(this.cfg);
//     });
//   }

// }

import {
  Application,
  ApplicationConfig,

  BindingKey,

  BindingScope,

  ContextTags,
  CoreBindings,
  inject,
  lifeCycleObserver
} from '@loopback/core';
import {RestComponent} from '@loopback/rest';
import {SocketIoApplication} from '@loopback/socketio';
import {SocketIoController} from '../../controllers/socket.controller';
import {PasswordHasherBindings, UserServiceBindings} from '../../keys';
import {BcryptHasher} from '../hash.password';
import {PushMessageController} from './../../controllers/push-message.controller';
import {MyUserService} from './../jwt-authentication/user.service';

export const SUB_APPLICATION_SOCKET = BindingKey.create<Application>(
  'sub-application-for-socket');


/***
 * Application for socket communication
 */
@lifeCycleObserver('', {
  tags: {[ContextTags.KEY]: SUB_APPLICATION_SOCKET}
})
export class MYSocketIoApplication extends Application {
  socketConfig: ApplicationConfig;
  socketApp: SocketIoApplication;
  /**
   *
   */
  constructor(
    @inject(CoreBindings.APPLICATION_INSTANCE)
    private mainApp: Application,
    @inject(CoreBindings.APPLICATION_CONFIG)
    private cfg: ApplicationConfig,
  ) {
    super(cfg);


    cfg.rest.port = cfg.rest.port + 1;
    // Mount Rest component
    this.component(RestComponent);
    this.socketConfig = {...cfg};

    this.socketApp = new SocketIoApplication(this.socketConfig);
    this.socketApp.socketServer.app.bind(PasswordHasherBindings.PASSWORD_HASHER).toClass(BcryptHasher).inScope(BindingScope.SERVER)
    this.socketApp.socketServer.app.bind(UserServiceBindings.USER_SERVICE).toClass(MyUserService).inScope(BindingScope.SERVER)
    this.mainApp.bind('socket').to(this.socketApp).inScope(BindingScope.SERVER);

    this.socketApp.socketServer.controller(PushMessageController);
    const ns = this.socketApp.socketServer.route(SocketIoController);
    // console.log(ns);
    ns.use((socket, next) => {
      // console.log(
      //   'Middleware for namespace %s - socket: %s' +
      //   socket.nsp.name + ' ' +
      //   socket.id,
      // );

      return next();
    });

    // console.log(this.socketApp.socketServer)

    this.socketApp.socketServer.use((socket, next) => {
      console.log('Global middleware - socket:' + socket.id);
      return next();
    });
    this.socketApp.socketServer.start().then(_ => {
      console.log('Socket server listening? :', this.socketApp.socketServer.listening);
      this.setup();

    });

  }



  setup() {
    this.socketApp.on('connect', () => {
      console.log('user is connected');
    })

    this.socketApp.on('disconnect', () => {

    })



  }




}


import {Socket, socketio} from '@loopback/socketio';
import debugFactory from 'debug';
import {TokenServiceConstants} from '../keys';
import {MyJWTService, MyUserService} from '../services/jwt-authentication';


const debug = debugFactory('loopback:socketio:controller');

/**
 * A demo controller for socket.io
 *
 * ```ts
 * @socketio('/')
 * ```
 * This specifies the namespace / for this controller
 * Regex or strings are acceptable values for namespace
 */

// @authenticate("jwt")
@socketio('/')
export class SocketIoController {
  topics = ['1', '2', '3'];
  userService: MyUserService;
  jwtService: MyJWTService;

  // @inject(TokenServiceBindings.TOKEN_SERVICE)
  // jwtService: MyJWTService;

  constructor(
    @socketio.socket() // Equivalent to `@inject('ws.socket')`
    private socket: Socket,
    // @inject(UserServiceBindings.USER_SERVICE) userService: MyUserService
  ) {
    this.userService = new MyUserService();
    this.jwtService = new MyJWTService();
    this.jwtService.jwtSecret = TokenServiceConstants.TOKEN_SECRET_VALUE
    this.jwtService.expiresSecret = TokenServiceConstants.TOKEN_EXPIRES_IN_VALUE
  }

  /**
   * The method is invoked when a client connects to the server
   *
   * @param socket - The socket object for client
   */
  @socketio.connect()
  connect(socket: Socket) {
    console.log('Client connected: %s', this.socket.id);
    // console.log(this.jwtService);

    // console.log(socket)
    this.verifyUser(this.socket.id);


    // socket.join('room 1');
  }

  /**
   * Register a handler for 'subscribe-to-channel' events
   *
   * @param msg - The message sent by client
   */
  @socketio.subscribe('subscribe-to-channel')
  // @socketio.emit('namespace' | 'requestor' | 'broadcast')
  registerChannel(msg: string[]) {
    console.log('Subscribe to channel: %s', msg);
    if (Array.isArray(msg) && msg.length > 0) {
      msg.forEach(item => {
        this.socket.join(item);
      });
    } else {
      throw new Error('Channels data not appropriate');
    }
  }

  /**
   * Register a handler for 'general-message-forward' events
   *
   * @param msg - The message sent by client
   */
  @socketio.subscribe('general-message-forward')
  // @socketio.emit('namespace' | 'requestor' | 'broadcast')
  handleChatMessage(msg: unknown) {
    console.log('General forwarded message: %s', msg);
    this.socket.nsp.emit('general-message-forward', msg);
  }

  /**
   * Register a handler for 'general-message' events
   *
   * @param msg - The message sent by client
   */
  @socketio.subscribe('general-message')
  // @socketio.emit('namespace' | 'requestor' | 'broadcast')
  handleGeneralMessage(msg: string) {
    console.log('General Message : %s', msg);
    const parsedMsg: {
      subject: string;
      body: string;
      receiver: {
        to: {
          id: string;
          name?: string;
        }[];
      };
      type: string;
      sentDate: Date;
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      options?: any;
    } = JSON.parse(msg);

    if (parsedMsg?.receiver?.to?.length > 0) {
      parsedMsg.receiver.to.forEach(item =>
        this.socket.nsp.to(item.id).emit('message', {
          subject: parsedMsg.subject,
          body: parsedMsg.body,
          options: parsedMsg.options,
        }),
      );
    } else {
      throw new Error('Inappropriate message data');
    }
  }

  /**
   * Register a handler for all events
   */
  @socketio.subscribe(/.+/)
  logMessage(...args: unknown[]) {
    console.log('Message: %s', args);
  }

  /**
   * The method is invoked when a client disconnects from the server
   * @param socket
   */
  @socketio.disconnect()
  disconnect() {
    console.log('Client disconnected: %s', this.socket.id);
    this.socket.disconnect(true);
  }



  /****
   * Verify users by authenticating them
   *
   */
  verifyUser(socketId: string) {
    this.socket.on(`verification${socketId}`, (message) => { // connection unique channel for connected user for verification
      if (message?.length === 20) {
        // handling as socket id
      }

      // console.log(message['token'])

      if (message['token']) {
        // handling token request
        const profile = this.jwtService.verifyToken(message['token'] ?? '');
        // find user id
        profile.then(prof => {
          // get user channels
          this.socket.emit(`channels-reload${socketId}`, 'reload')
        });
      }

      // console.log(message);
    });

    this.socket.emit(`verification${socketId}`, socketId);
  }


}

import {BindingKey, inject} from '@loopback/core';
import {SocketIoApplication} from '@loopback/socketio';
export namespace SocketPusherBindings {
  export const SOCKET_PUSHER_SERVICE = BindingKey.create<MySocketPushService>('services.socket.push');
}


export class MySocketPushService {
  /**
   *
   */
  constructor(
    @inject('socket')
    private socket: SocketIoApplication
  ) {

    this.setup();
  }

  setup() {
    this.socket.on('connect', () => {
      console.log('user is connected');
    })

    this.socket.on('disconnect', () => {


    })



  }


}

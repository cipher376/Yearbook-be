
import {BindingKey} from '@loopback/core';
import {SocketIoApplication} from '@loopback/socketio';


export namespace MySocketBindings {
  export const MY_APPLICATION_INSTANCE = BindingKey.create<SocketIoApplication>('my.socket.application')
}

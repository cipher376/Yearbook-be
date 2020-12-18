import {inject} from '@loopback/core';
import {
  Count,
  CountSchema,
  Filter,
  FilterExcludingWhere,
  repository,
  Where
} from '@loopback/repository';
import {
  del, get,
  getModelSchemaRef, param,


  patch, post,




  put,

  requestBody
} from '@loopback/rest';
import {socketio} from '@loopback/socketio';
import {Socket} from 'dgram';
import {PushMessage} from '../models';
import {PushMessageRepository, PushTopicRepository} from '../repositories';

@socketio('/push-messages/')
export class PushMessageController {
  constructor(
    @repository(PushTopicRepository)
    public pushTopicRepository: PushTopicRepository,
    @repository(PushMessageRepository)
    public pushMessageRepository: PushMessageRepository,
    @inject('socket') // Equivalent to `@inject('ws.socket')`
    private socket: Socket,
  ) {

    // console.log(socket);
  }

  @post('/push-messages', {
    responses: {
      '200': {
        description: 'PushMessage model instance',
        content: {'application/json': {schema: getModelSchemaRef(PushMessage)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PushMessage, {
            title: 'NewPushMessage',
            exclude: ['id'],
          }),
        },
      },
    })
    pushMessage: Omit<PushMessage, 'id'>,
  ): Promise<PushMessage> {
    let sent = false;
    if (pushMessage.channel) {
      this.socket.emit(pushMessage.channel, pushMessage)
      sent = true;
    } else if (pushMessage.topicId) {
      // get the channel from database
      const topic = await this.pushTopicRepository.findById(pushMessage.topicId);
      this.socket.emit(topic?.channelId, pushMessage);
      sent = true;
    }

    if (sent) {
      return this.pushMessageRepository.create(pushMessage);
    }
    throw new Error("Channel or topic not found");
  }

  @get('/push-messages/count', {
    responses: {
      '200': {
        description: 'PushMessage model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(PushMessage) where?: Where<PushMessage>,
  ): Promise<Count> {



    return this.pushMessageRepository.count(where);
  }

  @get('/push-messages', {
    responses: {
      '200': {
        description: 'Array of PushMessage model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(PushMessage, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(PushMessage) filter?: Filter<PushMessage>,
  ): Promise<PushMessage[]> {
    return this.pushMessageRepository.find(filter);
  }

  @patch('/push-messages', {
    responses: {
      '200': {
        description: 'PushMessage PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PushMessage, {partial: true}),
        },
      },
    })
    pushMessage: PushMessage,
    @param.where(PushMessage) where?: Where<PushMessage>,
  ): Promise<Count> {
    return this.pushMessageRepository.updateAll(pushMessage, where);
  }

  @get('/push-messages/{id}', {
    responses: {
      '200': {
        description: 'PushMessage model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(PushMessage, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(PushMessage, {exclude: 'where'}) filter?: FilterExcludingWhere<PushMessage>
  ): Promise<PushMessage> {
    return this.pushMessageRepository.findById(id, filter);
  }

  @patch('/push-messages/{id}', {
    responses: {
      '204': {
        description: 'PushMessage PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PushMessage, {partial: true}),
        },
      },
    })
    pushMessage: PushMessage,
  ): Promise<void> {
    await this.pushMessageRepository.updateById(id, pushMessage);
  }

  @put('/push-messages/{id}', {
    responses: {
      '204': {
        description: 'PushMessage PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() pushMessage: PushMessage,
  ): Promise<void> {
    await this.pushMessageRepository.replaceById(id, pushMessage);
  }

  @del('/push-messages/{id}', {
    responses: {
      '204': {
        description: 'PushMessage DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.pushMessageRepository.deleteById(id);
  }

  async push() {

  }

  setUpTopics() {
    // this.topics.forEach(tp => {
    //   this.socket.on(tp, (message) => {
    //     console.log(message)
    //   });
    //   // send to channel
    //   this.sendTopicChannel(tp, {body: 'Just swipe to close', subject: 'Testing'} as PushMessage);
    // })
  }

  sendTopicChannel(topic: string, message: PushMessage) {
    this.socket.emit(topic, message);
  }
}

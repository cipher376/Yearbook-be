import {
  repository,
} from '@loopback/repository';
import {
  param,
  get,
  getModelSchemaRef,
} from '@loopback/rest';
import {
  PushMessage,
  PushTopic,
} from '../models';
import {PushMessageRepository} from '../repositories';

export class PushMessagePushTopicController {
  constructor(
    @repository(PushMessageRepository)
    public pushMessageRepository: PushMessageRepository,
  ) { }

  @get('/push-messages/{id}/push-topic', {
    responses: {
      '200': {
        description: 'PushTopic belonging to PushMessage',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(PushTopic)},
          },
        },
      },
    },
  })
  async getPushTopic(
    @param.path.number('id') id: typeof PushMessage.prototype.id,
  ): Promise<PushTopic> {
    return this.pushMessageRepository.topic(id);
  }
}

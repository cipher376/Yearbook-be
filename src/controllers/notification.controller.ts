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
  getModelSchemaRef, param, post,
  requestBody
} from '@loopback/rest';
import {INotification, Message, NotificationBindings} from 'loopback4-notifications';
import {Notification} from '../models';
import {NotificationRepository} from '../repositories';


export class NotificationController {
  constructor(
    @repository(NotificationRepository)
    public notificationRepository: NotificationRepository,

    @inject(NotificationBindings.NotificationProvider)
    private readonly notifProvider: INotification,
  ) { }

  @post('/notifications', {
    responses: {
      '200': {
        description: 'Notification model instance',
        content: {'application/json': {schema: getModelSchemaRef(Notification)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Notification, {
            title: 'NewNotification',
            exclude: ['id'],
          }),
        },
      },
    })
    notification: Omit<Notification, 'id'>,
  ): Promise<Notification> {
    await this.notifProvider.publish(notification as Message);
    return this.notificationRepository.create(notification);
  }

  @get('/notifications/count', {
    responses: {
      '200': {
        description: 'Notification model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(Notification) where?: Where<Notification>,
  ): Promise<Count> {
    return this.notificationRepository.count(where);
  }

  @get('/notifications', {
    responses: {
      '200': {
        description: 'Array of Notification model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(Notification, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(Notification) filter?: Filter<Notification>,
  ): Promise<Notification[]> {
    return this.notificationRepository.find(filter);
  }


  @get('/notifications/{id}', {
    responses: {
      '200': {
        description: 'Notification model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Notification, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Notification, {exclude: 'where'}) filter?: FilterExcludingWhere<Notification>
  ): Promise<Notification> {
    return this.notificationRepository.findById(id, filter);
  }


  @del('/notifications/{id}', {
    responses: {
      '204': {
        description: 'Notification DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.notificationRepository.deleteById(id);
  }
}

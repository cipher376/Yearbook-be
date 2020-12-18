import {
  repository,
} from '@loopback/repository';
import {
  param,
  get,
  getModelSchemaRef,
} from '@loopback/rest';
import {
  Device,
  User,
} from '../models';
import {DeviceRepository} from '../repositories';

export class DeviceUserController {
  constructor(
    @repository(DeviceRepository)
    public deviceRepository: DeviceRepository,
  ) { }

  @get('/devices/{id}/user', {
    responses: {
      '200': {
        description: 'User belonging to Device',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(User)},
          },
        },
      },
    },
  })
  async getUser(
    @param.path.number('id') id: typeof Device.prototype.id,
  ): Promise<User> {
    return this.deviceRepository.player(id);
  }
}

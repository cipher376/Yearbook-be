import {DefaultCrudRepository, repository, HasManyThroughRepositoryFactory} from '@loopback/repository';
import {PushTopic, PushTopicRelations, Device, DeviceTopicThrough} from '../models';
import {DbDataSource} from '../datasources';
import {inject, Getter} from '@loopback/core';
import {DeviceTopicThroughRepository} from './device-topic-through.repository';
import {DeviceRepository} from './device.repository';

export class PushTopicRepository extends DefaultCrudRepository<
  PushTopic,
  typeof PushTopic.prototype.id,
  PushTopicRelations
> {

  public readonly devices: HasManyThroughRepositoryFactory<Device, typeof Device.prototype.id,
          DeviceTopicThrough,
          typeof PushTopic.prototype.id
        >;

  constructor(
    @inject('datasources.db') dataSource: DbDataSource, @repository.getter('DeviceTopicThroughRepository') protected deviceTopicThroughRepositoryGetter: Getter<DeviceTopicThroughRepository>, @repository.getter('DeviceRepository') protected deviceRepositoryGetter: Getter<DeviceRepository>,
  ) {
    super(PushTopic, dataSource);
    this.devices = this.createHasManyThroughRepositoryFactoryFor('devices', deviceRepositoryGetter, deviceTopicThroughRepositoryGetter,);
    this.registerInclusionResolver('devices', this.devices.inclusionResolver);
  }
}

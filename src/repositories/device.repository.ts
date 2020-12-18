import {DefaultCrudRepository, repository, BelongsToAccessor, HasManyThroughRepositoryFactory} from '@loopback/repository';
import {Device, DeviceRelations, User, PushTopic, DeviceTopicThrough} from '../models';
import {DbDataSource} from '../datasources';
import {inject, Getter} from '@loopback/core';
import {UserRepository} from './user.repository';
import {DeviceTopicThroughRepository} from './device-topic-through.repository';
import {PushTopicRepository} from './push-topic.repository';

export class DeviceRepository extends DefaultCrudRepository<
  Device,
  typeof Device.prototype.id,
  DeviceRelations
> {

  public readonly player: BelongsToAccessor<User, typeof Device.prototype.id>;

  public readonly topics: HasManyThroughRepositoryFactory<PushTopic, typeof PushTopic.prototype.id,
          DeviceTopicThrough,
          typeof Device.prototype.id
        >;

  constructor(
    @inject('datasources.db') dataSource: DbDataSource, @repository.getter('UserRepository') protected userRepositoryGetter: Getter<UserRepository>, @repository.getter('DeviceTopicThroughRepository') protected deviceTopicThroughRepositoryGetter: Getter<DeviceTopicThroughRepository>, @repository.getter('PushTopicRepository') protected pushTopicRepositoryGetter: Getter<PushTopicRepository>,
  ) {
    super(Device, dataSource);
    this.topics = this.createHasManyThroughRepositoryFactoryFor('topics', pushTopicRepositoryGetter, deviceTopicThroughRepositoryGetter,);
    this.registerInclusionResolver('topics', this.topics.inclusionResolver);
    this.player = this.createBelongsToAccessorFor('player', userRepositoryGetter,);
    this.registerInclusionResolver('player', this.player.inclusionResolver);
  }
}

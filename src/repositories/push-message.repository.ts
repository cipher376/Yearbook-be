import {DefaultCrudRepository, repository, BelongsToAccessor} from '@loopback/repository';
import {PushMessage, PushMessageRelations, PushTopic} from '../models';
import {DbDataSource} from '../datasources';
import {inject, Getter} from '@loopback/core';
import {PushTopicRepository} from './push-topic.repository';

export class PushMessageRepository extends DefaultCrudRepository<
  PushMessage,
  typeof PushMessage.prototype.id,
  PushMessageRelations
> {

  public readonly topic: BelongsToAccessor<PushTopic, typeof PushMessage.prototype.id>;

  constructor(
    @inject('datasources.db') dataSource: DbDataSource, @repository.getter('PushTopicRepository') protected pushTopicRepositoryGetter: Getter<PushTopicRepository>,
  ) {
    super(PushMessage, dataSource);
    this.topic = this.createBelongsToAccessorFor('topic', pushTopicRepositoryGetter,);
    this.registerInclusionResolver('topic', this.topic.inclusionResolver);
  }
}

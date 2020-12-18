import {Getter, inject} from '@loopback/core';
import {DefaultCrudRepository, HasManyRepositoryFactory, HasManyThroughRepositoryFactory, HasOneRepositoryFactory, repository, BelongsToAccessor} from '@loopback/repository';
import {DbDataSource} from '../datasources';
import {Address, Alumni, Audio, Comment, Document, FollowThrough, LikeThrough, Photo, Post, School, User, UserConfig, UserRelations, Video, Device} from '../models';
import {AddressRepository} from './address.repository';
import {AlumniRepository} from './alumni.repository';
import {AudioRepository} from './audio.repository';
import {CommentRepository} from './comment.repository';
import {DocumentRepository} from './document.repository';
import {FollowThroughRepository} from './follow-through.repository';
import {LikeThroughRepository} from './like-through.repository';
import {PhotoRepository} from './photo.repository';
import {PostRepository} from './post.repository';
import {SchoolRepository} from './school.repository';
import {UserConfigRepository} from './user-config.repository';
import {VideoRepository} from './video.repository';
import {DeviceRepository} from './device.repository';

export class UserRepository extends DefaultCrudRepository<
  User,
  typeof User.prototype.id,
  UserRelations
  > {


  public readonly post: HasOneRepositoryFactory<Post, typeof User.prototype.id>;

  public readonly userConfig: HasOneRepositoryFactory<UserConfig, typeof User.prototype.id>;

  public readonly address: HasOneRepositoryFactory<Address, typeof User.prototype.id>;

  public readonly photos: HasManyRepositoryFactory<Photo, typeof User.prototype.id>;

  public readonly schools: HasManyThroughRepositoryFactory<School, typeof School.prototype.id,
    Alumni,
    typeof User.prototype.id
  >;

  public readonly videos: HasManyRepositoryFactory<Video, typeof User.prototype.id>;

  public readonly audio: HasManyRepositoryFactory<Audio, typeof User.prototype.id>;

  public readonly documents: HasManyRepositoryFactory<Document, typeof User.prototype.id>;

  public readonly comments: HasManyRepositoryFactory<Comment, typeof User.prototype.id>;

  public readonly likedComments: HasManyThroughRepositoryFactory<Comment, typeof Comment.prototype.id,
    LikeThrough,
    typeof User.prototype.id
  >;

  public readonly followedSchools: HasManyThroughRepositoryFactory<School, typeof School.prototype.id,
    FollowThrough,
    typeof User.prototype.id
  >;

  public readonly alumni: BelongsToAccessor<Alumni, typeof User.prototype.id>;

  public readonly devices: HasManyRepositoryFactory<Device, typeof User.prototype.id>;

  constructor(
    @inject('datasources.db') dataSource: DbDataSource,
    @repository.getter('PostRepository') protected postRepositoryGetter: Getter<PostRepository>,
    @repository.getter('UserConfigRepository') protected userConfigRepositoryGetter: Getter<UserConfigRepository>,
    @repository.getter('PhotoRepository') protected photoRepositoryGetter: Getter<PhotoRepository>, @repository.getter('AddressRepository') protected addressRepositoryGetter: Getter<AddressRepository>, @repository.getter('AlumniRepository') protected alumniRepositoryGetter: Getter<AlumniRepository>,
    @repository.getter('SchoolRepository') protected schoolRepositoryGetter: Getter<SchoolRepository>, @repository.getter('VideoRepository') protected videoRepositoryGetter: Getter<VideoRepository>, @repository.getter('AudioRepository') protected audioRepositoryGetter: Getter<AudioRepository>, @repository.getter('DocumentRepository') protected documentRepositoryGetter: Getter<DocumentRepository>, @repository.getter('CommentRepository') protected commentRepositoryGetter: Getter<CommentRepository>, @repository.getter('LikeThroughRepository') protected likeThroughRepositoryGetter: Getter<LikeThroughRepository>, @repository.getter('FollowThroughRepository') protected followThroughRepositoryGetter: Getter<FollowThroughRepository>, @repository.getter('DeviceRepository') protected deviceRepositoryGetter: Getter<DeviceRepository>,
  ) {
    super(User, dataSource);
    this.devices = this.createHasManyRepositoryFactoryFor('devices', deviceRepositoryGetter,);
    this.registerInclusionResolver('devices', this.devices.inclusionResolver);
    this.alumni = this.createBelongsToAccessorFor('alumni', alumniRepositoryGetter,);
    this.registerInclusionResolver('alumni', this.alumni.inclusionResolver);
    this.followedSchools = this.createHasManyThroughRepositoryFactoryFor('followedSchools', schoolRepositoryGetter, followThroughRepositoryGetter,);
    // this.registerInclusionResolver('followedSchools', this.followedSchools.inclusionResolver);
    this.likedComments = this.createHasManyThroughRepositoryFactoryFor('likedComments', commentRepositoryGetter, likeThroughRepositoryGetter,);
    this.comments = this.createHasManyRepositoryFactoryFor('comments', commentRepositoryGetter,);
    this.registerInclusionResolver('comments', this.comments.inclusionResolver);

    this.documents = this.createHasManyRepositoryFactoryFor('documents', documentRepositoryGetter,);
    this.registerInclusionResolver('documents', this.documents.inclusionResolver);
    this.audio = this.createHasManyRepositoryFactoryFor('audio', audioRepositoryGetter,);
    this.registerInclusionResolver('audio', this.audio.inclusionResolver);
    this.videos = this.createHasManyRepositoryFactoryFor('videos', videoRepositoryGetter,);
    this.registerInclusionResolver('videos', this.videos.inclusionResolver);
    this.schools = this.createHasManyThroughRepositoryFactoryFor('schools', schoolRepositoryGetter, alumniRepositoryGetter,);
    // const schools = this.createHasManyRepositoryFactoryFor('school', schoolRepositoryGetter)
    // this.registerInclusionResolver('schools', schools.inclusionResolver);

    this.photos = this.createHasManyRepositoryFactoryFor('photos', photoRepositoryGetter,);
    this.registerInclusionResolver('photos', this.photos.inclusionResolver);
    this.address = this.createHasOneRepositoryFactoryFor('address', addressRepositoryGetter);
    this.registerInclusionResolver('address', this.address.inclusionResolver);
    this.userConfig = this.createHasOneRepositoryFactoryFor('userConfig', userConfigRepositoryGetter);
    this.registerInclusionResolver('userConfig', this.userConfig.inclusionResolver);
    this.post = this.createHasOneRepositoryFactoryFor('post', postRepositoryGetter);
    this.registerInclusionResolver('post', this.post.inclusionResolver);

    // this.registerInclusionResolver(
    //   'userCredentials',
    //   this.userCredentials.inclusionResolver,
    // );
  }



  // async findCredentials(
  //   userId: typeof User.prototype.id,
  // ): Promise<UserCredentials | undefined> {
  //   try {
  //     return await this.userCredentials(userId).get();
  //   } catch (err) {
  //     if (err.code === 'ENTITY_NOT_FOUND') {
  //       return undefined;
  //     }
  //     throw err;
  //   }
  // }
}

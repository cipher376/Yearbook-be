import {Getter, inject} from '@loopback/core';
import {DefaultCrudRepository, HasManyRepositoryFactory, HasManyThroughRepositoryFactory, HasOneRepositoryFactory, repository} from '@loopback/repository';
import {DbDataSource} from '../datasources';
import {Address, Alumni, Audio, Document, Photo, School, SchoolDetails, SchoolRelations, User, Video, Post} from '../models';
import {AddressRepository} from './address.repository';
import {AlumniRepository} from './alumni.repository';
import {AudioRepository} from './audio.repository';
import {DocumentRepository} from './document.repository';
import {PhotoRepository} from './photo.repository';
import {SchoolDetailsRepository} from './school-details.repository';
import {UserRepository} from './user.repository';
import {VideoRepository} from './video.repository';
import {PostRepository} from './post.repository';

export class SchoolRepository extends DefaultCrudRepository<
  School,
  typeof School.prototype.id,
  SchoolRelations
  > {


  public readonly schoolDetails: HasOneRepositoryFactory<SchoolDetails, typeof School.prototype.id>;

  public readonly address: HasOneRepositoryFactory<Address, typeof School.prototype.id>;


  public readonly videos: HasManyRepositoryFactory<Video, typeof School.prototype.id>;

  public readonly audio: HasManyRepositoryFactory<Audio, typeof School.prototype.id>;

  public readonly documents: HasManyRepositoryFactory<Document, typeof School.prototype.id>;

  public readonly photos: HasManyRepositoryFactory<Photo, typeof School.prototype.id>;

  public readonly users: HasManyThroughRepositoryFactory<User, typeof User.prototype.id,
    Alumni,
    typeof School.prototype.id
  >;

  public readonly posts: HasManyRepositoryFactory<Post, typeof School.prototype.id>;

  constructor(
    @inject('datasources.db') dataSource: DbDataSource,
    @repository.getter('AlumniRepository') protected alumniRepositoryGetter: Getter<AlumniRepository>,
    @repository.getter('SchoolDetailsRepository') protected schoolDetailsRepositoryGetter: Getter<SchoolDetailsRepository>,
    @repository.getter('AddressRepository') protected addressRepositoryGetter: Getter<AddressRepository>,
    @repository.getter('PhotoRepository') protected photoRepositoryGetter: Getter<PhotoRepository>,
    @repository.getter('VideoRepository') protected videoRepositoryGetter: Getter<VideoRepository>,
    @repository.getter('AudioRepository') protected audioRepositoryGetter: Getter<AudioRepository>,
    @repository.getter('DocumentRepository') protected documentRepositoryGetter: Getter<DocumentRepository>,
    @repository.getter('UserRepository') protected userRepositoryGetter: Getter<UserRepository>, @repository.getter('PostRepository') protected postRepositoryGetter: Getter<PostRepository>,
  ) {
    super(School, dataSource);
    this.posts = this.createHasManyRepositoryFactoryFor('posts', postRepositoryGetter,);
    this.registerInclusionResolver('posts', this.posts.inclusionResolver);
    this.users = this.createHasManyThroughRepositoryFactoryFor('users', userRepositoryGetter, alumniRepositoryGetter,);
    // this.registerInclusionResolver('users', this.users.inclusionResolver);



    this.photos = this.createHasManyRepositoryFactoryFor('photos', photoRepositoryGetter,);
    this.registerInclusionResolver('photos', this.photos.inclusionResolver);
    this.documents = this.createHasManyRepositoryFactoryFor('documents', documentRepositoryGetter,);
    this.registerInclusionResolver('documents', this.documents.inclusionResolver);
    this.audio = this.createHasManyRepositoryFactoryFor('audio', audioRepositoryGetter,);
    this.registerInclusionResolver('audio', this.audio.inclusionResolver);
    this.videos = this.createHasManyRepositoryFactoryFor('videos', videoRepositoryGetter,);
    this.registerInclusionResolver('videos', this.videos.inclusionResolver);
    this.address = this.createHasOneRepositoryFactoryFor('address', addressRepositoryGetter);
    this.registerInclusionResolver('address', this.address.inclusionResolver);
    this.schoolDetails = this.createHasOneRepositoryFactoryFor('schoolDetails', schoolDetailsRepositoryGetter);
    this.registerInclusionResolver('schoolDetails', this.schoolDetails.inclusionResolver);

  }
}

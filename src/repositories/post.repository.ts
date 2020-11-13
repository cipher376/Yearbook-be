import {Getter, inject} from '@loopback/core';
import {BelongsToAccessor, DefaultCrudRepository, HasManyRepositoryFactory, HasOneRepositoryFactory, repository, HasManyThroughRepositoryFactory} from '@loopback/repository';
import {DbDataSource} from '../datasources';
import {Audio, Document, Photo, Post, PostConfig, PostRelations, User, Video, PostPhotoThrough, PostVideoThrough, PostAudioThrough, PostDocumentThrough} from '../models';
import {AudioRepository} from './audio.repository';
import {DocumentRepository} from './document.repository';
import {PhotoRepository} from './photo.repository';
import {PostConfigRepository} from './post-config.repository';
import {UserRepository} from './user.repository';
import {VideoRepository} from './video.repository';
import {PostPhotoThroughRepository} from './post-photo-through.repository';
import {PostVideoThroughRepository} from './post-video-through.repository';
import {PostAudioThroughRepository} from './post-audio-through.repository';
import {PostDocumentThroughRepository} from './post-document-through.repository';

export class PostRepository extends DefaultCrudRepository<
  Post,
  typeof Post.prototype.id,
  PostRelations
  > {

  public readonly user: BelongsToAccessor<User, typeof Post.prototype.id>;

  public readonly audio: HasManyRepositoryFactory<Audio, typeof Post.prototype.id>;

  public readonly videos: HasManyRepositoryFactory<Video, typeof Post.prototype.id>;

  public readonly photos: HasManyRepositoryFactory<Photo, typeof Post.prototype.id>;

  public readonly postConfig: HasOneRepositoryFactory<PostConfig, typeof Post.prototype.id>;

  public readonly documents: HasManyRepositoryFactory<Document, typeof Post.prototype.id>;

  public readonly photosThrough: HasManyThroughRepositoryFactory<Photo, typeof Photo.prototype.id,
          PostPhotoThrough,
          typeof Post.prototype.id
        >;

  public readonly videosThrough: HasManyThroughRepositoryFactory<Video, typeof Video.prototype.id,
          PostVideoThrough,
          typeof Post.prototype.id
        >;

  public readonly audioThrough: HasManyThroughRepositoryFactory<Audio, typeof Audio.prototype.id,
          PostAudioThrough,
          typeof Post.prototype.id
        >;

  public readonly documentsThrough: HasManyThroughRepositoryFactory<Document, typeof Document.prototype.id,
          PostDocumentThrough,
          typeof Post.prototype.id
        >;

  constructor(
    @inject('datasources.db') dataSource: DbDataSource,
    @repository.getter('UserRepository') protected userRepositoryGetter: Getter<UserRepository>,
    @repository.getter('AudioRepository') protected audioRepositoryGetter: Getter<AudioRepository>,
    @repository.getter('VideoRepository') protected videoRepositoryGetter: Getter<VideoRepository>,
    @repository.getter('PhotoRepository') protected photoRepositoryGetter: Getter<PhotoRepository>,
    @repository.getter('PostConfigRepository') protected postConfigRepositoryGetter: Getter<PostConfigRepository>,
    @repository.getter('DocumentRepository') protected documentRepositoryGetter: Getter<DocumentRepository>, @repository.getter('PostPhotoThroughRepository') protected postPhotoThroughRepositoryGetter: Getter<PostPhotoThroughRepository>, @repository.getter('PostVideoThroughRepository') protected postVideoThroughRepositoryGetter: Getter<PostVideoThroughRepository>, @repository.getter('PostAudioThroughRepository') protected postAudioThroughRepositoryGetter: Getter<PostAudioThroughRepository>, @repository.getter('PostDocumentThroughRepository') protected postDocumentThroughRepositoryGetter: Getter<PostDocumentThroughRepository>,
  ) {
    super(Post, dataSource);
    this.documentsThrough = this.createHasManyThroughRepositoryFactoryFor('documentsThrough', documentRepositoryGetter, postDocumentThroughRepositoryGetter,);
    this.audioThrough = this.createHasManyThroughRepositoryFactoryFor('audioThrough', audioRepositoryGetter, postAudioThroughRepositoryGetter,);
    this.videosThrough = this.createHasManyThroughRepositoryFactoryFor('videosThrough', videoRepositoryGetter, postVideoThroughRepositoryGetter,);
    this.photosThrough = this.createHasManyThroughRepositoryFactoryFor('photosThrough', photoRepositoryGetter, postPhotoThroughRepositoryGetter,);

    this.documents = this.createHasManyRepositoryFactoryFor('documents', documentRepositoryGetter,);
    this.registerInclusionResolver('documents', this.documents.inclusionResolver);
    this.postConfig = this.createHasOneRepositoryFactoryFor('postConfig', postConfigRepositoryGetter);
    this.registerInclusionResolver('postConfig', this.postConfig.inclusionResolver);
    this.photos = this.createHasManyRepositoryFactoryFor('photos', photoRepositoryGetter,);
    this.registerInclusionResolver('photos', this.photos.inclusionResolver);
    this.videos = this.createHasManyRepositoryFactoryFor('videos', videoRepositoryGetter,);
    this.registerInclusionResolver('videos', this.videos.inclusionResolver);
    this.audio = this.createHasManyRepositoryFactoryFor('audio', audioRepositoryGetter,);
    this.registerInclusionResolver('audio', this.audio.inclusionResolver);
    this.user = this.createBelongsToAccessorFor('user', userRepositoryGetter,);
    this.registerInclusionResolver('user', this.user.inclusionResolver);
  }
}

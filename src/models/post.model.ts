import {belongsTo, Entity, hasMany, hasOne, model, property} from '@loopback/repository';
import {Audio} from './audio.model';
import {Comment} from './comment.model';
import {Document} from './document.model';
import {LikeThrough} from './like-through.model';
import {Photo} from './photo.model';
import {PostAudioThrough} from './post-audio-through.model';
import {PostConfig} from './post-config.model';
import {PostDocumentThrough} from './post-document-through.model';
import {PostPhotoThrough} from './post-photo-through.model';
import {PostVideoThrough} from './post-video-through.model';
import {User} from './user.model';
import {Video} from './video.model';

@model()
export class Post extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'string',
  })
  title?: string;

  @property({
    type: 'string',
    required: true,
  })
  message: string;

  @property({
    type: 'date',
    defaultFn: 'now',
  })
  dateCreated?: Date;

  @property({
    type: 'number',
    default: 0
  })
  shareCount?: number;

  @belongsTo(() => User)
  userId: number;

  @hasMany(() => Audio)
  audios: Audio[];

  @hasMany(() => Video)
  videos: Video[];

  @hasMany(() => Photo)
  photos: Photo[];

  @hasOne(() => PostConfig)
  postConfig: PostConfig;

  @property({
    type: 'number',
  })
  schoolId?: number;

  @hasMany(() => Document)
  documents: Document[];

  @property({
    type: 'number',
  })
  photoId?: number;

  @hasMany(() => Photo, {through: {model: () => PostPhotoThrough}})
  photosThrough: Photo[];

  @hasMany(() => Video, {through: {model: () => PostVideoThrough}})
  videosThrough: Video[];

  @hasMany(() => Audio, {through: {model: () => PostAudioThrough}})
  audioThrough: Audio[];

  @hasMany(() => Document, {through: {model: () => PostDocumentThrough}})
  documentsThrough: Document[];

  @hasMany(() => Comment)
  comments: Comment[];

  @hasMany(() => User, {through: {model: () => LikeThrough, keyFrom: 'receiverId', keyTo: 'initiatorId'}})
  likedUsers: User[];

  constructor(data?: Partial<Post>) {
    super(data);
  }
}

export interface PostRelations {
  // describe navigational properties here


}

export type PostWithRelations = Post & PostRelations;

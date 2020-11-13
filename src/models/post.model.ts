import {belongsTo, Entity, hasMany, hasOne, model, property} from '@loopback/repository';
import {Audio} from './audio.model';
import {Document} from './document.model';
import {Photo} from './photo.model';
import {PostConfig} from './post-config.model';
import {User} from './user.model';
import {Video} from './video.model';
import {PostPhotoThrough} from './post-photo-through.model';
import {PostVideoThrough} from './post-video-through.model';
import {PostAudioThrough} from './post-audio-through.model';
import {PostDocumentThrough} from './post-document-through.model';

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

  @belongsTo(() => User)
  userId: number;

  @hasMany(() => Audio)
  audio: Audio[];

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

  constructor(data?: Partial<Post>) {
    super(data);
  }
}

export interface PostRelations {
  // describe navigational properties here


}

export type PostWithRelations = Post & PostRelations;

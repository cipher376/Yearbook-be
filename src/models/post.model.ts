import {Entity, model, property, belongsTo, hasMany} from '@loopback/repository';
import {User} from './user.model';
import {DocumentPost} from './document-post.model';
import {MediaPost} from './media-post.model';
import {MessagePost} from './message-post.model';
import {PhotoPost} from './photo-post.model';

@model()
export class Post extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @belongsTo(() => User)
  userId: number;

  @hasMany(() => DocumentPost)
  documentPosts: DocumentPost[];

  @hasMany(() => MediaPost)
  mediaPosts: MediaPost[];

  @hasMany(() => MessagePost)
  messagePosts: MessagePost[];

  @hasMany(() => PhotoPost)
  photoPosts: PhotoPost[];

  constructor(data?: Partial<Post>) {
    super(data);
  }
}

export interface PostRelations {
  // describe navigational properties here
}

export type PostWithRelations = Post & PostRelations;

import {Entity, hasMany, model, property} from '@loopback/repository';
import {LikeThrough} from './like-through.model';
import {User} from './user.model';

@model({settings: {strict: true}})
export class Comment extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'string',
    required: true,
  })
  message: string;

  @property({
    type: 'date',
    defaultFn: "now"
  })
  dateCreated: Date;

  @property({
    type: 'number',
  })
  initiatorId?: number;

  @property({
    type: 'number',
  })
  postId?: number;

  @hasMany(() => User, {through: {model: () => LikeThrough, keyFrom: 'receiverId', keyTo: 'initiatorId'}})
  likedUsers: User[];
  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<Comment>) {
    super(data);
  }
}

export interface CommentRelations {
  // describe navigational properties here
}

export type CommentWithRelations = Comment & CommentRelations;

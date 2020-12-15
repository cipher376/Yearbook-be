import {belongsTo, Entity, hasMany, hasOne, model, property} from '@loopback/repository';
import {Address} from './address.model';
import {Alumni} from './alumni.model';
import {Audio} from './audio.model';
import {Comment} from './comment.model';
import {Document} from './document.model';
import {FollowThrough} from './follow-through.model';
import {FriendshipThrough} from './friendship-through.model';
import {LikeThrough} from './like-through.model';
import {Photo} from './photo.model';
import {Post} from './post.model';
import {School} from './school.model';
import {UserConfig} from './user-config.model';
import {Video} from './video.model';

@model()
export class User extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'string',
    required: true,
    jsonSchema: {
      maxLength: 50,
      minLength: 3,
    },
  })
  email: string;

  @property({
    type: 'string',
    jsonSchema: {
      maxLength: 20,
      minLength: 7,
    },
  })
  phone: string;

  @property({
    type: 'string',
    required: true,
    jsonSchema: {
      maxLength: 20,
      minLength: 5,
    },
  })
  password: string | undefined;


  @property({
    type: 'string',
    required: true,
    jsonSchema: {
      maxLength: 50,
      minLength: 1,
    },
  })
  firstName: string;

  @property({
    type: 'string',
    required: true,
    jsonSchema: {
      maxLength: 50,
      minLength: 1,
    },
  })
  lastName: string;
  username: string | undefined;


  @property({
    type: 'string',
    jsonSchema: {
      maxLength: 50,
      minLength: 1,
    },
  })
  otherName?: string;

  @property({
    type: 'string',
    jsonSchema: {
      maxLength: 10,
      minLength: 1,
    },
  })
  gender?: string;


  @property({
    type: 'date',
  })
  dateOfBirth?: string;


  @property({
    type: 'string',
    jsonSchema: {
      maxLength: 50,
      minLength: 1,
    },
  })
  nickName?: string;


  @property({
    type: 'string',
  })
  realm?: string;

  @property({
    type: 'boolean',
  })
  emailVerified?: boolean;

  @property({
    type: 'string',
  })
  verificationToken?: string;

  @property({
    type: 'boolean',
    default: false,
  })
  remember?: boolean;


  @hasOne(() => Post)
  post: Post;

  @hasOne(() => UserConfig)
  userConfig: UserConfig;

  @hasMany(() => Photo)
  photos: Photo[];

  @hasOne(() => Address)
  address: Address;

  @hasMany(() => School, {through: {model: () => Alumni}})
  schools: School[];

  @hasMany(() => Video)
  videos: Video[];

  @hasMany(() => Audio)
  audio: Audio[];

  @hasMany(() => Document)
  documents: Document[];

  @hasMany(() => Comment, {keyTo: 'initiatorId'})
  comments: Comment[];

  @hasMany(() => User, {
    through: {
      model: () => FriendshipThrough,
      keyFrom: 'initiatorId',
      keyTo: 'acceptorId',
    },
  })
  friends: User[];

  @hasMany(() => User, {
    through: {
      model: () => FollowThrough,
      keyFrom: 'leaderId',
      keyTo: 'followerId',
    },
  })
  followers: User[];

  @hasMany(() => User, {
    through: {
      model: () => FollowThrough,
      keyFrom: 'followerId',
      keyTo: 'leaderId',
    },
  })
  leaders: User[];

  @hasMany(() => Comment, {through: {model: () => LikeThrough, keyFrom: 'initiatorId', keyTo: 'receiverId'}})
  likedComments: Comment[];

  @hasMany(() => School, {through: {model: () => FollowThrough, keyFrom: 'followerId', keyTo: 'leaderId'}})
  followedSchools: School[];

  @belongsTo(() => Alumni)
  alumniId: number;
  //Relation property

  constructor(data?: Partial<User>) {
    super(data);
  }
}

export interface UserRelations {
  // describe navigational properties here
}

export type UserWithRelations = User & UserRelations;

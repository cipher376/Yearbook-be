import {Entity, hasMany, hasOne, model, property} from '@loopback/repository';
import {Address} from './address.model';
import {Photo} from './photo.model';
import {Post} from './post.model';
import {UserConfig} from './user-config.model';
import {Alumni} from './alumni.model';

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

  @hasMany(() => Alumni)
  alumni: Alumni[];

  constructor(data?: Partial<User>) {
    super(data);
  }
}

export interface UserRelations {
  // describe navigational properties here
}

export type UserWithRelations = User & UserRelations;

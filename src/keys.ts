import {TokenService, UserService} from '@loopback/authentication';
import {BindingKey} from '@loopback/core';
import {User} from './models/user.model';
import {PasswordHasher} from './services/hash.password';
import {Credentials} from './services/jwt-authentication/user.service';
import {FileUploadHandler} from './types';




export namespace TokenServiceConstants {
    export const TOKEN_SECRET_VALUE = '138asda8213QDF%%&&$$$kHKjhjkop1445';
    export const TOKEN_EXPIRES_IN_VALUE = '7h';
}

export namespace TokenServiceBindings {
    export const TOKEN_SECRET = BindingKey.create<string>('authentication.jwt.secret',);
    export const TOKEN_EXPIRES_IN = BindingKey.create<string>('authentication.jwt.expiresIn',);
    export const TOKEN_SERVICE = BindingKey.create<TokenService>('services.jwt.service',);
}

export namespace PasswordHasherBindings {
    export const PASSWORD_HASHER = BindingKey.create<PasswordHasher>('services.hasher',);
    export const ROUNDS = BindingKey.create<number>('services.hasher.rounds',);
}


export namespace UserServiceBindings {
    export const USER_SERVICE = BindingKey.create<UserService<User, Credentials>>('services.user.service',)
}


/**
 * Binding key for the file upload service
 */
export const FILE_UPLOAD_SERVICE = BindingKey.create<FileUploadHandler>(
    'services.FileUpload',
);

/**
 * Binding key for the storage directory
 */
export const STORAGE_DIRECTORY = BindingKey.create<string>('storage.directory');


/**
 * Used by Authorization system (casbin)
 */
export const RESOURCE_ID = BindingKey.create<string>('resourceId');


/***
 * Used by Emailer, SMS sender, Push notification, Node mailer, Amazon aws simple
 * email service
 */




export enum OPERATION_STATE {
    pending = 0,
    success = 1,
    failed = 2,
}

export enum RESET_REQUEST_TYPE {
    password = 1,
    email = 2,
    phone = 3
}

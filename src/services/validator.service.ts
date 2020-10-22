import {HttpErrors} from '@loopback/rest';
import * as isEmail from 'isemail';
import {Credentials} from './jwt-authentication/user.service';

export function validateCredentials(credentials: Credentials) {
  const MIN_PASSWORD_LEN = 6;

  if (!credentials.email && !credentials.phone) { // if both emaill and phone number is empty
    throw new HttpErrors.UnprocessableEntity('invalid email or Phone number');
  }

  // if phone is empty and email is not valid
  if (!credentials.phone && !isEmail.validate(credentials.email)) {
    throw new HttpErrors.UnprocessableEntity('invalid Email');
  }

  if ((credentials.password as string).length < MIN_PASSWORD_LEN) {
    throw new HttpErrors.UnprocessableEntity('password length should be greater than 8')
  }
  if ((credentials.password as string).length < MIN_PASSWORD_LEN) {
    throw new HttpErrors.UnprocessableEntity('password length should be greater than 8')
  }
}

// export function userExist(credentials:Credentials) {
//   if (!credentials.email && !credentials.phone) {
//     throw new HttpErrors.UnprocessableEntity('invalid email or Phone number');
//   }

// }

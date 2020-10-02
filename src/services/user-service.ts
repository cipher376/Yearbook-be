import {UserService} from '@loopback/authentication';
import {inject} from '@loopback/core';
import {Filter, repository} from '@loopback/repository';
import {HttpErrors} from '@loopback/rest';
import {securityId, UserProfile} from '@loopback/security';
import {PasswordHasherBindings} from '../keys';
import {User} from '../models';
import {Credentials, UserRepository} from '../repositories/user.repository';
import {BcryptHasher} from './hash.password';


export class MyUserService implements UserService<User, Credentials>{
    constructor(
        @repository(UserRepository)
        public userRepository: UserRepository,

        // @inject('service.hasher')
        @inject(PasswordHasherBindings.PASSWORD_HASHER)
        public hasher: BcryptHasher

    ) {}


    async verifyCredentials(credentials: Credentials): Promise<User> {
        // implement this method
        const foundUser = await this.userRepository.findOne({
            where: {
                email: credentials.email
            }
        });
        if (!foundUser) {
            throw new HttpErrors.NotFound('user not found');
        }
        const passwordMatched = await this.hasher.comparePassword(credentials.password as string, foundUser.password as string)
        if (!passwordMatched)
            throw new HttpErrors.Unauthorized('password is not valid');
        return foundUser;
    }
    convertToUserProfile(user: User): UserProfile {
        let userName = '';
        if (user.firstName)
            userName = user.firstName;
        if (user.lastName) {
            userName = user.firstName ? `${user.firstName} ${user.lastName}` : user.lastName;
        }
        return {
            [securityId]: user.id!.toString(),
            name: userName,
            id: user.id,
            email: user.email,
            phone: user.phone
        };
    }

    convertToUserView(user: User): User {
        // remove sensitive data
        user.realm = undefined;
        user.password = undefined;
        user.remember = undefined;
        user.emailVerified = undefined;
        user.verificationToken = undefined;
        if (!user.username) {
            if (user.firstName)
                user.username = user.firstName;
            if (user.lastName) {
                user.username = user.firstName ? `${user.firstName} ${user.lastName}` : user.lastName;
            }
        }
        return user
    }


    convertToUsersView(users: User[]) {
        users.forEach(user => {
            // remove sensitive fields;
            user = this.convertToUserView(user);
        });

        return users;
    }

    async userExist(credentials: Credentials): Promise<boolean> {
        if (!credentials.email && !credentials.phone) {
            throw new HttpErrors.BadRequest('Invalid Username or Phone Number')
        }
        let foundUser = await this.userRepository.findOne({
            where: {
                email: credentials.email
            }
        })

        if (!foundUser && credentials.phone) {
            foundUser = await this.userRepository.findOne({
                where: {
                    phone: credentials.phone
                }
            })
        }

        // console.log(foundUser);
        if (!foundUser?.id) {
            return Promise.resolve(false);
        }
        return Promise.resolve(true);
    }

    async emailExist(email: string): Promise<boolean> {
        const foundUser = await this.userRepository.findOne({
            where: {email}
        })
        if (!foundUser) return Promise.resolve(false);
        return Promise.resolve(true);
    }

    async phoneExist(phone: string): Promise<boolean> {
        const foundUser = await this.userRepository.findOne({
            where: {phone}
        })
        if (!foundUser) return Promise.resolve(false);
        return Promise.resolve(true);
    }

    async updateUser(id: typeof User.prototype.id, user: User): Promise<User> {
        const foundUser = await this.userRepository.findOne({
            where: {id}
        });

        if (!foundUser) {
            throw new HttpErrors.NotFound('user not found.');
        }
        // check if phone number is in used
        if (await this.phoneExist(user.phone)) {
            throw new HttpErrors.NotFound('Phone number is already taken.');
        }

        foundUser.dateOfBirth = user.dateOfBirth || foundUser.dateOfBirth;
        foundUser.firstName = user.firstName || foundUser.firstName;
        foundUser.lastName = user.lastName || foundUser.lastName;
        foundUser.nickName = user.nickName || foundUser.nickName;
        foundUser.otherName = user.otherName || foundUser.otherName;
        foundUser.username = user.username || foundUser.username
        foundUser.username = user.username || foundUser.username
        foundUser.phone = user.phone || foundUser.phone

        await this.userRepository.update(foundUser);
        return this.convertToUserView(foundUser);
    }

    async getUsers(filter?: Filter<User>): Promise<User[]> {
        const foundUsers = await this.userRepository.find(filter) || [];
        // strip sensitive data
        return Promise.resolve(this.convertToUsersView(foundUsers));
    }

}

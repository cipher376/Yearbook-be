import {UserService} from '@loopback/authentication';
import {inject, injectable} from '@loopback/core';
import {Filter, repository} from '@loopback/repository';
import {HttpErrors} from '@loopback/rest';
import {securityId, UserProfile} from '@loopback/security';
import {PasswordHasherBindings} from '../../keys';
import {User} from '../../models';
import {PasswordRepository} from '../../repositories';
import {UserRepository} from '../../repositories/user.repository';
import {BcryptHasher} from '../hash.password';

export type Credentials = {
    email: string;
    phone?: string;
    password: string | undefined;
}


@injectable()
export class MyUserService implements UserService<User, Credentials>{
    @repository(UserRepository)
    public userRepository: UserRepository;

    @repository(PasswordRepository)
    public passwordRepository: PasswordRepository;

    // @inject('service.hasher')
    @inject(PasswordHasherBindings.PASSWORD_HASHER)
    public hasher: BcryptHasher;

    constructor(
    ) { }


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
        // get user password hash
        const password = await this.passwordRepository.findOne({where: {userId: foundUser.id}});
        const passwordMatched = await this.hasher.comparePassword(credentials.password as string, password?.hash as any)
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

    async phoneExist(phone: string, currentUserId: any): Promise<boolean> {
        const foundUser = await this.userRepository.findOne({
            where: {phone}
        })
        if (!foundUser) return Promise.resolve(false);
        if (foundUser.id == currentUserId) return Promise.resolve(false);
        return Promise.resolve(true);
    }

    async updateUser(id: typeof User.prototype.id, user: User, currentUserId: string): Promise<User> {
        const foundUser = await this.userRepository.findOne({
            where: {id}
        });

        if (!foundUser) {
            throw new HttpErrors.NotFound('user not found.');
        }
        // check if phone number is in used
        if (await this.phoneExist(user.phone, user.id) && !(user.id && currentUserId)) {
            throw new HttpErrors.NotFound('Phone number is already taken.');
        }

        foundUser.dateOfBirth = user.dateOfBirth ?? foundUser.dateOfBirth;
        foundUser.firstName = user.firstName ?? foundUser.firstName;
        foundUser.lastName = user.lastName ?? foundUser.lastName;
        foundUser.nickName = user.nickName ?? foundUser.nickName;
        foundUser.otherName = user.otherName ?? foundUser.otherName;
        foundUser.username = user.username ?? foundUser.username
        foundUser.username = user.username ?? foundUser.username
        foundUser.phone = user.phone ?? foundUser.phone
        foundUser.gender = user.gender ?? foundUser.gender

        await this.userRepository.update(foundUser);
        return this.convertToUserView(foundUser);
    }

    async getUsers(filter?: Filter<User>): Promise<User[]> {
        const foundUsers = await this.userRepository.find(filter) ?? [];
        // strip sensitive data
        return Promise.resolve(this.convertToUsersView(foundUsers));
    }

}

import {Getter, inject} from '@loopback/core';
import {DefaultCrudRepository, HasManyRepositoryFactory, HasOneRepositoryFactory, repository} from '@loopback/repository';
import {DbDataSource} from '../datasources';
import {Address, Alumni, Photo, Post, User, UserConfig, UserRelations} from '../models';
import {AddressRepository} from './address.repository';
import {AlumniRepository} from './alumni.repository';
import {PhotoRepository} from './photo.repository';
import {PostRepository} from './post.repository';
import {UserConfigRepository} from './user-config.repository';



export class UserRepository extends DefaultCrudRepository<
  User,
  typeof User.prototype.id,
  UserRelations
  > {


  public readonly post: HasOneRepositoryFactory<Post, typeof User.prototype.id>;

  public readonly userConfig: HasOneRepositoryFactory<UserConfig, typeof User.prototype.id>;

  public readonly address: HasOneRepositoryFactory<Address, typeof User.prototype.id>;

  public readonly photos: HasManyRepositoryFactory<Photo, typeof User.prototype.id>;

  public readonly alumni: HasManyRepositoryFactory<Alumni, typeof User.prototype.id>;

  constructor(
    @inject('datasources.db') dataSource: DbDataSource,
    @repository.getter('AlumniRepository') protected alumniRepositoryGetter: Getter<AlumniRepository>,
    @repository.getter('PostRepository') protected postRepositoryGetter: Getter<PostRepository>,
    @repository.getter('UserConfigRepository') protected userConfigRepositoryGetter: Getter<UserConfigRepository>, @repository.getter('PhotoRepository') protected photoRepositoryGetter: Getter<PhotoRepository>, @repository.getter('AddressRepository') protected addressRepositoryGetter: Getter<AddressRepository>,
  ) {
    super(User, dataSource);
    this.alumni = this.createHasManyRepositoryFactoryFor('alumni', alumniRepositoryGetter,);
    this.registerInclusionResolver('alumni', this.alumni.inclusionResolver);
    this.photos = this.createHasManyRepositoryFactoryFor('photos', photoRepositoryGetter,);
    this.registerInclusionResolver('photos', this.photos.inclusionResolver);
    this.address = this.createHasOneRepositoryFactoryFor('address', addressRepositoryGetter);
    this.registerInclusionResolver('address', this.address.inclusionResolver);
    this.userConfig = this.createHasOneRepositoryFactoryFor('userConfig', userConfigRepositoryGetter);
    this.registerInclusionResolver('userConfig', this.userConfig.inclusionResolver);
    this.post = this.createHasOneRepositoryFactoryFor('post', postRepositoryGetter);
    this.registerInclusionResolver('post', this.post.inclusionResolver);

    // this.registerInclusionResolver(
    //   'userCredentials',
    //   this.userCredentials.inclusionResolver,
    // );
  }



  // async findCredentials(
  //   userId: typeof User.prototype.id,
  // ): Promise<UserCredentials | undefined> {
  //   try {
  //     return await this.userCredentials(userId).get();
  //   } catch (err) {
  //     if (err.code === 'ENTITY_NOT_FOUND') {
  //       return undefined;
  //     }
  //     throw err;
  //   }
  // }
}

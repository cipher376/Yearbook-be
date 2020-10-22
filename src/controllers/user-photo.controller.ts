import {authenticate} from '@loopback/authentication';
import {
  Count,
  CountSchema,
  Filter,
  repository,
  Where
} from '@loopback/repository';
import {
  del,
  get,
  getModelSchemaRef,
  getWhereSchemaFor,
  param,
  patch,
  post,
  requestBody
} from '@loopback/rest';
import {
  Photo, User
} from '../models';
import {UserRepository} from '../repositories';

export class UserPhotoController {
  constructor(
    @repository(UserRepository) protected userRepository: UserRepository,
  ) {}

  @get('/users/{id}/photos', {
    responses: {
      '200': {
        description: 'Array of User has many Photo',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Photo)},
          },
        },
      },
    },
  })
  @authenticate("jwt")
  // @authorize(ACL_USER_PHOTO['list-all'])
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Photo>,
  ): Promise<Photo[]> {
    return this.userRepository.photos(id).find(filter);
  }

  @post('/users/{id}/photos', {
    responses: {
      '200': {
        description: 'User model instance',
        content: {'application/json': {schema: getModelSchemaRef(Photo)}},
      },
    },
  })
  @authenticate("jwt")
  // @authorize(ACL_USER_PHOTO['list-all'])
  async create(
    @param.path.number('id') id: typeof User.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Photo, {
            title: 'NewPhotoInUser',
            exclude: ['id'],
            optional: ['userId']
          }),
        },
      },
    }) photo: Omit<Photo, 'id'>,
  ): Promise<Photo> {
    return this.userRepository.photos(id).create(photo);
  }

  @patch('/users/{id}/photos', {
    responses: {
      '200': {
        description: 'User.Photo PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate("jwt")
  // @authorize(ACL_USER_PHOTO['update-by-id'])
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Photo, {partial: true}),
        },
      },
    })
    photo: Partial<Photo>,
    @param.query.object('where', getWhereSchemaFor(Photo)) where?: Where<Photo>,
  ): Promise<Count> {
    return this.userRepository.photos(id).patch(photo, where);
  }

  @del('/users/{id}/photos', {
    responses: {
      '200': {
        description: 'User.Photo DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate("jwt")
  // @authorize(ACL_USER_PHOTO['delete-by-id'])
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Photo)) where?: Where<Photo>,
  ): Promise<Count> {
    return this.userRepository.photos(id).delete(where);
  }
}

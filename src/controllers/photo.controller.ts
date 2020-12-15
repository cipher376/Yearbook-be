import {authenticate} from '@loopback/authentication';
import {authorize} from '@loopback/authorization';
import {
  Count,
  CountSchema,
  Filter,

  repository,
  Where
} from '@loopback/repository';
import {
  del, get,
  getModelSchemaRef, param,
  patch,
  post,
  requestBody
} from '@loopback/rest';
import {ACL_PHOTO} from '../acls/photo.acl';
import {Photo} from '../models';
import {PhotoRepository} from '../repositories';

export class PhotoController {
  constructor(
    @repository(PhotoRepository)
    public photoRepository: PhotoRepository,
  ) { }

  @post('/photos-createMany', {
    responses: {
      '200': {
        description: 'Photo model instance',
        content: {'application/json': {schema: {type: 'array', items: getModelSchemaRef(Photo)}}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_PHOTO['create-many'])
  async createMany(
    @requestBody({
      content: {
        'application/json': {
          schema: {
            type: 'array',
            items: getModelSchemaRef(Photo, {includeRelations: true})
          }
        },
      },
    })
    photos: Photo[],
  ): Promise<Photo[]> {
    // clean id if exist
    const tem: Photo[] = [];
    photos.forEach((ph, i) => {
      ph.id = undefined as any;
      // filter if userId is not set
      if (ph.userId) {
        tem.push(ph)
      }
    });
    return this.photoRepository.createAll(tem);
  }

  @get('/photos/count', {
    responses: {
      '200': {
        description: 'Photo model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_PHOTO['count'])
  async count(
    @param.where(Photo) where?: Where<Photo>,
  ): Promise<Count> {
    return this.photoRepository.count(where);
  }

  @get('/photos', {
    responses: {
      '200': {
        description: 'Array of Photo model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(Photo, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_PHOTO['list-all'])
  async find(
    @param.filter(Photo) filter?: Filter<Photo>,
  ): Promise<Photo[]> {
    return this.photoRepository.find(filter);
  }

  // @patch('/photos', {
  //   responses: {
  //     '200': {
  //       description: 'Photo PATCH success count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // @authenticate("jwt")
  // @authorize(ACL_PHOTO['update-all'])
  // async updateAll(
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(Photo, {partial: true}),
  //       },
  //     },
  //   })
  //   photo: Photo,
  //   @param.where(Photo) where?: Where<Photo>,
  // ): Promise<Count> {
  //   return this.photoRepository.updateAll(photo, where);
  // }

  // @get('/photos/{id}', {
  //   responses: {
  //     '200': {
  //       description: 'Photo model instance',
  //       content: {
  //         'application/json': {
  //           schema: getModelSchemaRef(Photo, {includeRelations: true}),
  //         },
  //       },
  //     },
  //   },
  // })
  // @authenticate("jwt")
  // @authorize(ACL_PHOTO['find-by-id'])
  // async findById(
  //   @param.path.number('id') id: number,
  //   @param.filter(Photo, {exclude: 'where'}) filter?: FilterExcludingWhere<Photo>
  // ): Promise<Photo> {
  //   return this.photoRepository.findById(id, filter);
  // }

  @patch('/photos/{id}', {
    responses: {
      '204': {
        description: 'Photo PATCH success',
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_PHOTO['update-by-id'])
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Photo, {partial: true}),
        },
      },
    })
    photo: Photo,
  ): Promise<void> {
    await this.photoRepository.updateById(id, photo);
  }

  // @put('/photos/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'Photo PUT success',
  //     },
  //   },
  // })
  // @authenticate("jwt")
  // @authorize(ACL_PHOTO['replace-by-id'])
  // async replaceById(
  //   @param.path.number('id') id: number,
  //   @requestBody() photo: Photo,
  // ): Promise<void> {
  //   await this.photoRepository.replaceById(id, photo);
  // }

  @del('/photos/{id}', {
    responses: {
      '204': {
        description: 'Photo DELETE success',
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_PHOTO['delete-by-id'])
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.photoRepository.deleteById(id);
  }
}

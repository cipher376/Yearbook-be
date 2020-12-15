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
  del,
  get,
  getModelSchemaRef,
  getWhereSchemaFor,
  param,

  post,
  requestBody
} from '@loopback/rest';
import {ACL_SCHOOL_VIDEO} from '../acls/school-video.acl';
import {
  School,
  Video
} from '../models';
import {SchoolRepository} from '../repositories';

export class SchoolVideoController {
  constructor(
    @repository(SchoolRepository) protected schoolRepository: SchoolRepository,
  ) { }

  @get('/schools/{id}/videos', {
    responses: {
      '200': {
        description: 'Array of School has many Video',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Video)},
          },
        },
      },
    },
  })

  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Video>,
  ): Promise<Video[]> {
    return this.schoolRepository.videos(id).find(filter);
  }

  @post('/schools/{id}/videos', {
    responses: {
      '200': {
        description: 'School model instance',
        content: {'application/json': {schema: getModelSchemaRef(Video)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_SCHOOL_VIDEO['create'])
  async create(
    @param.path.number('id') id: typeof School.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Video, {
            title: 'NewVideoInSchool',
            exclude: ['id'],
            optional: ['schoolId']
          }),
        },
      },
    }) video: Omit<Video, 'id'>,
  ): Promise<Video> {
    return this.schoolRepository.videos(id).create(video);
  }

  // @patch('/schools/{id}/videos', {
  //   responses: {
  //     '200': {
  //       description: 'School.Video PATCH success count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // @authenticate("jwt")
  // @authorize(ACL_SCHOOL_VIDEO['update-by-id'])
  // async patch(
  //   @param.path.number('id') id: number,
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(Video, {partial: true}),
  //       },
  //     },
  //   })
  //   video: Partial<Video>,
  //   @param.query.object('where', getWhereSchemaFor(Video)) where?: Where<Video>,
  // ): Promise<Count> {
  //   return this.schoolRepository.videos(id).patch(video, where);
  // }

  @del('/schools/{id}/videos', {
    responses: {
      '200': {
        description: 'School.Video DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_SCHOOL_VIDEO['delete-by-id'])
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Video)) where?: Where<Video>,
  ): Promise<Count> {
    return this.schoolRepository.videos(id).delete(where);
  }
}

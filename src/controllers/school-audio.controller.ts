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

  post,
  requestBody
} from '@loopback/rest';
import {
  Audio, School
} from '../models';
import {SchoolRepository} from '../repositories';

export class SchoolAudioController {
  constructor(
    @repository(SchoolRepository) protected schoolRepository: SchoolRepository,
  ) {}

  @get('/schools/{id}/audio', {
    responses: {
      '200': {
        description: 'Array of School has many Audio',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Audio)},
          },
        },
      },
    },
  })
  @authenticate("jwt")
  // @authorize(ACL_SCHOOL_AUDIO['list-all'])
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Audio>,
  ): Promise<Audio[]> {
    return this.schoolRepository.audio(id).find(filter);
  }

  @post('/schools/{id}/audio', {
    responses: {
      '200': {
        description: 'School model instance',
        content: {'application/json': {schema: getModelSchemaRef(Audio)}},
      },
    },
  })
  @authenticate("jwt")
  // @authorize(ACL_SCHOOL_AUDIO['create'])
  async create(
    @param.path.number('id') id: typeof School.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Audio, {
            title: 'NewAudioInSchool',
            exclude: ['id'],
            optional: ['schoolId']
          }),
        },
      },
    }) audio: Omit<Audio, 'id'>,
  ): Promise<Audio> {
    return this.schoolRepository.audio(id).create(audio);
  }

  // @patch('/schools/{id}/audio', {
  //   responses: {
  //     '200': {
  //       description: 'School.Audio PATCH success count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // @authenticate("jwt")
  // @authorize(ACL_SCHOOL_AUDIO['update-by-id'])
  // async patch(
  //   @param.path.number('id') id: number,
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(Audio, {partial: true}),
  //       },
  //     },
  //   })
  //   audio: Partial<Audio>,
  //   @param.query.object('where', getWhereSchemaFor(Audio)) where?: Where<Audio>,
  // ): Promise<Count> {
  //   return this.schoolRepository.audio(id).patch(audio, where);
  // }

  @del('/schools/{id}/audio', {
    responses: {
      '200': {
        description: 'School.Audio DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate("jwt")
  // @authorize(ACL_SCHOOL_AUDIO['delete-by-id'])
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Audio)) where?: Where<Audio>,
  ): Promise<Count> {
    return this.schoolRepository.audio(id).delete(where);
  }
}

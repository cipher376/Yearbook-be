import {authenticate} from '@loopback/authentication';
import {
  Count,
  CountSchema,
  Filter,
  repository,
  Where
} from '@loopback/repository';
import {
  get,
  getModelSchemaRef,
  getWhereSchemaFor,
  param,
  patch,
  post,
  requestBody
} from '@loopback/rest';
import {
  School,
  SchoolDetails
} from '../models';
import {SchoolRepository} from '../repositories';

export class SchoolSchoolDetailsController {
  constructor(
    @repository(SchoolRepository) protected schoolRepository: SchoolRepository,
  ) {}

  @get('/schools/{id}/school-details', {
    responses: {
      '200': {
        description: 'School has one SchoolDetails',
        content: {
          'application/json': {
            schema: getModelSchemaRef(SchoolDetails),
          },
        },
      },
    },
  })
  @authenticate("jwt")
  // @authorize(ACL_SCHOOL_DETAILS['list-all'])
  async get(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<SchoolDetails>,
  ): Promise<SchoolDetails> {
    return this.schoolRepository.schoolDetails(id).get(filter);
  }

  @post('/schools/{id}/school-details', {
    responses: {
      '200': {
        description: 'School model instance',
        content: {'application/json': {schema: getModelSchemaRef(SchoolDetails)}},
      },
    },
  })
  @authenticate("jwt")
  // @authorize(ACL_SCHOOL_DETAILS['create'])
  async create(
    @param.path.number('id') id: typeof School.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(SchoolDetails, {
            title: 'NewSchoolDetailsInSchool',
            exclude: ['id'],
            optional: ['schoolId']
          }),
        },
      },
    }) schoolDetails: Omit<SchoolDetails, 'id'>,
  ): Promise<SchoolDetails> {
    return this.schoolRepository.schoolDetails(id).create(schoolDetails);
  }

  @patch('/schools/{id}/school-details', {
    responses: {
      '200': {
        description: 'School.SchoolDetails PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate("jwt")
  // @authorize(ACL_SCHOOL_DETAILS['update-by-id'])
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(SchoolDetails, {partial: true}),
        },
      },
    })
    schoolDetails: Partial<SchoolDetails>,
    @param.query.object('where', getWhereSchemaFor(SchoolDetails)) where?: Where<SchoolDetails>,
  ): Promise<Count> {
    return this.schoolRepository.schoolDetails(id).patch(schoolDetails, where);
  }

  // @del('/schools/{id}/school-details', {
  //   responses: {
  //     '200': {
  //       description: 'School.SchoolDetails DELETE success count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // @authenticate("jwt")
  // @authorize(ACL_SCHOOL_PHOTO['delete-by-id'])
  // async delete(
  //   @param.path.number('id') id: number,
  //   @param.query.object('where', getWhereSchemaFor(SchoolDetails)) where?: Where<SchoolDetails>,
  // ): Promise<Count> {
  //   return this.schoolRepository.schoolDetails(id).delete(where);
  // }
}

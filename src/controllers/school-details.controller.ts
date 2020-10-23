import {
  repository
} from '@loopback/repository';
import {
  getModelSchemaRef, post,






  requestBody
} from '@loopback/rest';
import {SchoolDetails} from '../models';
import {SchoolDetailsRepository} from '../repositories';

export class SchoolDetailsController {
  constructor(
    @repository(SchoolDetailsRepository)
    public schoolDetailsRepository: SchoolDetailsRepository,
  ) {}

  @post('/school-details-create-many', {
    responses: {
      '200': {
        description: 'SchoolDetails model instance',
        content: {'application/json': {schema: getModelSchemaRef(SchoolDetails)}},
      },
    },
  })
  async createMany(
    @requestBody({
      content: {
        'application/json': {
          schema: {
            type: 'array',
            "items": getModelSchemaRef(SchoolDetails, {
              includeRelations: false,
              title: 'NewSchoolDetails',
              exclude: ['id'],
            })
          }
        },
      },
    })
    schoolDetails: Omit<SchoolDetails, 'id'>[],
  ): Promise<SchoolDetails[]> {
    return this.schoolDetailsRepository.createAll(schoolDetails);
  }


  //   @post('/school-details', {
  //     responses: {
  //       '200': {
  //         description: 'SchoolDetails model instance',
  //         content: {'application/json': {schema: getModelSchemaRef(SchoolDetails)}},
  //       },
  //     },
  //   })
  //   async create(
  //     @requestBody({
  //       content: {
  //         'application/json': {
  //           schema: getModelSchemaRef(SchoolDetails, {
  //             title: 'NewSchoolDetails',
  //             exclude: ['id'],
  //           }),
  //         },
  //       },
  //     })
  //     schoolDetails: Omit<SchoolDetails, 'id'>,
  //   ): Promise<SchoolDetails> {
  //     return this.schoolDetailsRepository.create(schoolDetails);
  //   }


  //   @get('/school-details/count', {
  //     responses: {
  //       '200': {
  //         description: 'SchoolDetails model count',
  //         content: {'application/json': {schema: CountSchema}},
  //       },
  //     },
  //   })
  //   async count(
  //     @param.where(SchoolDetails) where?: Where<SchoolDetails>,
  //   ): Promise<Count> {
  //     return this.schoolDetailsRepository.count(where);
  //   }

  //   @get('/school-details', {
  //     responses: {
  //       '200': {
  //         description: 'Array of SchoolDetails model instances',
  //         content: {
  //           'application/json': {
  //             schema: {
  //               type: 'array',
  //               items: getModelSchemaRef(SchoolDetails, {includeRelations: true}),
  //             },
  //           },
  //         },
  //       },
  //     },
  //   })
  //   async find(
  //     @param.filter(SchoolDetails) filter?: Filter<SchoolDetails>,
  //   ): Promise<SchoolDetails[]> {
  //     return this.schoolDetailsRepository.find(filter);
  //   }

  //   @patch('/school-details', {
  //     responses: {
  //       '200': {
  //         description: 'SchoolDetails PATCH success count',
  //         content: {'application/json': {schema: CountSchema}},
  //       },
  //     },
  //   })
  //   async updateAll(
  //     @requestBody({
  //       content: {
  //         'application/json': {
  //           schema: getModelSchemaRef(SchoolDetails, {partial: true}),
  //         },
  //       },
  //     })
  //     schoolDetails: SchoolDetails,
  //     @param.where(SchoolDetails) where?: Where<SchoolDetails>,
  //   ): Promise<Count> {
  //     return this.schoolDetailsRepository.updateAll(schoolDetails, where);
  //   }

  //   @get('/school-details/{id}', {
  //     responses: {
  //       '200': {
  //         description: 'SchoolDetails model instance',
  //         content: {
  //           'application/json': {
  //             schema: getModelSchemaRef(SchoolDetails, {includeRelations: true}),
  //           },
  //         },
  //       },
  //     },
  //   })
  //   async findById(
  //     @param.path.number('id') id: number,
  //     @param.filter(SchoolDetails, {exclude: 'where'}) filter?: FilterExcludingWhere<SchoolDetails>
  //   ): Promise<SchoolDetails> {
  //     return this.schoolDetailsRepository.findById(id, filter);
  //   }

  //   @patch('/school-details/{id}', {
  //     responses: {
  //       '204': {
  //         description: 'SchoolDetails PATCH success',
  //       },
  //     },
  //   })
  //   async updateById(
  //     @param.path.number('id') id: number,
  //     @requestBody({
  //       content: {
  //         'application/json': {
  //           schema: getModelSchemaRef(SchoolDetails, {partial: true}),
  //         },
  //       },
  //     })
  //     schoolDetails: SchoolDetails,
  //   ): Promise<void> {
  //     await this.schoolDetailsRepository.updateById(id, schoolDetails);
  //   }

  //   @put('/school-details/{id}', {
  //     responses: {
  //       '204': {
  //         description: 'SchoolDetails PUT success',
  //       },
  //     },
  //   })
  //   async replaceById(
  //     @param.path.number('id') id: number,
  //     @requestBody() schoolDetails: SchoolDetails,
  //   ): Promise<void> {
  //     await this.schoolDetailsRepository.replaceById(id, schoolDetails);
  //   }

  //   @del('/school-details/{id}', {
  //     responses: {
  //       '204': {
  //         description: 'SchoolDetails DELETE success',
  //       },
  //     },
  //   })
  //   async deleteById(@param.path.number('id') id: number): Promise<void> {
  //     await this.schoolDetailsRepository.deleteById(id);
  //   }
}

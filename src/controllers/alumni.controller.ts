import {authenticate} from '@loopback/authentication';
import {authorize} from '@loopback/authorization';
import {
  Count,
  CountSchema,


  Filter,





  FilterExcludingWhere,





  repository,
  Where
} from '@loopback/repository';
import {
  del, get,
  getModelSchemaRef, param,
  patch, post,

  requestBody
} from '@loopback/rest';
import {ACL_ALUMNI} from '../acls/alumni.acl';
import {Alumni, SchoolDetails} from '../models';
import {AlumniRepository, SchoolDetailsRepository, SchoolRepository, UserRepository} from '../repositories';

export class AlumniController {
  constructor(
    @repository(AlumniRepository)
    public alumniRepository: AlumniRepository,
    @repository(SchoolDetailsRepository)
    public schoolDetailsRepository: SchoolDetailsRepository,
    @repository(SchoolRepository)
    public schoolRepository: SchoolRepository,
    @repository(UserRepository)
    public userRepository: UserRepository,
  ) { }

  @post('/alumni', {
    responses: {
      '200': {
        description: 'Alumni model instance',
        content: {'application/json': {schema: getModelSchemaRef(Alumni)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_ALUMNI['create'])
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Alumni, {
            title: 'NewAlumni',
            exclude: ['id'],
          }),
        },
      },
    })
    alumni: Omit<Alumni, 'id'>,
  ): Promise<Alumni> {
    const alumniPromise = await this.alumniRepository.create(alumni);
    if (alumniPromise) {
      const filter = {
        include: [
          {relation: 'schoolDetails'}
        ]
      };
      const school = await this.schoolRepository.findById(alumni.schoolId, filter);
      const details = school.schoolDetails;
      if (details) {
        // update
        details.alumniCount += 1;
        await this.schoolDetailsRepository.update(details);
      } else {
        await this.schoolDetailsRepository.create(new SchoolDetails({schoolId: alumni.schoolId, alumniCount: 1}));
      }
    }
    return alumniPromise;
  }

  @get('/alumni/count', {
    responses: {
      '200': {
        description: 'Alumni model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_ALUMNI['count'])
  async count(
    @param.where(Alumni) where?: Where<Alumni>,
  ): Promise<Count> {
    return this.alumniRepository.count(where);
  }

  @get('/alumni', {
    responses: {
      '200': {
        description: 'Array of Alumni model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(Alumni, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_ALUMNI['list-all'])
  async find(
    @param.filter(Alumni) filter?: Filter<Alumni>,
  ): Promise<Alumni[]> {
    console.log(JSON.stringify(filter));
    const alumni = await this.alumniRepository.find(filter);
    // check if include users
    try {
      if (JSON.stringify(filter?.include)?.search('user') > -1) {
        const userFilter = {
          include: [
            {relation: 'address'},
            {
              relation: 'photos',
              scope: {
                where: {or: [{coverImage: true}, {profile: true}, {flat: true}]}
              }
            }
          ]
        }
        for (const alu of alumni) {
          alu.user = await this.userRepository.findById(alu?.userId, userFilter);
        }
      }
    } catch (e) {
      console.log(e);
    }


    try {
      if (JSON.stringify(filter?.include)?.search('school') > -1) {
        const schoolFilter = {
          include: [
            {relation: 'address'},
            {
              relation: 'photos',
              scope: {
                where: {or: [{coverImage: true}, {profile: true}, {flat: true}]}
              }
            }
          ]
        }
        for (const alu of alumni) {
          alu.school = await this.schoolRepository.findById(alu?.schoolId, schoolFilter);
        }
      }
    } catch (e) {
      console.log(e);
    }

    return alumni;
  }

  // @patch('/alumni', {
  //   responses: {
  //     '200': {
  //       description: 'Alumni PATCH success count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // @authenticate("jwt")
  // @authorize(ACL_ALUMNI['update-all'])
  // async updateAll(
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(Alumni, {partial: true}),
  //       },
  //     },
  //   })
  //   alumni: Alumni,
  //   @param.where(Alumni) where?: Where<Alumni>,
  // ): Promise<Count> {
  //   return this.alumniRepository.updateAll(alumni, where);
  // }


  @get('/alumni/{id}', {
    responses: {
      '200': {
        description: 'Alumni model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Alumni, {includeRelations: true}),
          },
        },
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_ALUMNI['find-by-id'])
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Alumni, {exclude: 'where'}) filter?: FilterExcludingWhere<Alumni>
  ): Promise<Alumni> {
    return this.alumniRepository.findById(id, filter);
  }

  @patch('/alumni/{id}', {
    responses: {
      '204': {
        description: 'Alumni PATCH success',
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_ALUMNI['update-by-id'])
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Alumni, {partial: true}),
        },
      },
    })
    alumni: Alumni,
  ): Promise<void> {
    await this.alumniRepository.updateById(id, alumni);
  }

  // @put('/alumni/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'Alumni PUT success',
  //     },
  //   },
  // })
  // @authenticate("jwt")
  // @authorize(ACL_ALUMNI['replace-by-id'])
  // async replaceById(
  //   @param.path.number('id') id: number,
  //   @requestBody() alumni: Alumni,
  // ): Promise<void> {
  //   await this.alumniRepository.replaceById(id, alumni);
  // }

  @del('/alumni/{id}', {
    responses: {
      '204': {
        description: 'Alumni DELETE success',
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_ALUMNI['delete-by-id'])
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.alumniRepository.deleteById(id);
  }

  @del('/alumni/delete/{userId}/{schoolId}', {
    responses: {
      '204': {
        description: 'Alumni DELETE success',
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_ALUMNI['delete-by-user-school-id'])
  async deleteByUserSchoolId(
    @param.path.number('userId') userId: number,
    @param.path.number('schoolId') schoolId: number
  ): Promise<void> {
    if (userId && schoolId) {
      const filter: Where<Alumni> = {and: [{userId}, {schoolId}]} as any
      console.log(filter);
      await this.alumniRepository.deleteAll(filter);
    }
  }
}

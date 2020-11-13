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
  put,
  requestBody
} from '@loopback/rest';
import {School} from '../models';
import {SchoolRepository} from '../repositories';
import {User} from './../models/user.model';
const applyFilter = require('loopback-filters');

export class SchoolController {
  constructor(
    @repository(SchoolRepository)
    public schoolRepository: SchoolRepository,
  ) {}

  @post('/schools-create-many', {
    responses: {
      '200': {
        description: 'School model instance',
        content: {'application/json': {schema: getModelSchemaRef(School)}},
      },
    },
  })
  // @authenticate("jwt")
  // @authorize(ACL_SCHOOL['create'])
  async createMany(
    @requestBody({
      content: {
        'application/json': {
          schema: {
            type: 'array',
            "items": getModelSchemaRef(School, {includeRelations: false})
          }
        },
      },
    })
    schools: School[],
  ): Promise<School[]> {
    return this.schoolRepository.createAll(schools);
  }

  @post('/schools', {
    responses: {
      '200': {
        description: 'School model instance',
        content: {'application/json': {schema: getModelSchemaRef(School)}},
      },
    },
  })
  // @authenticate("jwt")
  // @authorize(ACL_SCHOOL['create'])
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(School, {
            title: 'NewSchool',
            exclude: ['id'],
          }),
        },
      },
    })
    school: Omit<School, 'id'>,
  ): Promise<School> {
    return this.schoolRepository.create(school);
  }
  @get('/schools/count', {
    responses: {
      '200': {
        description: 'School model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  // @authenticate("jwt")
  // @authorize(ACL_SCHOOL['count'])
  async count(
    @param.where(School) where?: Where<School>,
  ): Promise<Count> {
    return this.schoolRepository.count(where);
  }

  @get('/schools', {
    responses: {
      '200': {
        description: 'Array of School model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(School, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  // @authenticate("jwt")
  // @authorize(ACL_SCHOOL['list-all'])
  async find(
    @param.filter(School) filter?: Filter<School>,
  ): Promise<School[]> {
    return this.schoolRepository.find(filter);
  }

  // searching the database and return school that
  // match the searched word. if type-ahead TP is set, it will return
  // only 5 of the search results else 20

  @get('/schools-search/{searchKey}', {
    responses: {
      '200': {
        description: 'Array of School model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(School, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  // @authenticate("jwt")
  // @authorize(ACL_SCHOOL['list-all'])
  async searchExtensive(
    @param.path.string('searchKey') searchKey: string,
    @param.filter(School) filter?: Filter<School>,
  ): Promise<School[]> {

    let schools: School[] = await this.schoolRepository.find({
      include: [{
        relation: 'address',
      },
      {
        relation: 'schoolDetails'
      }]
    });

    if (searchKey === 'all') {
      return applyFilter(schools, filter);
    }

    const keys: string[] = [];
    let tempKeys: string[] = [];
    let foundSchools: {school: School, score: number}[] = [];


    // build keys or search terms
    tempKeys = searchKey.split(' ');
    tempKeys.push(searchKey);

    // remove duplicates
    keys.push(searchKey);
    tempKeys.forEach(key => {
      key = key.toLowerCase().trim();
      if (!keys.includes(key)) {
        keys.push(key);
      }
    })
    console.log(filter);

    schools.forEach(school => {
      const foundSchool: {school: School, score: number} = {school: school, score: 0};
      for (const key of keys) {
        if (school?.name?.toLowerCase()?.trim()?.search(key) > -1) {
          foundSchool.score += 6;
        }
        if (school?.schoolDetails?.alias?.toLowerCase()?.trim()?.search(key) > -1) {
          foundSchool.score += 5.8;
        }
        if (school?.schoolDetails?.helpLines?.toLowerCase()?.trim()?.search(key) > -1) {
          foundSchool.score += 5.7;
        }
        if (school?.schoolDetails?.email?.toLowerCase()?.trim()?.search(key) > -1) {
          foundSchool.score += 5.6;
        }
        if ((school?.address?.latLng ?? '')?.toLowerCase().trim().search(key) > -1) {
          foundSchool.score += 5.8;
        }
        // if (school?.dateStarted?.trim().search(key) > -1) {
        //   foundSchool.score += 4.1;
        // }
        if (school?.schoolDetails?.studentAlias?.toLowerCase().trim().search(key) > -1) {
          foundSchool.score += 4.2;
        }
        if ((school?.schoolDetails?.anthem ?? "")?.toLowerCase().trim().search(key) > -1) {
          foundSchool.score += 4;
        }
        if (school?.address?.street?.toLowerCase().trim().search(key) > -1) {
          foundSchool.score += 4.3;
        }
        if (school?.address?.suburb?.toLowerCase().trim().search(key) > -1) {
          foundSchool.score += 4.3;
        }
        if (school?.address?.city?.toLowerCase().trim().search(key) > -1) {
          foundSchool.score += 4.3;
        }
        if (school?.address?.state?.toLowerCase().trim().search(key) > -1) {
          foundSchool.score += 3.9;
        }
        if (school?.address?.country?.toLowerCase().trim().search(key) > -1) {
          foundSchool.score += 3.9;
        }
        if (school?.address?.postcode?.toLowerCase().trim().search(key) > -1) {
          foundSchool.score += 3.9;
        }
        if (school?.type?.toLowerCase().trim().search(key) > -1) {
          foundSchool.score += 3.2;
        }
        if (school?.gender?.toLowerCase().trim().search(key) > -1) {
          foundSchool.score += 3.1;
        }
        if ((school?.schoolDetails?.motto ?? "")?.toLowerCase().trim().search(key) > -1) {
          foundSchool.score += 3.0;
        }
        if ((school?.schoolDetails?.vision ?? "")?.toLowerCase().trim().search(key) > -1) {
          foundSchool.score += 3.0;
        }
        if ((school?.schoolDetails?.mission ?? "")?.toLowerCase().trim().search(key) > -1) {
          foundSchool.score += 3.0;
        }
        if ((school?.schoolDetails?.about ?? "")?.toLowerCase().trim().search(key) > -1) {
          foundSchool.score += 2.5;
        }
        if ((school?.schoolDetails?.website ?? "")?.toLowerCase().trim().search(key) > -1) {
          foundSchool.score += 2.0;
        }
        if ((school?.schoolDetails?.departments ?? "").toString().toLowerCase().trim().search(key) > -1) {
          foundSchool.score += 1.5;
        }
        if ((school?.schoolDetails?.accommodationType ?? "").toString().toLowerCase().trim().search(key) > -1) {
          foundSchool.score += 1.5;
        }
        if ((school?.schoolDetails?.totalStudents ?? "").toString().toLowerCase().trim().search(key) > -1) {
          foundSchool.score += 1.2;
        }
        if ((school?.schoolDetails?.alumniCount ?? "").toString().toLowerCase().trim().search(key) > -1) {
          foundSchool.score += 1.0;
        }
      }

      // check if school had a score
      if (foundSchool.score > 0) {
        foundSchools.push(foundSchool);
      }

      foundSchools = foundSchools.sort((sch1, sch2) => {
        if (sch1.score < sch2.score) {
          return 1;
        } else if (sch1.score > sch2.score) {
          return -1;
        } else {
          return 0; // equall
        }
      });


      /**
 * school search sequence
 * propery search-score
 * name      6
 * alias     5.8
 * helpLines 5.7
 * email     5.6
 * latLng    6.0
 *
 * dateStarted 4.1
 * studentAlias 4.2
 * anthem   4
 * address.street 4.3
 * address.suburb 4.3
 * address.city 4.3
 *
 *
 * address.state 3.9
 * address.country 3.9
 * address.postcode 3.5
 *
 * type     3.2
 * gender    3.1
 * motto     3.0
 * mission   3.0
 * vision    3.0
 *
 * about     2.5
 * website   2.0
 *
 *
 *
 * departments        1.5
 * accommodationTypes 1.5
 * totalStudents 1.2
 * alumniCount 1.0
 *
 *
 *  */
    })
    // applying filter to allow paging from front end
    schools = [];
    foundSchools = applyFilter(foundSchools, filter);
    foundSchools.forEach(fs => {
      schools.push(fs.school);
    })
    return schools;

  }


  // searching the database and return school that
  // match the searched word. if type-ahead TP is set, it will return
  // only 5 of the search results else 20

  @get('/schools-quick-search', {
    responses: {
      '200': {
        description: 'Array of School model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(School, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  // @authenticate("jwt")
  // @authorize(ACL_SCHOOL['list-all'])
  async searchQuick(
    @param.path.string('searchKey') searchKey: string,
    @param.path.boolean('typeAhead') typeAhead?: boolean,
    @param.filter(School) filter?: Filter<School>,
  ): Promise<School[]> {

    // turn off filter for type ahead search
    if (typeAhead) {
      filter = undefined;
    }
    let schools: School[] = await this.schoolRepository.find(filter);


    schools = schools.filter(school => {
      if (school.name.indexOf(name) > -1) {
        return true;
      }
      return false;
    })

    if (typeAhead && schools?.length > 10) {
      return schools.slice(0, 10); // return first 10 schools
    }
    return schools;
  }

  @patch('/schools', {
    responses: {
      '200': {
        description: 'School PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  // @authenticate("jwt")
  // @authorize(ACL_SCHOOL['update-all'])
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(School, {partial: true}),
        },
      },
    })
    school: School,
    @param.where(School) where?: Where<School>,
  ): Promise<Count> {
    return this.schoolRepository.updateAll(school, where);
  }

  @get('/schools/{id}', {
    responses: {
      '200': {
        description: 'School model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(School, {includeRelations: true}),
          },
        },
      },
    },
  })
  // @authenticate("jwt")
  // @authorize(ACL_SCHOOL['find-by-id'])
  async findById(
    @param.path.number('id') id: number,
    @param.filter(School, {exclude: 'where'}) filter?: FilterExcludingWhere<School>
  ): Promise<School> {
    return this.schoolRepository.findById(id, filter);
  }

  @patch('/schools/{id}', {
    responses: {
      '204': {
        description: 'School PATCH success',
      },
    },
  })
  // @authenticate("jwt")
  // @authorize(ACL_SCHOOL['update-by-id'])
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(School, {partial: true}),
        },
      },
    })
    school: School,
  ): Promise<void> {
    await this.schoolRepository.updateById(id, school);
  }

  @put('/schools/{id}', {
    responses: {
      '204': {
        description: 'School PUT success',
      },
    },
  })
  // @authenticate("jwt")
  // @authorize(ACL_SCHOOL['replace-by-id'])
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() school: School,
  ): Promise<void> {
    await this.schoolRepository.replaceById(id, school);
  }

  @del('/schools/{id}', {
    responses: {
      '204': {
        description: 'School DELETE success',
      },
    },
  })
  // @authenticate("jwt")
  // @authorize(ACL_SCHOOL['delete-by-id'])
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.schoolRepository.deleteById(id);
  }



  @get('/schools/{id}/alumni', {
    responses: {
      '200': {
        description: 'Array of User has many Alumni',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(User)},
          },
        },
      },
    },
  })
  async findAlumni(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<User>,
  ): Promise<User[]> {
    return this.schoolRepository.users(id).find(filter);
  }


}

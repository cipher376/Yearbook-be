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
  patch,
  post,
  requestBody
} from '@loopback/rest';
import {ACL_SCHOOL_ADDRESS} from '../acls/school-address.acl';
import {Address, School} from '../models';
import {SchoolRepository} from '../repositories';
import {AddressRepository} from './../repositories/address.repository';

export class SchoolAddressController {
  constructor(
    @repository(SchoolRepository) protected schoolRepository: SchoolRepository,
    @repository(AddressRepository) protected addressRepository: AddressRepository,
  ) { }

  @get('/schools/{id}/address', {
    responses: {
      '200': {
        description: 'School has one Address',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Address),
          },
        },
      },
    },
  })
  async get(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Address>,
  ): Promise<Address> {
    return this.schoolRepository.address(id).get(filter);
  }

  @post('/schools/{id}/address', {
    responses: {
      '200': {
        description: 'School model instance',
        content: {'application/json': {schema: getModelSchemaRef(Address)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_SCHOOL_ADDRESS['create'])
  async create(
    @param.path.number('id') id: typeof School.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Address, {
            title: 'NewAddressInSchool',
            exclude: ['id'],
            optional: ['schoolId']
          }),
        },
      },
    }) address: Omit<Address, 'id'>,
  ): Promise<Address> {
    return this.schoolRepository.address(id).create(address);
  }

  @patch('/schools/{id}/address', {
    responses: {
      '200': {
        description: 'School.Address PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_SCHOOL_ADDRESS['update-by-id'])
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Address, {partial: true}),
        },
      },
    })
    address: Partial<Address>,
    @param.query.object('where', getWhereSchemaFor(Address)) where?: Where<Address>,
  ): Promise<Count> {
    return this.schoolRepository.address(id).patch(address, where);
  }

  @del('/schools/{id}/address', {
    responses: {
      '200': {
        description: 'School.Address DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_SCHOOL_ADDRESS['delete-by-id'])
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Address)) where?: Where<Address>,
  ): Promise<Count> {
    return this.schoolRepository.address(id).delete(where);
  }
}

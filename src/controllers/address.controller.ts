import {authenticate} from '@loopback/authentication';
import {authorize} from '@loopback/authorization';
import {
  Count,
  CountSchema,

  FilterExcludingWhere,
  repository,
  Where
} from '@loopback/repository';
import {
  get,
  getModelSchemaRef, param, patch, post, requestBody
} from '@loopback/rest';
import {Address} from '../models';
import {AddressRepository} from '../repositories';
import {ACL_ADDRESS} from './../acls/address.acl';

export class AddressController {
  constructor(
    @repository(AddressRepository)
    public addressRepository: AddressRepository,
  ) { }

  @post('/addresses', {
    responses: {
      '200': {
        description: 'Address model instance',
        content: {'application/json': {schema: getModelSchemaRef(Address)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Address, {
            title: 'NewAddress',
            exclude: ['id'],
          }),
        },
      },
    })
    address: Omit<Address, 'id'>,
  ): Promise<Address> {
    return this.addressRepository.create(address);
  }


  @post('/school-address-create-many', {
    responses: {
      '200': {
        description: 'Address model instance',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              "items": getModelSchemaRef(Address)
            }
          }
        },
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_ADDRESS['create-many'])
  async createMany(
    @requestBody({
      content: {
        'application/json': {
          schema: {
            type: 'array',
            "items": getModelSchemaRef(Address, {
              includeRelations: false,
              title: 'MoreAddress',
              exclude: ['id', 'userId'],
            })
          }
        },
      },
    })
    address: Address[],
  ): Promise<Address[]> {
    console.log(address);
    return this.addressRepository.createAll(address);
  }


  @get('/addresses/count', {
    responses: {
      '200': {
        description: 'Address model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_ADDRESS['count'])
  async count(
    @param.where(Address) where?: Where<Address>,
  ): Promise<Count> {
    return this.addressRepository.count(where);
  }

  // @get('/addresses', {
  //   responses: {
  //     '200': {
  //       description: 'Array of Address model instances',
  //       content: {
  //         'application/json': {
  //           schema: {
  //             type: 'array',
  //             items: getModelSchemaRef(Address, {includeRelations: true}),
  //           },
  //         },
  //       },
  //     },
  //   },
  // })
  // @authenticate("jwt")
  // @authorize(ACL_ADDRESS['list-all'])
  // async find(
  //   @param.filter(Address) filter?: Filter<Address>,
  // ): Promise<Address[]> {
  //   return this.addressRepository.find(filter);
  // }

  // @patch('/addresses', {
  //   responses: {
  //     '200': {
  //       description: 'Address PATCH success count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // @authenticate("jwt")
  // @authorize(ACL_ADDRESS['update-all'])
  // async updateAll(
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(Address, {partial: true}),
  //       },
  //     },
  //   })
  //   address: Address,
  //   @param.where(Address) where?: Where<Address>,
  // ): Promise<Count> {
  //   return this.addressRepository.updateAll(address, where);
  // }

  @get('/addresses/{id}', {
    responses: {
      '200': {
        description: 'Address model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Address, {includeRelations: true}),
          },
        },
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_ADDRESS['find-by-id'])
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Address, {exclude: 'where'}) filter?: FilterExcludingWhere<Address>
  ): Promise<Address> {
    return this.addressRepository.findById(id, filter);
  }

  @patch('/addresses/{id}', {
    responses: {
      '204': {
        description: 'Address PATCH success',
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_ADDRESS['update-by-id'])
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Address, {partial: true}),
        },
      },
    })
    address: Address,
  ): Promise<void> {
    await this.addressRepository.updateById(id, address);
  }

  // @put('/addresses/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'Address PUT success',
  //     },
  //   },
  // })
  // @authenticate("jwt")
  // @authorize(ACL_ADDRESS['replace-by-id'])
  // async replaceById(
  //   @param.path.number('id') id: number,
  //   @requestBody() address: Address,
  // ): Promise<void> {
  //   await this.addressRepository.replaceById(id, address);
  // }

  // @del('/addresses/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'Address DELETE success',
  //     },
  //   },
  // })
  // @authenticate("jwt")
  // @authorize(ACL_ADDRESS['delete-by-id'])
  // async deleteById(@param.path.number('id') id: number): Promise<void> {
  //   await this.addressRepository.deleteById(id);
  // }
}

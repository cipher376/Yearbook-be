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
import {ACL_MEDIA} from '../acls/media.acl';
import {
  Document, User
} from '../models';
import {UserRepository} from '../repositories';

export class UserDocumentController {
  constructor(
    @repository(UserRepository) protected userRepository: UserRepository,
  ) { }

  @get('/users/{id}/documents', {
    responses: {
      '200': {
        description: 'Array of User has many Document',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Document)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Document>,
  ): Promise<Document[]> {
    return this.userRepository.documents(id).find(filter);
  }

  @post('/users/{id}/documents', {
    responses: {
      '200': {
        description: 'User model instance',
        content: {'application/json': {schema: getModelSchemaRef(Document)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_MEDIA['create'])
  async create(
    @param.path.number('id') id: typeof User.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Document, {
            title: 'NewDocumentInUser',
            exclude: ['id'],
            optional: ['userId']
          }),
        },
      },
    }) document: Omit<Document, 'id'>,
  ): Promise<Document> {
    return this.userRepository.documents(id).create(document);
  }

  @patch('/users/{id}/documents', {
    responses: {
      '200': {
        description: 'User.Document PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_MEDIA['update-by-id'])
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Document, {partial: true}),
        },
      },
    })
    document: Partial<Document>,
    @param.query.object('where', getWhereSchemaFor(Document)) where?: Where<Document>,
  ): Promise<Count> {
    return this.userRepository.documents(id).patch(document, where);
  }

  @del('/users/{id}/documents', {
    responses: {
      '200': {
        description: 'User.Document DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_MEDIA['delete-by-id'])
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Document)) where?: Where<Document>,
  ): Promise<Count> {
    return this.userRepository.documents(id).delete(where);
  }
}

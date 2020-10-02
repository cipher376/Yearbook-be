import {
  Count,
  CountSchema,
  Filter,
  repository,
  Where,
} from '@loopback/repository';
import {
  del,
  get,
  getModelSchemaRef,
  getWhereSchemaFor,
  param,
  patch,
  post,
  requestBody,
} from '@loopback/rest';
import {
  School,
  Document,
} from '../models';
import {SchoolRepository} from '../repositories';

export class SchoolDocumentController {
  constructor(
    @repository(SchoolRepository) protected schoolRepository: SchoolRepository,
  ) { }

  @get('/schools/{id}/documents', {
    responses: {
      '200': {
        description: 'Array of School has many Document',
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
    return this.schoolRepository.documents(id).find(filter);
  }

  @post('/schools/{id}/documents', {
    responses: {
      '200': {
        description: 'School model instance',
        content: {'application/json': {schema: getModelSchemaRef(Document)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof School.prototype.id,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Document, {
            title: 'NewDocumentInSchool',
            exclude: ['id'],
            optional: ['schoolId']
          }),
        },
      },
    }) document: Omit<Document, 'id'>,
  ): Promise<Document> {
    return this.schoolRepository.documents(id).create(document);
  }

  @patch('/schools/{id}/documents', {
    responses: {
      '200': {
        description: 'School.Document PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
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
    return this.schoolRepository.documents(id).patch(document, where);
  }

  @del('/schools/{id}/documents', {
    responses: {
      '200': {
        description: 'School.Document DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Document)) where?: Where<Document>,
  ): Promise<Count> {
    return this.schoolRepository.documents(id).delete(where);
  }
}

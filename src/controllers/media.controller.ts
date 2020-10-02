import {inject} from '@loopback/core';
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
  getModelSchemaRef,







  HttpErrors, oas, param,
  patch, post,
  put,


  Request, requestBody, Response,

  RestBindings
} from '@loopback/rest';
import fs from 'fs';
import path from 'path';
import {promisify} from 'util';
import {FILE_UPLOAD_SERVICE, STORAGE_DIRECTORY} from '../keys';
import {Media} from '../models';
import {MediaRepository} from '../repositories';
import {FileUploadHandler} from '../types';


const readdir = promisify(fs.readdir);

export class MediaController {
  constructor(
    @inject(FILE_UPLOAD_SERVICE) private handler: FileUploadHandler,
    @inject(STORAGE_DIRECTORY) private storageDirectory: string,
    @repository(MediaRepository)
    public mediaRepository: MediaRepository,
  ) {}

  @post('/media', {
    responses: {
      '200': {
        description: 'Media model instance',
        content: {'application/json': {schema: getModelSchemaRef(Media)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Media, {
            title: 'NewMedia',
            exclude: ['id'],
          }),
        },
      },
    })
    media: Omit<Media, 'id'>,
  ): Promise<Media> {
    return this.mediaRepository.create(media);
  }

  @get('/media/count', {
    responses: {
      '200': {
        description: 'Media model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(Media) where?: Where<Media>,
  ): Promise<Count> {
    return this.mediaRepository.count(where);
  }

  @get('/media', {
    responses: {
      '200': {
        description: 'Array of Media model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(Media, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(Media) filter?: Filter<Media>,
  ): Promise<Media[]> {
    return this.mediaRepository.find(filter);
  }

  @patch('/media', {
    responses: {
      '200': {
        description: 'Media PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Media, {partial: true}),
        },
      },
    })
    media: Media,
    @param.where(Media) where?: Where<Media>,
  ): Promise<Count> {
    return this.mediaRepository.updateAll(media, where);
  }

  @get('/media/{id}', {
    responses: {
      '200': {
        description: 'Media model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Media, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Media, {exclude: 'where'}) filter?: FilterExcludingWhere<Media>
  ): Promise<Media> {
    return this.mediaRepository.findById(id, filter);
  }

  @patch('/media/{id}', {
    responses: {
      '204': {
        description: 'Media PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Media, {partial: true}),
        },
      },
    })
    media: Media,
  ): Promise<void> {
    await this.mediaRepository.updateById(id, media);
  }

  @put('/media/{id}', {
    responses: {
      '204': {
        description: 'Media PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() media: Media,
  ): Promise<void> {
    await this.mediaRepository.replaceById(id, media);
  }

  @del('/media/{id}', {
    responses: {
      '204': {
        description: 'Media DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.mediaRepository.deleteById(id);
  }


  /*************************************************/
  /**********UPLOAD AND DOWNLOAD *******************/
  /*************************************************/
  @post('/media/upload', {
    responses: {
      200: {
        content: {
          'application/json': {
            schema: {
              type: 'object',
            },
          },
        },
        description: 'Files and fields',
      },
    },
  })
  async fileUpload(
    @requestBody.file()
    request: Request,
    @inject(RestBindings.Http.RESPONSE) response: Response,
  ): Promise<object> {
    return new Promise<object>((resolve, reject) => {
      this.handler(request, response, (err: unknown) => {
        if (err) reject(err);
        else {
          resolve(MediaController.getFilesAndFields(request));
        }
      });
    });
  }

  /**
   * Get files and fields for the request
   * @param request - Http request
   */
  private static getFilesAndFields(request: Request) {
    const uploadedFiles = request.files;
    const mapper = (f: globalThis.Express.Multer.File) => ({
      fieldname: f.fieldname,
      originalname: f.originalname,
      encoding: f.encoding,
      mimetype: f.mimetype,
      size: f.size,
    });
    let files: object[] = [];
    if (Array.isArray(uploadedFiles)) {
      files = uploadedFiles.map(mapper);
    } else {
      for (const filename in uploadedFiles) {
        files.push(...uploadedFiles[filename].map(mapper));
      }
    }
    return {files, fields: request.body};
  }



  /*-----------------------------------------------------------------------*/
  @get('/media/all', {
    responses: {
      200: {
        content: {
          // string[]
          'application/json': {
            schema: {
              type: 'array',
              items: {
                type: 'string',
              },
            },
          },
        },
        description: 'A list of files',
      },
    },
  })
  async listFiles() {
    const files = await readdir(this.storageDirectory);
    return files;
  }

  @get('/media/download/{filename}')
  @oas.response.file()
  downloadFile(
    @param.path.string('filename') fileName: string,
    @inject(RestBindings.Http.RESPONSE) response: Response,
  ) {
    console.log(fileName)
    const file = this.validateFileName(fileName);
    response.download(file, fileName);
    return response;
  }

  /**
   * Validate file names to prevent them goes beyond the designated directory
   * @param fileName - File name
   */
  private validateFileName(fileName: string) {
    const resolved = path.resolve(this.storageDirectory, fileName);
    if (resolved.startsWith(this.storageDirectory)) return resolved;
    // The resolved file is outside sandbox
    throw new HttpErrors.BadRequest(`Invalid file name: ${fileName}`);
  }
}
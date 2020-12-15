import {authenticate} from '@loopback/authentication';
import {authorize} from '@loopback/authorization';
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



  Request, requestBody, Response,

  RestBindings
} from '@loopback/rest';
import fs from 'fs';
import path from 'path';
import {promisify} from 'util';
import {ACL_MEDIA} from '../acls/media.acl';
import {FILE_UPLOAD_SERVICE, STORAGE_DIRECTORY} from '../keys';
import {Media} from '../models';
import {MediaRepository} from '../repositories';
import {createImageThumbnail, createVideoPoster, createVideoThumbnail, resizeImage} from '../services/file-crop-resize';
import {FileUploadHandler} from '../types';


const readdir = promisify(fs.readdir);

export class MediaController {
  constructor(
    @inject(FILE_UPLOAD_SERVICE) private handler: FileUploadHandler,
    @inject(STORAGE_DIRECTORY) private storageDirectory: string,
    @repository(MediaRepository)
    public mediaRepository: MediaRepository,
  ) { }

  @post('/media', {
    responses: {
      '200': {
        description: 'Media model instance',
        content: {'application/json': {schema: getModelSchemaRef(Media)}},
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_MEDIA['create'])
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
  // @authenticate("jwt")
  // @authorize(ACL_MEDIA['count'])
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
  @authenticate("jwt")
  @authorize(ACL_MEDIA['list-all'])
  async find(
    @param.filter(Media) filter?: Filter<Media>,
  ): Promise<Media[]> {
    return this.mediaRepository.find(filter);
  }

  // @patch('/media', {
  //   responses: {
  //     '200': {
  //       description: 'Media PATCH success count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async updateAll(
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(Media, {partial: true}),
  //       },
  //     },
  //   })
  //   media: Media,
  //   @param.where(Media) where?: Where<Media>,
  // ): Promise<Count> {
  //   return this.mediaRepository.updateAll(media, where);
  // }

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
  // @authenticate("jwt")
  // @authorize(ACL_MEDIA['find-by-id'])
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
  @authenticate("jwt")
  @authorize(ACL_MEDIA['update-by-id'])
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

  // @put('/media/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'Media PUT success',
  //     },
  //   },
  // })
  // @authenticate("jwt")
  // @authorize(ACL_MEDIA['replace-by-id'])
  // async replaceById(
  //   @param.path.number('id') id: number,
  //   @requestBody() media: Media,
  // ): Promise<void> {
  //   await this.mediaRepository.replaceById(id, media);
  // }

  @del('/media/{id}', {
    responses: {
      '204': {
        description: 'Media DELETE success',
      },
    },
  })
  @authenticate("jwt")
  @authorize(ACL_MEDIA['delete-by-id'])
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.mediaRepository.deleteById(id);
  }


  /*************************************************/
  /**********UPLOAD AND DOWNLOAD *******************/
  /*************************************************/
  @post('/media/upload/{createThumb}', {
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
  @authenticate("jwt")
  @authorize(ACL_MEDIA['upload'])
  async fileUpload(
    @param.path.boolean('createThumb') createThumb: boolean,
    @requestBody.file()
    request: Request,
    @inject(RestBindings.Http.RESPONSE) response: Response,
  ): Promise<object> {
    console.log(createThumb);
    return new Promise<object>((resolve, reject) => {
      this.handler(request, response, (err: unknown) => {
        if (err) reject(err);
        else {
          resolve(MediaController.getFilesAndFields(request, createThumb));
        }
      });
    });
  }

  /**
   * Get files and fields for the request
   * @param request - Http request
   */
  private static getFilesAndFields(request: Request, createThumb = false) {
    const uploadedFiles = request.files;
    const mapper = (f: globalThis.Express.Multer.File) => ({
      fieldname: f.fieldname,
      originalname: f.originalname,
      encoding: f.encoding,
      mimetype: f.mimetype,
      size: f.size,
    });
    // console.log(request.files);

    if (Array.isArray(uploadedFiles)) {
      uploadedFiles.forEach(file => {
        console.log(file.mimetype)
        // if file is video
        if (this.isVideo(file.filename)) {
          const fileName = file.filename.substr(0, file.filename.lastIndexOf('.')) + '.jpg';
          console.log(fileName)
          console.log(file.path);
          createVideoThumbnail(file.path, file.destination + "\\thumb_" + fileName).then(_ => {
            // console.log('Video thumb created');
            createVideoPoster(file.path, file.destination + "\\poster_" + fileName).then(_ => {
              // console.log('Poster created');
            }, error => {
              console.log(error);
            })
          }, error => {
            console.log(error);
          })

        } else {
          // Resize image file
          resizeImage(file.path, 1000).then(_ => {
            console.log('resize complete')
            if (createThumb) {
              createImageThumbnail(file.path, file?.destination + "\\thumb_" + file.filename).then(_ => {
                // console.log('Thumbnail created');
              }, error => {
                console.log(error);
              })
              // this.createThumbnail().then(_ => {
              //   console.log('Thumbnail created');
              // }, error => {
              //   console.log(error);
              // })
            }
          }, error => {
            console.log(error);
          })
        }

      })

    }

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

  // private static async createThumbnail(src: string, dst: string) {
  //   return applySmartCrop(src, dst, 128, 128);
  // }



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
  @authenticate("jwt")
  @authorize(ACL_MEDIA['list-all-media'])
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

  static isVideo(uri: string) {
    if (
      ((uri?.toLocaleLowerCase()?.split('/')?.pop()) ?? '').search('.avi') > -1 ||
      ((uri?.toLocaleLowerCase()?.split('/')?.pop()) ?? '').search('.mov') > -1 ||
      ((uri?.toLocaleLowerCase()?.split('/')?.pop()) ?? '').search('.mp4') > -1 ||
      ((uri?.toLocaleLowerCase()?.split('/')?.pop()) ?? '').search('.3gp') > -1 ||
      ((uri?.toLocaleLowerCase()?.split('/')?.pop()) ?? '').search('.webm') > -1 ||
      ((uri?.toLocaleLowerCase()?.split('/')?.pop()) ?? '').search('.ogg') > -1 ||
      ((uri?.toLocaleLowerCase()?.split('/')?.pop()) ?? '').search('.mkv') > -1) {
      return true;
    }
  }
}

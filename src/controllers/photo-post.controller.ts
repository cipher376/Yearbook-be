// import {
//   Count,
//   CountSchema,
//   Filter,
//   repository,
//   Where,
// } from '@loopback/repository';
// import {
//   del,
//   get,
//   getModelSchemaRef,
//   getWhereSchemaFor,
//   param,
//   patch,
//   post,
//   requestBody,
// } from '@loopback/rest';
// import {
//   Photo,
//   Post,
// } from '../models';
// import {PhotoRepository} from '../repositories';

// export class PhotoPostController {
//   constructor(
//     @repository(PhotoRepository) protected photoRepository: PhotoRepository,
//   ) { }

//   @get('/photos/{id}/posts', {
//     responses: {
//       '200': {
//         description: 'Array of Photo has many Post',
//         content: {
//           'application/json': {
//             schema: {type: 'array', items: getModelSchemaRef(Post)},
//           },
//         },
//       },
//     },
//   })
//   async find(
//     @param.path.number('id') id: number,
//     @param.query.object('filter') filter?: Filter<Post>,
//   ): Promise<Post[]> {
//     return this.photoRepository.posts(id).find(filter);
//   }

//   @post('/photos/{id}/posts', {
//     responses: {
//       '200': {
//         description: 'Photo model instance',
//         content: {'application/json': {schema: getModelSchemaRef(Post)}},
//       },
//     },
//   })
//   async create(
//     @param.path.number('id') id: typeof Photo.prototype.id,
//     @requestBody({
//       content: {
//         'application/json': {
//           schema: getModelSchemaRef(Post, {
//             title: 'NewPostInPhoto',
//             exclude: ['id'],
//             optional: ['photoId']
//           }),
//         },
//       },
//     }) post: Omit<Post, 'id'>,
//   ): Promise<Post> {
//     return this.photoRepository.posts(id).create(post);
//   }

//   @patch('/photos/{id}/posts', {
//     responses: {
//       '200': {
//         description: 'Photo.Post PATCH success count',
//         content: {'application/json': {schema: CountSchema}},
//       },
//     },
//   })
//   async patch(
//     @param.path.number('id') id: number,
//     @requestBody({
//       content: {
//         'application/json': {
//           schema: getModelSchemaRef(Post, {partial: true}),
//         },
//       },
//     })
//     post: Partial<Post>,
//     @param.query.object('where', getWhereSchemaFor(Post)) where?: Where<Post>,
//   ): Promise<Count> {
//     return this.photoRepository.posts(id).patch(post, where);
//   }

//   @del('/photos/{id}/posts', {
//     responses: {
//       '200': {
//         description: 'Photo.Post DELETE success count',
//         content: {'application/json': {schema: CountSchema}},
//       },
//     },
//   })
//   async delete(
//     @param.path.number('id') id: number,
//     @param.query.object('where', getWhereSchemaFor(Post)) where?: Where<Post>,
//   ): Promise<Count> {
//     return this.photoRepository.posts(id).delete(where);
//   }
// }

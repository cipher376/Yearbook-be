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
//   User,
//   Alumni,
// } from '../models';
// import {UserRepository} from '../repositories';

// export class UserAlumniController {
//   constructor(
//     @repository(UserRepository) protected userRepository: UserRepository,
//   ) { }

//   @get('/users/{id}/alumni', {
//     responses: {
//       '200': {
//         description: 'Array of User has many Alumni',
//         content: {
//           'application/json': {
//             schema: {type: 'array', items: getModelSchemaRef(Alumni)},
//           },
//         },
//       },
//     },
//   })
//   async find(
//     @param.path.number('id') id: number,
//     @param.query.object('filter') filter?: Filter<Alumni>,
//   ): Promise<Alumni[]> {
//     return this.userRepository.alumni(id).find(filter);
//   }

//   @post('/users/{id}/alumni', {
//     responses: {
//       '200': {
//         description: 'User model instance',
//         content: {'application/json': {schema: getModelSchemaRef(Alumni)}},
//       },
//     },
//   })
//   async create(
//     @param.path.number('id') id: typeof User.prototype.id,
//     @requestBody({
//       content: {
//         'application/json': {
//           schema: getModelSchemaRef(Alumni, {
//             title: 'NewAlumniInUser',
//             exclude: ['id'],
//             optional: ['userId']
//           }),
//         },
//       },
//     }) alumni: Omit<Alumni, 'id'>,
//   ): Promise<Alumni> {
//     return this.userRepository.alumni(id).create(alumni);
//   }

//   @patch('/users/{id}/alumni', {
//     responses: {
//       '200': {
//         description: 'User.Alumni PATCH success count',
//         content: {'application/json': {schema: CountSchema}},
//       },
//     },
//   })
//   async patch(
//     @param.path.number('id') id: number,
//     @requestBody({
//       content: {
//         'application/json': {
//           schema: getModelSchemaRef(Alumni, {partial: true}),
//         },
//       },
//     })
//     alumni: Partial<Alumni>,
//     @param.query.object('where', getWhereSchemaFor(Alumni)) where?: Where<Alumni>,
//   ): Promise<Count> {
//     return this.userRepository.alumni(id).patch(alumni, where);
//   }

//   @del('/users/{id}/alumni', {
//     responses: {
//       '200': {
//         description: 'User.Alumni DELETE success count',
//         content: {'application/json': {schema: CountSchema}},
//       },
//     },
//   })
//   async delete(
//     @param.path.number('id') id: number,
//     @param.query.object('where', getWhereSchemaFor(Alumni)) where?: Where<Alumni>,
//   ): Promise<Count> {
//     return this.userRepository.alumni(id).delete(where);
//   }
// }

// import {authenticate} from '@loopback/authentication';
// import {
//   repository
// } from '@loopback/repository';
// import {
//   get,
//   getModelSchemaRef, param
// } from '@loopback/rest';
// import {
//   Alumni,
//   User
// } from '../models';
// import {AlumniRepository} from '../repositories';

// export class AlumniUserController {
//   constructor(
//     @repository(AlumniRepository)
//     public alumniRepository: AlumniRepository,
//   ) {}

//   @get('/alumni/{id}/user', {
//     responses: {
//       '200': {
//         description: 'User belonging to Alumni',
//         content: {
//           'application/json': {
//             schema: {type: 'array', items: getModelSchemaRef(User)},
//           },
//         },
//       },
//     },
//   })
//   @authenticate("jwt")
//   // @authorize(ACL_ALUMNI_USER['find-by-id'])
//   async getUser(
//     @param.path.number('id') id: typeof Alumni.prototype.id,
//   ): Promise<User> {
//     return this.alumniRepository.user(id);
//   }
// }

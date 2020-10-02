// import {
//   Count,
//   CountSchema,
//   Filter,
//   FilterExcludingWhere,
//   repository,
//   Where,
// } from '@loopback/repository';
// import {
//   post,
//   param,
//   get,
//   getModelSchemaRef,
//   patch,
//   put,
//   del,
//   requestBody,
// } from '@loopback/rest';
// import {UserConfig} from '../models';
// import {UserConfigRepository} from '../repositories';

// export class UserConfigController {
//   constructor(
//     @repository(UserConfigRepository)
//     public userConfigRepository : UserConfigRepository,
//   ) {}

//   @post('/user-configs', {
//     responses: {
//       '200': {
//         description: 'UserConfig model instance',
//         content: {'application/json': {schema: getModelSchemaRef(UserConfig)}},
//       },
//     },
//   })
//   async create(
//     @requestBody({
//       content: {
//         'application/json': {
//           schema: getModelSchemaRef(UserConfig, {
//             title: 'NewUserConfig',
//             exclude: ['id'],
//           }),
//         },
//       },
//     })
//     userConfig: Omit<UserConfig, 'id'>,
//   ): Promise<UserConfig> {
//     return this.userConfigRepository.create(userConfig);
//   }

//   @get('/user-configs/count', {
//     responses: {
//       '200': {
//         description: 'UserConfig model count',
//         content: {'application/json': {schema: CountSchema}},
//       },
//     },
//   })
//   async count(
//     @param.where(UserConfig) where?: Where<UserConfig>,
//   ): Promise<Count> {
//     return this.userConfigRepository.count(where);
//   }

//   @get('/user-configs', {
//     responses: {
//       '200': {
//         description: 'Array of UserConfig model instances',
//         content: {
//           'application/json': {
//             schema: {
//               type: 'array',
//               items: getModelSchemaRef(UserConfig, {includeRelations: true}),
//             },
//           },
//         },
//       },
//     },
//   })
//   async find(
//     @param.filter(UserConfig) filter?: Filter<UserConfig>,
//   ): Promise<UserConfig[]> {
//     return this.userConfigRepository.find(filter);
//   }

//   @patch('/user-configs', {
//     responses: {
//       '200': {
//         description: 'UserConfig PATCH success count',
//         content: {'application/json': {schema: CountSchema}},
//       },
//     },
//   })
//   async updateAll(
//     @requestBody({
//       content: {
//         'application/json': {
//           schema: getModelSchemaRef(UserConfig, {partial: true}),
//         },
//       },
//     })
//     userConfig: UserConfig,
//     @param.where(UserConfig) where?: Where<UserConfig>,
//   ): Promise<Count> {
//     return this.userConfigRepository.updateAll(userConfig, where);
//   }

//   @get('/user-configs/{id}', {
//     responses: {
//       '200': {
//         description: 'UserConfig model instance',
//         content: {
//           'application/json': {
//             schema: getModelSchemaRef(UserConfig, {includeRelations: true}),
//           },
//         },
//       },
//     },
//   })
//   async findById(
//     @param.path.number('id') id: number,
//     @param.filter(UserConfig, {exclude: 'where'}) filter?: FilterExcludingWhere<UserConfig>
//   ): Promise<UserConfig> {
//     return this.userConfigRepository.findById(id, filter);
//   }

//   @patch('/user-configs/{id}', {
//     responses: {
//       '204': {
//         description: 'UserConfig PATCH success',
//       },
//     },
//   })
//   async updateById(
//     @param.path.number('id') id: number,
//     @requestBody({
//       content: {
//         'application/json': {
//           schema: getModelSchemaRef(UserConfig, {partial: true}),
//         },
//       },
//     })
//     userConfig: UserConfig,
//   ): Promise<void> {
//     await this.userConfigRepository.updateById(id, userConfig);
//   }

//   @put('/user-configs/{id}', {
//     responses: {
//       '204': {
//         description: 'UserConfig PUT success',
//       },
//     },
//   })
//   async replaceById(
//     @param.path.number('id') id: number,
//     @requestBody() userConfig: UserConfig,
//   ): Promise<void> {
//     await this.userConfigRepository.replaceById(id, userConfig);
//   }

//   @del('/user-configs/{id}', {
//     responses: {
//       '204': {
//         description: 'UserConfig DELETE success',
//       },
//     },
//   })
//   async deleteById(@param.path.number('id') id: number): Promise<void> {
//     await this.userConfigRepository.deleteById(id);
//   }
// }

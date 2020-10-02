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
// import {PostConfig} from '../models';
// import {PostConfigRepository} from '../repositories';

// export class PostConfigController {
//   constructor(
//     @repository(PostConfigRepository)
//     public postConfigRepository : PostConfigRepository,
//   ) {}

//   @post('/post-configs', {
//     responses: {
//       '200': {
//         description: 'PostConfig model instance',
//         content: {'application/json': {schema: getModelSchemaRef(PostConfig)}},
//       },
//     },
//   })
//   async create(
//     @requestBody({
//       content: {
//         'application/json': {
//           schema: getModelSchemaRef(PostConfig, {
//             title: 'NewPostConfig',
//             exclude: ['id'],
//           }),
//         },
//       },
//     })
//     postConfig: Omit<PostConfig, 'id'>,
//   ): Promise<PostConfig> {
//     return this.postConfigRepository.create(postConfig);
//   }

//   @get('/post-configs/count', {
//     responses: {
//       '200': {
//         description: 'PostConfig model count',
//         content: {'application/json': {schema: CountSchema}},
//       },
//     },
//   })
//   async count(
//     @param.where(PostConfig) where?: Where<PostConfig>,
//   ): Promise<Count> {
//     return this.postConfigRepository.count(where);
//   }

//   @get('/post-configs', {
//     responses: {
//       '200': {
//         description: 'Array of PostConfig model instances',
//         content: {
//           'application/json': {
//             schema: {
//               type: 'array',
//               items: getModelSchemaRef(PostConfig, {includeRelations: true}),
//             },
//           },
//         },
//       },
//     },
//   })
//   async find(
//     @param.filter(PostConfig) filter?: Filter<PostConfig>,
//   ): Promise<PostConfig[]> {
//     return this.postConfigRepository.find(filter);
//   }

//   @patch('/post-configs', {
//     responses: {
//       '200': {
//         description: 'PostConfig PATCH success count',
//         content: {'application/json': {schema: CountSchema}},
//       },
//     },
//   })
//   async updateAll(
//     @requestBody({
//       content: {
//         'application/json': {
//           schema: getModelSchemaRef(PostConfig, {partial: true}),
//         },
//       },
//     })
//     postConfig: PostConfig,
//     @param.where(PostConfig) where?: Where<PostConfig>,
//   ): Promise<Count> {
//     return this.postConfigRepository.updateAll(postConfig, where);
//   }

//   @get('/post-configs/{id}', {
//     responses: {
//       '200': {
//         description: 'PostConfig model instance',
//         content: {
//           'application/json': {
//             schema: getModelSchemaRef(PostConfig, {includeRelations: true}),
//           },
//         },
//       },
//     },
//   })
//   async findById(
//     @param.path.number('id') id: number,
//     @param.filter(PostConfig, {exclude: 'where'}) filter?: FilterExcludingWhere<PostConfig>
//   ): Promise<PostConfig> {
//     return this.postConfigRepository.findById(id, filter);
//   }

//   @patch('/post-configs/{id}', {
//     responses: {
//       '204': {
//         description: 'PostConfig PATCH success',
//       },
//     },
//   })
//   async updateById(
//     @param.path.number('id') id: number,
//     @requestBody({
//       content: {
//         'application/json': {
//           schema: getModelSchemaRef(PostConfig, {partial: true}),
//         },
//       },
//     })
//     postConfig: PostConfig,
//   ): Promise<void> {
//     await this.postConfigRepository.updateById(id, postConfig);
//   }

//   @put('/post-configs/{id}', {
//     responses: {
//       '204': {
//         description: 'PostConfig PUT success',
//       },
//     },
//   })
//   async replaceById(
//     @param.path.number('id') id: number,
//     @requestBody() postConfig: PostConfig,
//   ): Promise<void> {
//     await this.postConfigRepository.replaceById(id, postConfig);
//   }

//   @del('/post-configs/{id}', {
//     responses: {
//       '204': {
//         description: 'PostConfig DELETE success',
//       },
//     },
//   })
//   async deleteById(@param.path.number('id') id: number): Promise<void> {
//     await this.postConfigRepository.deleteById(id);
//   }
// }

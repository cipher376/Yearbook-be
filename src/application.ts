import {AuthenticationComponent, registerAuthenticationStrategy} from '@loopback/authentication';
import {AuthorizationComponent} from '@loopback/authorization';
import {BootMixin} from '@loopback/boot';
import {ApplicationConfig, BindingScope} from '@loopback/core';
import {RepositoryMixin} from '@loopback/repository';
import {RestApplication} from '@loopback/rest';
import {
  RestExplorerBindings,
  RestExplorerComponent
} from '@loopback/rest-explorer';
import {ServiceMixin} from '@loopback/service-proxy';
import {NotificationBindings, NotificationsComponent} from 'loopback4-notifications';
import multer from 'multer';
import path from 'path';
import {FILE_UPLOAD_SERVICE, PasswordHasherBindings, STORAGE_DIRECTORY, TokenServiceBindings, TokenServiceConstants, UserServiceBindings} from './keys';
import {MySequence} from './sequence';
import {CasbinAuthorizationComponent} from './services/casbin-authorization/casbin-authorization-component';
import {BcryptHasher} from './services/hash.password';
import {MyJWTService, MyJWTStrategy, MyUserService, SECURITY_SCHEME_SPEC} from './services/jwt-authentication';
import {MyMailerBindings} from './services/mailing/keys';
import {MyMailer} from './services/mailing/nodemail.service';
import {MYSocketIoApplication} from './services/push-notifiication/socket-pusher.application';
import {MySocketPushService, SocketPusherBindings} from './services/push-notifiication/socket-pusher.service';

const PubNub = require('pubnub');



export {ApplicationConfig};

export class YearbookBeApplication extends BootMixin(
  ServiceMixin(RepositoryMixin(RestApplication))
) {
  socketConfig: ApplicationConfig;
  constructor(options: ApplicationConfig = {}) {
    super(options);

    // setup binding
    this.setupBinding();

    // Add security spec
    this.addSecuritySpec();

    this.component(AuthenticationComponent);
    this.component(AuthorizationComponent);
    registerAuthenticationStrategy(this, MyJWTStrategy);
    this.component(CasbinAuthorizationComponent);
    this.component(NotificationsComponent);


    // Set up the custom sequence
    this.sequence(MySequence);

    // Set up default home page
    this.static('/', path.join(__dirname, '../public'));

    // Set up file storage folder
    this.static('/public/files', path.join(__dirname, '../files'));
    // this.static('/audios', path.join(__dirname, '../files/audios'));
    // this.static('/videos', path.join(__dirname, '../files/videos'));
    // this.static('/documents', path.join(__dirname, '../files/documents'));

    // Customize @loopback/rest-explorer configuration here
    this.configure(RestExplorerBindings.COMPONENT).to({
      path: '/explorer',
    });
    this.component(RestExplorerComponent);


    /******
     *
     * CONFIGURE SUB APPLICATIONS
     *
     */
    // Register socket endpoints
    this.lifeCycleObserver(MYSocketIoApplication);


    // Configure file upload with multer options
    this.configureFileUpload(options.fileStorageDirectory);

    this.projectRoot = __dirname;
    // Customize @loopback/boot Booter Conventions here
    this.bootOptions = {
      controllers: {
        // Customize ControllerBooter Conventions here
        dirs: ['controllers'],
        extensions: ['.controller.js'],
        nested: true,
      },
    };
  }



  setupBinding(): void {

    this.bind(PasswordHasherBindings.PASSWORD_HASHER).toClass(BcryptHasher).inScope(BindingScope.SERVER);
    this.bind(PasswordHasherBindings.ROUNDS).to(10).inScope(BindingScope.SERVER)
    this.bind(UserServiceBindings.USER_SERVICE).toClass(MyUserService).inScope(BindingScope.SERVER);
    this.bind(TokenServiceBindings.TOKEN_SERVICE).toClass(MyJWTService).inScope(BindingScope.SERVER);
    this.bind(TokenServiceBindings.TOKEN_SECRET).to(TokenServiceConstants.TOKEN_SECRET_VALUE).inScope(BindingScope.SERVER)
    this.bind(TokenServiceBindings.TOKEN_EXPIRES_IN).to(TokenServiceConstants.TOKEN_EXPIRES_IN_VALUE).inScope(BindingScope.SERVER);
    this.bind(SocketPusherBindings.SOCKET_PUSHER_SERVICE).inScope(BindingScope.SERVER).
      toClass(MySocketPushService).inScope(BindingScope.SINGLETON).inScope(BindingScope.SERVER)
    this.bind(MyMailerBindings.MY_MAILER_SERVICE).toClass(MyMailer).inScope(BindingScope.SERVER).inScope(BindingScope.SINGLETON);

    // configure mailing
    this.bind(NotificationBindings.Config).to({
      sendToMultipleReceivers: false,
      senderEmail: 'antiamoah890@gmail.com'
    });

    // this.bind(NodemailerBindings.Config).to(
    //   {
    //     host: "smtp.gmail.com",
    //     port: 587, //465,
    //     secure: false, // false ->> upgrade later with STARTTLS, true ->> tls
    //     auth: {
    //       user: "antiamoah890@gmail.com",
    //       pass: "#Achiah376@G"
    //     },
    //     tls: {
    //       // do not fail on invalid certs
    //       rejectUnauthorized: false
    //     }
    //   }
    // );
    // this.bind(NotificationBindings.EmailProvider).toProvider(NodemailerProvider);

  }


  addSecuritySpec(): void {
    this.api({
      openapi: '3.0.0',
      info: {
        title: 'test application',
        version: '1.0.0',
      },
      paths: {},
      components: {securitySchemes: SECURITY_SCHEME_SPEC},
      security: [
        {
          // secure all endpoints with 'jwt'
          jwt: [],
        },
      ],
      servers: [{url: '/'}],
    });
  }

  /**
   * Configure `multer` options for file upload
   */
  protected configureFileUpload(destination?: string) {
    // Upload files to `dist/.sandbox` by default
    destination = destination ?? path.join(__dirname, '../.sandbox');
    this.bind(STORAGE_DIRECTORY).to(destination);
    const multerOptions: multer.Options = {
      storage: multer.diskStorage({
        destination,
        // Use the original file name as is
        filename: (req, file, cb) => {
          cb(null, file.originalname);
        },
      }),
    };
    // Configure the file upload service with multer options
    this.configure(FILE_UPLOAD_SERVICE).to(multerOptions);
  }
}

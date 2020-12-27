"use strict";
const nodemailer = require("nodemailer");
export interface EmailMessage {
  from: string;
  to: string; //"bar@example.com, baz@example.com"
  subject: string;
  text: string;
  html: string;
}

export class MyMailer {

  transporter: any;

  constructor() {
    this.transporter = nodemailer.createTransport({
      host: "smtp.gmail.com",
      port: 587, //587,
      secure: false, // true for 465, false for other ports
      auth: {
        user: 'antiamoah890@gmail.com', // generated ethereal user
        pass: '#Achiah376@G', // generated ethereal password
      },
      tls: {
        // do not fail on invalid certs
        rejectUnauthorized: false
      }
    });
  }

  async sendMail(email: EmailMessage) {
    try {
      let info = await this.transporter.sendMail(email);
      console.log(info);
      console.log(email);
    } catch (error) {
      console.log(error);
    }

  }

}

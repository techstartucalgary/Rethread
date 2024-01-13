import { Request, Response, NextFunction } from "express";
import {
  AuthenticationControllerInterface,
  AuthenticationServiceInterface,
} from "../../types.js";
import { BadRequestError } from "../errors/errors.js";

class AuthenticationController implements AuthenticationControllerInterface {
  constructor(private authenticationService: AuthenticationServiceInterface) {}

  postLogin = async (
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<void | Response<any, Record<string, any>>> => {
    // TODO: Implement postLogin controller (Anfaal)
  };

  postSignup = async (
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<void | Response<any, Record<string, any>>> => {
    // TODO: Implement postSignup controller (Ryan)
    const bcrypt = require('bcrypt');
    const saltRounds = 10; // Cost factor for hashing - 10 is a good balance between security and performance
    var hashword = "failed";
    try{
      const email = req.body.email 
      const password = req.body.password
      const firstName = req.body.firstName
      const lastName = req.body.lastName
      //getting signup details from the body
      if(email == null || password == null || firstName == null || lastName == null){
        throw new BadRequestError("All fields must be submitted")
      }
      bcrypt.hash(password, saltRounds, (err: any, hash: string) => {
        if (err) {
          console.error('Error while hashing:', err);

        } else {
          // console.log('Hashed Password:', hash);
          hashword = hash;
        }
      });
      //encrypting password 
      const createdUser = this.authenticationService.signup(email, hashword, firstName, lastName);//creating the user?
      // req.session.user = createdUser; //session doesn't have a user?
      return 
    }
    catch (err){
      next(err)
    }

  };

  postLogout = async (
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<void | Response<any, Record<string, any>>> => {
    // TODO: Implement postLogout controller (Alison)
  };
}

export default AuthenticationController;

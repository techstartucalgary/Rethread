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
    try{
      const email = req.body.email 
      const password = req.body.password
      const firstName = req.body.firstName
      const lastName = req.body.lastName
      if(email == null || password == null || firstName == null || lastName == null){
        throw new BadRequestError("All fields must be submitted")
      }
      this.authenticationService.signup(email, password, firstName, lastName)
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

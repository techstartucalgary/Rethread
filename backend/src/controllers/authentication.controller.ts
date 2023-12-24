import { Request, Response, NextFunction } from "express";
import {
  AuthenticationControllerInterface,
  AuthenticationServiceInterface,
} from "../../types.js";

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
  };

  postLogout = async (
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<void | Response<any, Record<string, any>>> => {
    try {
      await this.authenticationService.logout(req);
      
    }
    catch(err){
      next(err)
    }
  };
  
}

export default AuthenticationController;

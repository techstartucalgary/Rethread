import { Router } from "express";
import { PrismaClient } from "@prisma/client";
import UserRepository from "../repositories/user.repository.js";
import AuthenticationService from "../services/authentication.service.js";
import AuthenticationController from "../controllers/authentication.controller.js";
import {
  AuthenticationControllerInterface,
  AuthenticationServiceInterface,
  UserRepositoryInterface,
} from "../../types.js";

const authenticationRouter = Router();

const prisma = new PrismaClient();

const userRepository: UserRepositoryInterface = new UserRepository(prisma);

const authenticationService: AuthenticationServiceInterface =
  new AuthenticationService(userRepository);

const authenticationController: AuthenticationControllerInterface =
  new AuthenticationController(authenticationService);

authenticationRouter.post("/login", authenticationController.postLogin);

authenticationRouter.post("/signup", authenticationController.postSignup);

authenticationRouter.post("/logout", authenticationController.postLogout);

export default authenticationRouter;

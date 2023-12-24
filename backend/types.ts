import { Request, Response, NextFunction } from "express";

export enum Synthetic {
  NYLON = "NYLON",
  POLYESTER = "POLYESTER",
  SPANDEX = "SPANDEX",
  ACETATE = "ACETATE",
  CUPRO = "CUPRO",
  FLANNEL = "FLANNEL",
  LYOCELL = "LYOCELL",
  PVC = "PVC",
  RAYON = "RAYON",
  PET = "PET",
  TYVEK = "TYVEK",
  VINYLON = "VINYLON",
}

export interface AlgorithmControllerInterface {
  postAlgorithm: (
    req: Request,
    res: Response,
    next: NextFunction
  ) => Promise<void | Response<any, Record<string, any>>>;
}

export interface AlgorithmServiceInterface {
  isClothingEcoFriendly(prompt: string): Promise<boolean>;
}

export interface AuthenticationControllerInterface {
  postLogin: (
    req: Request,
    res: Response,
    next: NextFunction
  ) => Promise<void | Response<any, Record<string, any>>>;
  postSignup: (
    req: Request,
    res: Response,
    next: NextFunction
  ) => Promise<void | Response<any, Record<string, any>>>;
  postLogout: (
    req: Request,
    res: Response,
    next: NextFunction
  ) => Promise<void | Response<any, Record<string, any>>>;
}

export interface AuthenticationServiceInterface {
  login(): Promise<void>;
  signup(): Promise<void>;
  logout(req: Request): Promise<void>;
}

export interface UserRepositoryInterface {
  createUser(user: UserInterface): Promise<PrismaUserInterface>;
  getUserByEmail(email: string): Promise<PrismaUserInterface | null>;
}

export interface UserInterface {
  getEmail(): string;
  getPassword(): string;
  getFirstName(): string;
  getLastName(): string;
  setEmail(email: string): void;
  setPassword(password: string): void;
  setFirstName(firstName: string): void;
  setLastName(lastName: string): void;
}

export interface PrismaUserInterface {
  id: string;
  email: string;
  password: string;
  firstName: string;
  lastName: string;
  createdAt: Date;
  updatedAt: Date;
}

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

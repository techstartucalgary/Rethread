import { Request, Response, NextFunction } from "express";
import { BadRequestError } from "../errors/errors.js";
import * as algorithmService from "../services/algorithm.service.js";

export async function postAlgorithm(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    const prompt: string = req.body.prompt;

    if (!prompt) {
      return next(new BadRequestError("No string was provided!"));
    }

    const isEcoFriendly: boolean =
      algorithmService.isClothingEcoFriendly(prompt);

    if (!isEcoFriendly) {
      return res.status(200).json("Clothing is not eco-friendly!");
    }
    return res.status(200).json("Clothing is eco-friendly!");
  } catch (err) {
    next(err);
  }
}

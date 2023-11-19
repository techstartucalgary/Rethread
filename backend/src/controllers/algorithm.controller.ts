import { Request, Response, NextFunction } from "express";
import { BadRequestError } from "../errors/errors.js";
import { AlgorithmServiceInterface } from "../../types.js";

class AlgorithmController {
  constructor(private algorithmService: AlgorithmServiceInterface) {}

  postAlgorithm = async (
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<void | Response<any, Record<string, any>>> => {
    try {
      const prompt: string = req.body.prompt;
      if (!prompt) {
        return next(new BadRequestError("No string was provided!"));
      }

      const isEcoFriendly: boolean =
        await this.algorithmService.isClothingEcoFriendly(prompt);

      if (!isEcoFriendly) {
        return res.status(200).json("Clothing is not eco-friendly!");
      }
      return res.status(200).json("Clothing is eco-friendly!");
    } catch (err) {
      next(err);
    }
  };
}

export default AlgorithmController;

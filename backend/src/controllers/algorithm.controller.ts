import { Request, Response, NextFunction } from "express";
import { HttpBadRequestError } from "../errors/http.error.js";
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
        return next(new HttpBadRequestError());
      }

      const isEcoFriendly: boolean =
        await this.algorithmService.isClothingEcoFriendly(prompt);

      if (!isEcoFriendly) {
        return res.status(200).json("Clothing is not eco-friendly!");
      }
      return res.status(200).json("Clothing is eco-friendly!");
    } catch (e) {
      next(e);
    }
  };
}

export default AlgorithmController;

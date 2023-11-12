import { Request, Response, NextFunction } from "express";
import { BadRequestError, NotFoundError } from "../errors/errors.js";

export default function errorHandler(
  err: Error,
  req: Request,
  res: Response,
  next: NextFunction
) {
  if (err instanceof BadRequestError) {
    res.status(400).json(err.message);
  } else if (err instanceof NotFoundError) {
    res.status(404).json(err.message);
  } else {
    res.status(500).json("Something went wrong!");
  }
}

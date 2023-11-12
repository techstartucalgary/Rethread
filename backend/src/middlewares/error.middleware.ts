import { Request, Response, NextFunction } from "express";
import { BadRequestError, NotFoundError } from "../errors/errors.js";

export default function errorHandler(
  err: Error,
  req: Request,
  res: Response,
  next: NextFunction
) {
  if (err instanceof BadRequestError) {
    res.status(400).json({ message: err.message });
  } else if (err instanceof NotFoundError) {
    res.status(404).json({ message: err.message });
  } else {
    res.status(500).json({ message: "Something went wrong!" });
  }
}

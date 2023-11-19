import { Request, Response, NextFunction } from "express";
import {
  BadRequestError,
  ForbiddenError,
  NotFoundError,
  UnauthorizedError,
} from "../errors/errors.js";

export default function errorHandler(
  err: Error,
  req: Request,
  res: Response,
  next: NextFunction
) {
  if (err instanceof BadRequestError) {
    res.status(400).json(err.message);
  } else if (err instanceof UnauthorizedError) {
    res.status(401).json(err.message);
  } else if (err instanceof ForbiddenError) {
    res.status(403).json(err.message);
  } else if (err instanceof NotFoundError) {
    res.status(404).json(err.message);
  } else {
    res.status(500).json({
      name: err.name,
      message: err.message,
      stack: err.stack,
    });
  }
}

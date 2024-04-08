import { Request, Response, NextFunction } from "express";
import {
  HttpBadRequestError,
  HttpForbiddenError,
  HttpNotFoundError,
  HttpUnauthorizedError,
} from "../error/http.error.js";
import { TesseractServiceError } from "../error/tesseract.error.js";

const errorHandler = (
  e: Error,
  _: Request,
  res: Response,
  next: NextFunction,
) => {
  if (e instanceof HttpBadRequestError) {
    res.status(400).json({ error: "Bad Request Error" });
  } else if (e instanceof HttpUnauthorizedError) {
    res.status(401).json({ error: "Unauthorized Error" });
  } else if (e instanceof HttpForbiddenError) {
    res.status(403).json({ error: "Forbidden Error" });
  } else if (e instanceof HttpNotFoundError) {
    res.status(404).json({ error: "Not Found Error" });
  } else if (e instanceof TesseractServiceError) {
    res.status(500).json({ error: "Tesseract Service Error" });
  } else {
    res.status(500).json({ error: "Unexpected error" });
  }
};

export default errorHandler;

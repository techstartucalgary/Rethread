import { Request, Response, NextFunction } from "express";
import {
  HttpBadRequestError,
  HttpForbiddenError,
  HttpNotFoundError,
  HttpUnauthorizedError,
} from "../error/http.error.js";
import {
  PrismaClientInitializationError,
  PrismaClientRustPanicError,
  PrismaClientUnknownRequestError,
  PrismaClientValidationError,
  PrismaGenericError,
} from "../error/prisma.error.js";
import { ProductNotFoundError } from "../error/product.error.js";

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
  } else if (e instanceof PrismaClientUnknownRequestError) {
    res.status(500).json({ error: "Prisma Client Unknown Request Error" });
  } else if (e instanceof PrismaClientRustPanicError) {
    res.status(500).json({ error: "Prisma Client Rust Panic Error" });
  } else if (e instanceof PrismaClientInitializationError) {
    res.status(500).json({ error: "Prisma Client Initialization Error" });
  } else if (e instanceof PrismaClientValidationError) {
    res.status(500).json({ error: "Prisma Client Validation Error" });
  } else if (e instanceof PrismaGenericError) {
    res.status(500).json({ error: "Prisma Generic Error" });
  } else if (e instanceof ProductNotFoundError) {
    res.status(500).json({ error: "Product Not Found Error" });
  } else {
    res.status(500).json({ error: "Unexpected error" });
  }
};

export default errorHandler;

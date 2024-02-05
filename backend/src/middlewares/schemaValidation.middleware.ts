import { NextFunction, Request, Response } from "express";
import { AnyZodObject, ZodError } from "zod";

const schemaValidation =
  (schemaValidation: AnyZodObject) =>
  (req: Request, res: Response, next: NextFunction) => {
    try {
      schemaValidation.parse(req);
      next();
    } catch (e) {
      if (e instanceof ZodError) {
        res.status(400).json({
          error: e.errors.map((error) => error.message),
        });
      } else {
        next(e);
      }
    }
  };

export default schemaValidation;

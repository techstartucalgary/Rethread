import { Tag } from "../../types.js";
import ScannerProvider from "../abstracts/scanner.abstract.js";
import { Request, Response, NextFunction } from "express";

class ScannerController {
  constructor(private service: ScannerProvider) {
    this.service = service;
  }

  public postMaterials = async (
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<Response<any, Record<string, any>> | void> => {
    try {
      const text: string = await this.service.getTextFromImage(req.body.image);
      const materials: Tag[] = this.service.getMaterials(text);
      return res.status(201).json(materials);
    } catch (e) {
      next(e);
    }
  };
}

export default ScannerController;

import { ScannerRequest, Tag } from "../types.js";
import ScannerProvider from "../abstracts/scanner.abstract.js";
import { Request, Response, NextFunction } from "express";

class ScannerController {
  constructor(private service: ScannerProvider) {
    this.service = service;
  }

  public postMaterials = async (
    req: Request<unknown, unknown, ScannerRequest>,
    res: Response,
    next: NextFunction
  ): Promise<Response<any, Record<string, any>> | void> => {
    try {
      const text: string = await this.service.getTextFromImage(req.body);
      const materials: Tag[] = this.service.checkPercent(this.service.getMaterials(text));
      const score: number = this.service.getSustainability(materials);  
      return res.status(201).json(score);
    } catch (e) {
      next(e);
    }
  };
}

export default ScannerController;

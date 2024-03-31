import { ScannerRequest, Tag, Info, Flags } from "../types.js";
import ScannerProvider from "../abstract/scanner.abstract.js";
import { Request, Response, NextFunction } from "express";

class ScannerController {
  constructor(private service: ScannerProvider) {
    this.service = service;
  }

  public postMaterials = async (
    req: Request<unknown, unknown, ScannerRequest>,
    res: Response,
    next: NextFunction,
  ): Promise<Response<any, Record<string, any>> | void> => {
    try {
      const text: string = await this.service.getTextFromImage(req.body);
      const materials: Flags = this.service.getMaterials(text);
      const score: Info = this.service.getSustainability(materials);
      return res.status(201).json(score);
    } catch (e) {
      next(e);
    }
  };
}

export default ScannerController;

import ScannerProvider from "../abstracts/scanner.abstract.js";
import { createWorker } from "tesseract.js";
import { ScannerRequest, Tag } from "../types.js";
import { TesseractServiceError } from "../errors/tesseract.error.js";

class ScannerRepository implements ScannerProvider {
  public getMaterials = (text: string): Tag[] => {
    throw new Error("Method not implemented.");
  };
  public checkPercent = (arr: Tag[]): Tag[] => {
    throw new Error("Method not implemented.");
  };
  public getSustainability = (arr: Tag[]): number => {
    throw new Error("Method not implemented.");
  };
  public getTextFromImage = async (
    scannerRequest: ScannerRequest
  ): Promise<string> => {
    try {
      const worker: Tesseract.Worker = await createWorker("eng");
      const ret: Tesseract.RecognizeResult = await worker.recognize(
        scannerRequest.imageUrl
      );
      await worker.terminate();
      return ret.data.text;
    } catch (e) {
      throw new TesseractServiceError();
    }
  };
}

export default ScannerRepository;

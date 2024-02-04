import { createWorker } from "tesseract.js";
import { Tag } from "../../types.js";
import ScannerProvider from "../abstracts/scanner.abstract.js";
import { TesseractServiceError } from "../errors/tesseract.error.js";

class ScannerRepository implements ScannerProvider {
  getMaterials = (_: string): Tag[] => {
    throw new Error("Method not implemented.");
  };

  getTextFromImage = async (imagePath: string): Promise<string> => {
    try {
      const worker: Tesseract.Worker = await createWorker("eng");
      const ret: Tesseract.RecognizeResult = await worker.recognize(imagePath);
      await worker.terminate();
      return ret.data.text;
    } catch (e) {
      throw new TesseractServiceError();
    }
  };
}

export default ScannerRepository;

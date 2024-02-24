import { ScannerRequest, Tag } from "../types";

abstract class ScannerProvider {
  abstract getMaterials(text: string): Tag[];

  abstract getTextFromImage(scannerRequest: ScannerRequest): Promise<string>;
}

export default ScannerProvider;

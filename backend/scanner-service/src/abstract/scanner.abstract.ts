import { ScannerRequest, Tag } from "../types";

abstract class ScannerProvider {
  abstract getMaterials(text: string): Tag[];

  abstract getSustainability(arr: Tag[]): number;

  abstract checkPercent(arr: Tag[]): Tag[];

  abstract getTextFromImage(scannerRequest: ScannerRequest): Promise<string>;
}

export default ScannerProvider;

import ScannerProvider from "../abstract/scanner.abstract.js";
import { ScannerRequest, Tag } from "../types.js";

class ScannerService implements ScannerProvider {
  constructor(private provider: ScannerProvider) {
    this.provider = provider;
  }

  public getMaterials = (text: string): Tag[] => {
    const regex = /(100|\d{1,2})% *(\b\w+\b)/g;
    const matches = text.matchAll(regex);
    const scannedTags: Tag[] = [];

    for (const match of matches) {
      if (match) {
        scannedTags.push({
          material: match[2],
          percentage: match[1],
        });
      }
    }

    return scannedTags;
  };

  public getTextFromImage = async (
    scannerRequest: ScannerRequest,
  ): Promise<string> => {
    return await this.provider.getTextFromImage(scannerRequest);
  };
}

export default ScannerService;

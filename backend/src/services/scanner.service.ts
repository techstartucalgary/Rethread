import ScannerProvider from "../abstracts/scanner.abstract.js";
import { Tag } from "../../types.js";
import { HttpBadRequestError } from "../errors/http.error.js";

class ScannerService implements ScannerProvider {
  constructor(private provider: ScannerProvider) {
    this.provider = provider;
  }

  getMaterials = (text: string): Tag[] => {
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

  getTextFromImage = async (imagePath: string): Promise<string> => {
    if (!imagePath) {
      throw new HttpBadRequestError();
    }
    return await this.provider.getTextFromImage(imagePath);
  };
}

export default ScannerService;

import { Tag } from "../../types";

abstract class ScannerProvider {
  abstract getMaterials(text: string): Tag[];

  abstract getTextFromImage(imagePath: string): Promise<string>;
}

export default ScannerProvider;

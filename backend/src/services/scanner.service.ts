import ScannerProvider from "../abstracts/scanner.abstract.js";
import { ScannerRequest, Tag, sustainable } from "../types.js";

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

  public checkPercent = (arr: Tag[]): Tag[] => {    //for checking if percentages add to 100 and ignoring any excess materials
    let total = 0;
    let res: Tag[] = [];
    for(let i=0;i<arr.length;i++){
        if(total < 100){
            res.push(arr[i]);
            total += +arr[i].percentage;
        }
    }
    if(total != 100){
        console.log("Composition did not add to 100%");
        return [];
    }
    return res;
  }

  public getSustainability = (arr: Tag[]): number => { //gives a score for the sustainability of the article of clothing
    let score = 0;
    for(let i=0;i<arr.length;i++){
        if(sustainable.includes(arr[i].material.toLowerCase())){
            score += +arr[i].percentage;
            console.log(arr[i].material, " is sustainable");
        }
        else{
            console.log(arr[i].material, " is not sustainable");
        }
    }
    return score
  }

  public getTextFromImage = async (
    scannerRequest: ScannerRequest
  ): Promise<string> => {
    return await this.provider.getTextFromImage(scannerRequest);
  };
}

export default ScannerService;

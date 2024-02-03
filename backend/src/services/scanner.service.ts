import Tesseract from 'tesseract.js'; //Javascript OCR 

type Tag = {
    material: string;
    percentage: string;
}

class ScannerService{

    getTextFromImage = async(imagePath: string): Promise<string> => {
        console.log("getTextFromImage called");
        // return "20% Cotton 40% Shit 40% Rizz";
        return new Promise<string>((resolve, reject) => {
            console.log("Test1");
            Tesseract.recognize(imagePath,'eng',{
                logger: info => console.log(info), // optional logger function
            })
            .then(({ data: { text } }) => {
                console.log("Test2");
                resolve(text);
                console.log("text: ",text);
                return text;
            })
            .catch((error) => {
                console.log("Test2.5");
                reject(error);
            });
        });
      }

    getMaterials = async(txt: string): Promise<string> => {
        console.log("getMaterials called");
        const regex = /(100|\d{1,2})% *(\b\w+\b)/g;
        let m;
        let scannedTags: Tag[] = [];
        do {
          m = regex.exec(txt);
          if (m){
            scannedTags.push({
              material: m[2],
              percentage: m[1]
            });
          }
        }while (m);
        console.log(JSON.stringify(scannedTags));
        return JSON.stringify(scannedTags);
      }
}


export default ScannerService;
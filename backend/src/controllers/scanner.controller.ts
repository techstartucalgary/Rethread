import { Request, Response, NextFunction, response } from "express";
import ScannerService from "../services/scanner.service.js";

class ScannerController {
    constructor(private service: ScannerService) {
        this.service = service;
    }
    postMaterials = async (//must send image as tag "image" and value base64 string. Returns JSON with the percentage and material of each material found on the tag
        req: Request,
        res: Response,
        next: NextFunction
    ): Promise<Response<any, Record<string, any>> | void> => {
    try {
        console.log("postMaterials called");
            let materials = await (async () => {
            var str;
            str = await this.service.getMaterials(await this.service.getTextFromImage(req.body.image));
            // console.log("Fuck: ", await str);
            return str;
        })();
        console.log("materials: ",materials);
        return res.status(201).json(JSON.parse(materials));
    } catch (e) {
        console.log("Error: ", e);
        next(e);
    }
    };
}

export default ScannerController;
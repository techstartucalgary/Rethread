import ScannerController from "../controller/scanner.controller.js";
import ScannerService from "../service/scanner.service.js";
import ScannerRepository from "../repository/scanner.repository.js";
import schemaValidation from "../middleware/schemaValidation.middleware.js";
import { Router } from "express";
import { ScannerSchema } from "../schema/scanner.schema.js";

const scannerRouter = Router();
const scannerController = new ScannerController(
  new ScannerService(new ScannerRepository()),
);

scannerRouter.post(
  "/",
  schemaValidation(ScannerSchema),
  scannerController.postMaterials,
);

export default scannerRouter;

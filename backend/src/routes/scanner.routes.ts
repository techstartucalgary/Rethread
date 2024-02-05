import ScannerController from "../controllers/scanner.controller.js";
import ScannerService from "../services/scanner.service.js";
import ScannerRepository from "../repositories/scanner.repository.js";
import schemaValidation from "../middlewares/schemaValidation.middleware.js";
import { Router } from "express";
import { ScannerSchema } from "../schemas/scanner.schema.js";

const scannerRouter = Router();
const scannerController = new ScannerController(
  new ScannerService(new ScannerRepository())
);

scannerRouter.post(
  "/",
  schemaValidation(ScannerSchema),
  scannerController.postMaterials
);

export default scannerRouter;

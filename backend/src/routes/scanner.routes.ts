import { Router } from "express";
import ScannerController from "../controllers/scanner.controller.js";
import ScannerService from "../services/scanner.service.js";

const scannerRouter = Router();

const scannerController = new ScannerController(new ScannerService());

scannerRouter.post("/", scannerController.postMaterials);

export default scannerRouter;
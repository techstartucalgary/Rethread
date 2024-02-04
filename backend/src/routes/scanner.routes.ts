import ScannerController from "../controllers/scanner.controller.js";
import ScannerService from "../services/scanner.service.js";
import ScannerRepository from "../repositories/scanner.repository.js";
import { Router } from "express";

const scannerRouter = Router();
const scannerController = new ScannerController(
  new ScannerService(new ScannerRepository())
);

scannerRouter.post("/", scannerController.postMaterials);

export default scannerRouter;

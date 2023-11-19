import { Router } from "express";
import AlgorithmController from "../controllers/algorithm.controller.js";
import AlgorithmService from "../services/algorithm.service.js";
import {
  AlgorithmControllerInterface,
  AlgorithmServiceInterface,
} from "../../types.js";

const algorithmRouter: Router = Router();

const algorithmService: AlgorithmServiceInterface = new AlgorithmService();
const algorithmController: AlgorithmControllerInterface =
  new AlgorithmController(algorithmService);

algorithmRouter.post("/", algorithmController.postAlgorithm);

export default algorithmRouter;

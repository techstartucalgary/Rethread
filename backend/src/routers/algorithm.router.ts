import { Router } from "express";
import * as algorithmController from "../controllers/algorithm.controller.js";

const algorithmRouter: Router = Router();

algorithmRouter.post("/", algorithmController.postAlgorithm);

export default algorithmRouter;

import express, { Express, NextFunction, Request, Response } from "express";
import cors from "cors";
import algorithmRouter from "./routers/algorithm.router.js";
import errorHandler from "./middlewares/error.middleware.js";
import { PORT } from "./config/config.js";

export const app: Express = express();

app.use(cors());

app.use(express.json());

app.get("/", (req: Request, res: Response, next: NextFunction) => {
  res.status(200).send("Server is up and running!");
});

app.get("/api/v1/health", (req: Request, res: Response, next: NextFunction) => {
  res.status(200).json({ status: "healthy" });
});

app.use("/api/v1/algorithm", algorithmRouter);

app.use(errorHandler);

app.listen(PORT, () => {
  console.log(`[INFO]: Server is running at http://localhost:${PORT}/`);
});

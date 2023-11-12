import express, { Express, NextFunction, Request, Response } from "express";
import algorithmRouter from "./routers/algorithm.router.js";
import dotenv from "dotenv";
import errorHandler from "./middlewares/error.middleware.js";

dotenv.config();

const PORT: number = Number(process.env.PORT) || 8888;

export const app: Express = express();

app.use(express.json());

app.get("/", (req: Request, res: Response, next: NextFunction) => {
  res.status(200).send("Server is up and running!");
});

app.get("/health", (req: Request, res: Response, next: NextFunction) => {
  res.status(200).json({ status: "healthy" });
});

app.use("/algorithm", algorithmRouter);

app.use(errorHandler);

app.listen(PORT, () => {
  console.log(`[INFO]: Server is running at http://localhost:${PORT}/`);
});

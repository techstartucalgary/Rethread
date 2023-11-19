import express, { Express } from "express";
import cors from "cors";
import algorithmRouter from "./routers/algorithm.router.js";
import authenticationRouter from "./routers/authentication.router.js";
import errorHandler from "./middlewares/error.middleware.js";
import { PORT } from "./config/config.js";

export const app: Express = express();

app.use(cors());

app.use(express.json());

app.use("/auth", authenticationRouter);

app.use("/api/v1/algorithm", algorithmRouter);

app.use(errorHandler);

app.listen(PORT, () => {
  console.log(`[INFO]: Server is running at http://localhost:${PORT}/`);
});

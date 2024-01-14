import express, { Express } from "express";
import cors from "cors";
import { PORT } from "./config/config.js";

import errorHandler from "./middlewares/error.middleware.js";

import algorithmRouter from "./routes/algorithm.routes.js";

export const app: Express = express();

app.use(express.json());

app.use(cors());

app.use("/api/v1/algorithm", algorithmRouter);

app.use(errorHandler);

app.listen(PORT, () => {
  console.log(`[INFO]: Server is running at http://localhost:${PORT}/`);
});

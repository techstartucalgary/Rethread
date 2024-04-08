import express, { Express } from "express";
import cors from "cors";
import { PORT } from "./config/config.js";
import errorHandler from "./middleware/error.middleware.js";
import scannerRouter from "./route/scanner.route.js";

export const app: Express = express();

app.use(express.json({ limit: "50mb" }));

app.use(cors());

app.use("/api/v1/scanner", scannerRouter);

app.use(errorHandler);

app.listen(PORT, () => {
  console.log(`[INFO]: Server is running at http://localhost:${PORT}/`);
});

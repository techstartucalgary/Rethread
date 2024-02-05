import express, { Express } from "express";
import cors from "cors";
import { PORT } from "./config/config.js";
import errorHandler from "./middlewares/error.middleware.js";
import { PrismaClient } from "@prisma/client";
import productRouter from "./routes/product.routes.js";
import scannerRouter from "./routes/scanner.routes.js";

export const app: Express = express();
export const prisma = new PrismaClient();

app.use(express.json({ limit: "50mb" }));

app.use(cors());

app.use("/api/v1/scanner", scannerRouter);

app.use("/api/v1/products", productRouter);

app.use(errorHandler);

app.listen(PORT, () => {
  console.log(`[INFO]: Server is running at http://localhost:${PORT}/`);
});

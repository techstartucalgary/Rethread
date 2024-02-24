import express, { Express } from "express";
import cors from "cors";
import { PORT } from "./config/config.js";
import errorHandler from "./middlewares/error.middleware.js";
import { PrismaClient } from "@prisma/client";

export const app: Express = express();
//export const prisma = new PrismaClient();

app.use(express.json());

app.use(cors());

app.get("/api/v1/feed", (req, res) => {
  res.send("Feed Service is running");
});

app.use(errorHandler);

app.listen(PORT, () => {
  console.log(`[INFO]: Server is running at http://localhost:${PORT}/`);
});

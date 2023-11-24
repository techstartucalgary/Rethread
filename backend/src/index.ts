import express, { Express } from "express";
import cors from "cors";
import { PORT } from "./config/config.js";

import session from "./middlewares/session.middleware.js";
import errorHandler from "./middlewares/error.middleware.js";

import algorithmRouter from "./routers/algorithm.router.js";
import authenticationRouter from "./routers/authentication.router.js";

export const app: Express = express();

app.use(express.json());

app.use(cors());

app.use(session);

app.use("/auth", authenticationRouter);

app.use("/api/v1/algorithm", algorithmRouter);

app.use(errorHandler);

app.listen(PORT, () => {
  console.log(`[INFO]: Server is running at http://localhost:${PORT}/`);
});

import express, { Express } from "express";
import cors from "cors";
import { PORT } from "./config/config.js";
import errorHandler from "./middlewares/error.middleware.js";

import algorithmRouter from "./routes/algorithm.routes.js";

import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()
export const app: Express = express();

app.use(express.json());

app.use(cors());

app.use("/api/v1/algorithm", algorithmRouter);

app.post("/product", async (request, response) => {
  const {title, size, color, description, gender, category, price, imageUrl} = request.body
  const newProduct = await prisma.product.create({
      data: {
          title, size, color, description, gender, category, price, imageUrl
      }
  })
  response.json(newProduct)
}) 

app.get("/products", async (request, response) => {
  //add filtering 
  const prods = await prisma.product.findMany();
  
  response.json(prods);
});

app.get("/product/:id", async (request, response) => {
  let prodID = request.params.id;
  const product = await prisma.product.findUnique({
    where: {id: prodID}
  })
  
  response.json(product);
});

app.use(errorHandler);

app.listen(PORT, () => {
  console.log(`[INFO]: Server is running at http://localhost:${PORT}/`);
});

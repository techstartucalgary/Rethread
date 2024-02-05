import ProductController from "../controllers/product.controller.js";
import ProductService from "../services/product.service.js";
import ProductRepository from "../repositories/product.repository.js";
import schemaValidation from "../middlewares/schemaValidation.middleware.js";
import {
  GetProductSchema,
  CreateProductSchema,
} from "../schemas/product.schema.js";
import { Router } from "express";

const productRouter = Router();
const productController = new ProductController(
  new ProductService(new ProductRepository())
);

productRouter.get("/", productController.getProducts);

productRouter.get(
  "/:id",
  schemaValidation(GetProductSchema),
  productController.getProductById
);

productRouter.post(
  "/",
  schemaValidation(CreateProductSchema),
  productController.postProduct
);

productRouter.delete(
  "/:id",
  schemaValidation(GetProductSchema),
  productController.deleteProduct
);

export default productRouter;

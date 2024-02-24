import ProductController from "../controller/product.controller.js";
import ProductService from "../service/product.service.js";
import ProductRepository from "../repository/product.repository.js";
import schemaValidation from "../middleware/schemaValidation.middleware.js";
import {
  GetProductSchema,
  CreateProductSchema,
} from "../schema/product.schema.js";
import { Router } from "express";

const productRouter = Router();
const productController = new ProductController(
  new ProductService(new ProductRepository()),
);

productRouter.get("/", productController.getProducts);

productRouter.get(
  "/:id",
  schemaValidation(GetProductSchema),
  productController.getProductById,
);

productRouter.post(
  "/",
  schemaValidation(CreateProductSchema),
  productController.postProduct,
);

productRouter.delete(
  "/:id",
  schemaValidation(GetProductSchema),
  productController.deleteProduct,
);

export default productRouter;

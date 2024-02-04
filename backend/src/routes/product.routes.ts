import ProductController from "../controllers/product.controller.js";
import ProductService from "../services/product.service.js";
import ProductRepository from "../repositories/product.repository.js";
import { Router } from "express";

const productRouter = Router();
const productController = new ProductController(
  new ProductService(new ProductRepository())
);

productRouter.get("/", productController.getProducts);
productRouter.get("/:id", productController.getProductById);
productRouter.post("/", productController.postProduct);
productRouter.delete("/:id", productController.deleteProduct);

export default productRouter;

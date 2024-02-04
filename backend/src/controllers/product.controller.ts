import { CreateProduct, GetProduct, PrismaProduct } from "../types";
import ProductProvider from "../abstracts/product.abstract";
import { Request, Response, NextFunction } from "express";

class ProductController {
  constructor(private service: ProductProvider) {
    this.service = service;
  }

  public getProducts = async (
    req: Request,
    res: Response,
    next: NextFunction
  ): Promise<Response<any, Record<string, any>> | void> => {
    try {
      const products = await this.service.getProducts();
      return res.status(200).json(products);
    } catch (e) {
      next(e);
    }
  };

  public getProductById = async (
    req: Request<GetProduct>,
    res: Response,
    next: NextFunction
  ): Promise<Response<any, Record<string, any>> | void> => {
    try {
      const product: PrismaProduct = await this.service.getProductById(
        req.params
      );
      return res.status(200).json(product);
    } catch (e) {
      next(e);
    }
  };

  public postProduct = async (
    req: Request<unknown, unknown, CreateProduct>,
    res: Response,
    next: NextFunction
  ): Promise<Response<any, Record<string, any>> | void> => {
    try {
      const newProduct = await this.service.createProduct(req.body);
      return res.status(201).json(newProduct);
    } catch (e) {
      next(e);
    }
  };

  public deleteProduct = async (
    req: Request<GetProduct>,
    res: Response,
    next: NextFunction
  ): Promise<Response<any, Record<string, any>> | void> => {
    try {
      const product = await this.service.deleteProduct(req.params);
      return res.status(200).json(product);
    } catch (e) {
      next(e);
    }
  };
}

export default ProductController;

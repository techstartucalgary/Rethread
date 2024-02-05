import {
  PrismaProduct,
  PrismaProducts,
  CreateProduct,
  GetProduct,
} from "../types";

abstract class ProductProvider {
  abstract getProducts(): Promise<PrismaProducts>;

  abstract getProductById(getProduct: GetProduct): Promise<PrismaProduct>;

  abstract createProduct(createProduct: CreateProduct): Promise<PrismaProduct>;

  abstract deleteProduct(getProduct: GetProduct): Promise<PrismaProduct>;
}

export default ProductProvider;

import { PrismaProduct, PrismaProducts } from "../../types";

abstract class ProductProvider {
  abstract getProducts(): Promise<PrismaProducts>;

  abstract getProductById(id: string): Promise<PrismaProduct>;

  abstract createProduct(
    title: string,
    size: string,
    color: string,
    description: string,
    gender: string,
    category: string,
    price: number,
    imageUrl: string,
    url: string
  ): Promise<PrismaProduct>;

  abstract deleteProduct(id: string): Promise<PrismaProduct>;
}

export default ProductProvider;

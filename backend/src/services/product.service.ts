import ProductProvider from "../abstracts/product.abstract.js";
import {
  CreateProduct,
  GetProduct,
  PrismaProduct,
  PrismaProducts,
} from "../types.js";

class ProductService implements ProductProvider {
  constructor(private provider: ProductProvider) {
    this.provider = provider;
  }

  public getProducts = async (): Promise<PrismaProducts> => {
    return await this.provider.getProducts();
  };

  public getProductById = async (
    getProduct: GetProduct
  ): Promise<PrismaProduct> => {
    return await this.provider.getProductById(getProduct);
  };

  public createProduct = async (
    createProduct: CreateProduct
  ): Promise<PrismaProduct> => {
    return await this.provider.createProduct(createProduct);
  };

  public deleteProduct = async (
    getProduct: GetProduct
  ): Promise<PrismaProduct> => {
    return await this.provider.deleteProduct(getProduct);
  };
}

export default ProductService;

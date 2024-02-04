import ProductProvider from "../abstracts/product.abstract.js";
import { PrismaProduct, PrismaProducts } from "../../types.js";
import { HttpBadRequestError } from "../errors/http.error.js";

class ProductService implements ProductProvider {
  constructor(private provider: ProductProvider) {
    this.provider = provider;
  }

  public getProducts = async (): Promise<PrismaProducts> => {
    return await this.provider.getProducts();
  };

  public getProductById = async (id: string): Promise<PrismaProduct> => {
    if (!id) {
      throw new HttpBadRequestError();
    }
    return await this.provider.getProductById(id);
  };

  public createProduct = async (
    title: string,
    size: string,
    color: string,
    description: string,
    gender: string,
    category: string,
    price: number,
    imageUrl: string,
    url: string
  ): Promise<PrismaProduct> => {
    if (
      !title ||
      !size ||
      !color ||
      !description ||
      !gender ||
      !category ||
      !price ||
      !imageUrl ||
      !url
    ) {
      throw new HttpBadRequestError();
    }
    return await this.provider.createProduct(
      title,
      size,
      color,
      description,
      gender,
      category,
      price,
      imageUrl,
      url
    );
  };

  public deleteProduct = async (id: string): Promise<PrismaProduct> => {
    return await this.provider.deleteProduct(id);
  };
}

export default ProductService;

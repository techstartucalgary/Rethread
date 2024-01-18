import { HttpBadRequestError } from "../errors/http.error.js";

class ProductService implements ProductProvider {
  constructor(private provider: ProductProvider) {
    this.provider = provider;
  }

  getProducts = async (): Promise<PrismaProducts | Error> => {
    return await this.provider.getProducts();
  };

  getProductById = async (id: string): Promise<PrismaProduct | Error> => {
    return await this.provider.getProductById(id);
  };

  createProduct = async (
    title: string,
    size: string,
    color: string,
    description: string,
    gender: string,
    category: string,
    price: number,
    imageUrl: string
  ): Promise<PrismaProduct | Error> => {
    if (
      !title ||
      !size ||
      !color ||
      !description ||
      !gender ||
      !category ||
      !price ||
      !imageUrl
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
      imageUrl
    );
  };

  deleteProduct = async (id: string): Promise<PrismaProduct | Error> => {
    return await this.provider.deleteProduct(id);
  };
}

export default ProductService;

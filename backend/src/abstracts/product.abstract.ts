type PrismaProduct = {
  id: string;
  title: string;
  size: string;
  color: string;
  description: string;
  gender: string;
  category: string;
  price: number;
  imageUrl: string;
  createdAt: Date;
  updatedAt: Date;
};

type PrismaProducts = PrismaProduct[];

abstract class ProductProvider {
  abstract getProducts(): Promise<PrismaProducts | Error>;

  abstract getProductById(id: string): Promise<PrismaProduct | Error>;

  abstract createProduct(
    title: string,
    size: string,
    color: string,
    description: string,
    gender: string,
    category: string,
    price: number,
    imageUrl: string
  ): Promise<PrismaProduct | Error>;

  abstract deleteProduct(id: string): Promise<PrismaProduct | Error>;
}

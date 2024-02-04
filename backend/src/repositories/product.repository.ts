import ProductProvider from "../abstracts/product.abstract.js";
import { prisma } from "../index.js";
import { Prisma } from "@prisma/client";
import { ProductNotFoundError } from "../errors/product.error.js";
import {
  CreateProduct,
  GetProduct,
  PrismaProduct,
  PrismaProducts,
} from "../types.js";
import {
  PrismaClientInitializationError,
  PrismaClientRustPanicError,
  PrismaClientUnknownRequestError,
  PrismaClientValidationError,
  PrismaGenericError,
} from "../errors/prisma.error.js";

class ProductRepository implements ProductProvider {
  public getProducts = async (): Promise<PrismaProducts> => {
    try {
      const products: PrismaProducts = await prisma.product.findMany();
      return products;
    } catch (e) {
      if (e instanceof Prisma.PrismaClientKnownRequestError) {
        throw new PrismaGenericError();
      } else if (e instanceof Prisma.PrismaClientUnknownRequestError) {
        throw new PrismaClientUnknownRequestError();
      } else if (e instanceof Prisma.PrismaClientRustPanicError) {
        throw new PrismaClientRustPanicError();
      } else if (e instanceof Prisma.PrismaClientInitializationError) {
        throw new PrismaClientInitializationError();
      } else if (e instanceof Prisma.PrismaClientValidationError) {
        throw new PrismaClientValidationError();
      } else {
        throw new PrismaGenericError();
      }
    }
  };

  public getProductById = async (
    getProduct: GetProduct
  ): Promise<PrismaProduct> => {
    try {
      const product: PrismaProduct | null = await prisma.product.findUnique({
        where: { id: getProduct.params.id },
      });
      if (product === null) {
        throw new ProductNotFoundError();
      }
      return product;
    } catch (e) {
      if (e instanceof Prisma.PrismaClientKnownRequestError) {
        throw new PrismaGenericError();
      } else if (e instanceof Prisma.PrismaClientUnknownRequestError) {
        throw new PrismaClientUnknownRequestError();
      } else if (e instanceof Prisma.PrismaClientRustPanicError) {
        throw new PrismaClientRustPanicError();
      } else if (e instanceof Prisma.PrismaClientInitializationError) {
        throw new PrismaClientInitializationError();
      } else if (e instanceof Prisma.PrismaClientValidationError) {
        throw new PrismaClientValidationError();
      } else if (e instanceof ProductNotFoundError) {
        throw new ProductNotFoundError();
      } else {
        throw new PrismaGenericError();
      }
    }
  };

  public createProduct = async (
    createProduct: CreateProduct
  ): Promise<PrismaProduct> => {
    try {
      const newProduct: PrismaProduct = await prisma.product.create({
        data: {
          title: createProduct.body.title,
          size: createProduct.body.size,
          color: createProduct.body.color,
          description: createProduct.body.description,
          gender: createProduct.body.gender,
          category: createProduct.body.category,
          price: createProduct.body.price,
          imageUrl: createProduct.body.imageUrl,
        },
      });
      return newProduct;
    } catch (e) {
      if (e instanceof Prisma.PrismaClientKnownRequestError) {
        throw new PrismaGenericError();
      } else if (e instanceof Prisma.PrismaClientUnknownRequestError) {
        throw new PrismaClientUnknownRequestError();
      } else if (e instanceof Prisma.PrismaClientRustPanicError) {
        throw new PrismaClientRustPanicError();
      } else if (e instanceof Prisma.PrismaClientInitializationError) {
        throw new PrismaClientInitializationError();
      } else if (e instanceof Prisma.PrismaClientValidationError) {
        throw new PrismaClientValidationError();
      } else {
        throw new PrismaGenericError();
      }
    }
  };

  public deleteProduct = async (
    getProduct: GetProduct
  ): Promise<PrismaProduct> => {
    try {
      const product: PrismaProduct | null = await prisma.product.delete({
        where: { id: getProduct.params.id },
      });
      if (product === null) {
        throw new ProductNotFoundError();
      }
      return product;
    } catch (e) {
      if (e instanceof Prisma.PrismaClientKnownRequestError) {
        throw new PrismaGenericError();
      } else if (e instanceof Prisma.PrismaClientUnknownRequestError) {
        throw new PrismaClientUnknownRequestError();
      } else if (e instanceof Prisma.PrismaClientRustPanicError) {
        throw new PrismaClientRustPanicError();
      } else if (e instanceof Prisma.PrismaClientInitializationError) {
        throw new PrismaClientInitializationError();
      } else if (e instanceof Prisma.PrismaClientValidationError) {
        throw new PrismaClientValidationError();
      } else {
        throw new PrismaGenericError();
      }
    }
  };
}

export default ProductRepository;

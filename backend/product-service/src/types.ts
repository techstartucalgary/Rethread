import { z } from "zod";
import {
  CreateProductSchema,
  GetProductSchema,
} from "./schema/product.schema.js";

export type PrismaProduct = {
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

export type PrismaProducts = PrismaProduct[];

export type CreateProduct = z.infer<typeof CreateProductSchema>["body"];

export type GetProduct = z.infer<typeof GetProductSchema>["params"];

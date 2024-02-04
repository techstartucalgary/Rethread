import { z } from "zod";
import {
  CreateProductSchema,
  GetProductSchema,
} from "./schemas/product.schema.js";
import { ScannerSchema } from "./schemas/scanner.schema.js";

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

export type Tag = {
  material: string;
  percentage: string;
};

export type CreateProduct = z.infer<typeof CreateProductSchema>;

export type GetProduct = z.infer<typeof GetProductSchema>;

export type ScannerRequest = z.infer<typeof ScannerSchema>;

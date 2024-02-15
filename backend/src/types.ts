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

export type CreateProduct = z.infer<typeof CreateProductSchema>["body"];

export type GetProduct = z.infer<typeof GetProductSchema>["params"];

export type ScannerRequest = z.infer<typeof ScannerSchema>["body"];

export const sustainable: Array<string> = ["organic cotton",
"recycled cotton",
"hemp",
"linen",
"bamboo linen",
"cork",
"econyl",
"recycled polyester",
"deadstock",
"lyocell",
"modal",
"bamboo lyocell",
"ecovero",
"piñatex",
"bananatex",
"scoby leather",
"s.cafe",
"brewed protein",
"apple leather",
"woocoa",
"cupro",
"qmilk",
"sheep wool",
"merino wool",
"alpaca wool",
"cashmere",
"camel",
"yak wool",
"vegetable tanned leather",
"down",
"silk"]; //list of sustainable materials. must be lowercase
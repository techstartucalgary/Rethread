import { z } from "zod";

export const CreateProductSchema = z.object({
  body: z.object({
    title: z.string(),
    size: z.string(),
    color: z.string(),
    description: z.string(),
    gender: z.string(),
    category: z.string(),
    price: z.number().nonnegative(),
    imageUrl: z.string().url(),
    url: z.string().url(),
  }),
});

export const GetProductSchema = z.object({
  params: z.object({
    id: z.string().uuid(),
  }),
});

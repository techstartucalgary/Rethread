import { z } from "zod";

export const ScannerSchema = z.object({
  body: z.object({
    imageUrl: z.string().url(),
  }),
});

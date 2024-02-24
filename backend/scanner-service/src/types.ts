import { z } from "zod";
import { ScannerSchema } from "./schema/scanner.schema.js";

export type Tag = {
  material: string;
  percentage: string;
};

export type ScannerRequest = z.infer<typeof ScannerSchema>["body"];

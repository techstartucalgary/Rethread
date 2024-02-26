import { z } from "zod";
import { ScannerSchema } from "./schema/scanner.schema.js";

export type Tag = {
  material: string;
  percentage: string;
};

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
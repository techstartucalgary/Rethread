import supertest from "supertest";
import { app } from "../src/index.js";
import { PrismaClient } from "@prisma/client";

export const http: supertest.SuperAgentTest = supertest.agent(app);
export const prisma = new PrismaClient();

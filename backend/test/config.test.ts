import supertest from "supertest";
import { app } from "../src/index.js";

export const http: supertest.SuperAgentTest = supertest.agent(app);

import dotenv from "dotenv";
dotenv.config();

export const PORT: number = Number(process.env.PORT) || 8080;
export const SESSION_SECRET: string = process.env.SESSION_SECRET || "secret";
export const REDIS_URL: string = process.env.REDIS_URL || "redis";

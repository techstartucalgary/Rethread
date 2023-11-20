import session from "express-session";
import redis from "redis";
import { SESSION_SECRET, REDIS_URL } from "../config/config";
const RedisStore = require("connect-redis")(session);

const redisClient = redis.createClient({
  url: REDIS_URL,
});

export default session({
  store: new RedisStore({ client: redisClient }),
  secret: SESSION_SECRET,
  cookie: {
    secure: process.env.NODE_ENV === "PROD",
    sameSite: process.env.NODE_ENV === "PROD" ? "none" : "lax",
    maxAge:
      process.env.NODE_ENV === "TEST" ? 1000 * 60 * 5 : 1000 * 60 * 60 * 24 * 7,
  },
});

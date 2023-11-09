import express, { Express, Request, Response } from "express";
import { Synthetic } from "../types.js";

const PORT: number = 8888;

export const app: Express = express();

app.use(express.json());

app.get("/health", (req: Request, res: Response) => {
  res.status(200).send("Server is running!");
});

app.post("/algorithm", (req: Request, res: Response) => {
  const testString: String = req.body.prompt;

  if (!testString) {
    res.status(400).send("Please provide a string!");
  }

  const testArray: Array<String> = testString.split(" ");
  let isEcoFriendly: boolean = true;

  for (const element of testArray) {
    const upperCaseElement: String = element.toUpperCase();
    if (Synthetic[upperCaseElement as keyof typeof Synthetic]) {
      isEcoFriendly = false;
      break;
    }
  }

  if (!isEcoFriendly) {
    res.status(200).json("Clothing is not eco-friendly!");
  } else {
    res.status(200).json("Clothing is eco-friendly!");
  }
});

app.listen(PORT, () => {
  console.log(`[INFO]: Server is running at http://localhost:${PORT}/`);
});

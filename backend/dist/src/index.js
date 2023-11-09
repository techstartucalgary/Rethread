import express from "express";
import { Synthetic } from "../types.js";
const PORT = 8888;
export const app = express();
app.use(express.json());
app.get("/health", (req, res) => {
    res.status(200).send("Server is running!");
});
app.post("/algorithm", (req, res) => {
    const testString = req.body.prompt;
    if (!testString) {
        res.status(400).send("Please provide a string!");
    }
    const testArray = testString.split(" ");
    let isEcoFriendly = true;
    for (const element of testArray) {
        const upperCaseElement = element.toUpperCase();
        if (Synthetic[upperCaseElement]) {
            isEcoFriendly = false;
            break;
        }
    }
    if (!isEcoFriendly) {
        res.status(200).json("Clothing is not eco-friendly!");
    }
    else {
        res.status(200).json("Clothing is eco-friendly!");
    }
});
app.listen(PORT, () => {
    console.log(`[INFO]: Server is running at http://localhost:${PORT}/`);
});

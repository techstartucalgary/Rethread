import request from "supertest";
import { assert } from "chai";
import { http } from "./config.test.js";

const testString1: String =
  "80% POLYESTER 20% COTTON WARM WASH DO NOT BLEACH WARM IRON DO NOT DRY CLEAN DO NOT TUMBLE DRY";

const testString2: String =
  "100% COTTON [Symbol for 40°C] GENTLE MACHINE WASH AT 40°C DO NOT BLEACH IRON LOW TUMBLE DRY NORMAL OR LOW HEAT DO NOT DRY-CLEAN WASH AND IRON INSIDE OUT WASH SEPARATEL";

const testString3: String =
  "100% cotton Machine wash cold Tumble dry low Not for use as pants";

describe("Algorithm", () => {
  it("should return eco-friendly clothing", async () => {
    const res: request.Response = await http
      .post("/algorithm")
      .send({ prompt: testString2 });
    assert.equal(res.status, 200);
    assert.equal(res.body, "Clothing is eco-friendly!");
  });

  it("should return not eco-friendly clothing", async () => {
    const res: request.Response = await http
      .post("/algorithm")
      .send({ prompt: testString1 });
    assert.equal(res.status, 200);
    assert.equal(res.body, "Clothing is not eco-friendly!");
  });

  it("should return a BadRequestError", async () => {
    const res: request.Response = await http.post("/algorithm").send({});
    assert.equal(res.status, 400);
    assert.equal(res.body.message, "No string was provided!");
  });
});

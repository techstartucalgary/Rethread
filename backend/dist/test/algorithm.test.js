var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
import { assert } from "chai";
import { http } from "./config.test.js";
const testString1 = "80% POLYESTER 20% COTTON WARM WASH DO NOT BLEACH WARM IRON DO NOT DRY CLEAN DO NOT TUMBLE DRY";
const testString2 = "100% COTTON [Symbol for 40°C] GENTLE MACHINE WASH AT 40°C DO NOT BLEACH IRON LOW TUMBLE DRY NORMAL OR LOW HEAT DO NOT DRY-CLEAN WASH AND IRON INSIDE OUT WASH SEPARATEL";
const testString3 = "100% cotton Machine wash cold Tumble dry low Not for use as pants";
describe("Algorithm", () => {
    it("should return eco-friendly clothing", () => __awaiter(void 0, void 0, void 0, function* () {
        const res = yield http
            .post("/algorithm")
            .send({ prompt: testString2 });
        console.log(res.body);
        assert.equal(res.status, 200);
        assert.equal(res.body, "Clothing is eco-friendly!");
    }));
    it("should return not eco-friendly clothing", () => __awaiter(void 0, void 0, void 0, function* () {
        const res = yield http
            .post("/algorithm")
            .send({ prompt: testString1 });
        assert.equal(res.status, 200);
        assert.equal(res.body, "Clothing is not eco-friendly!");
    }));
});

import request from "supertest";
import { assert } from "chai";
import { http } from "./config.test.js";
var bcrypt = require('bcrypt');
const testUser = {
  email:"Ryan@mail.com",
  password:"$2b$10$5jUD1fhvp1YLSE1FpnEa5eVpOZTOp5wivb6DtvrkeKfIO0/ZTCAqG",
  firstName:"Ryan",
  lastName:"Ryan"
}

describe("Authentication", () => {
  it("Signup should return a 201 status code", async () => {
    const res: request.Response = await http.post("/auth/signup").send({
      email:testUser.email,
      password:testUser.password,
      firstName:testUser.firstName,
      lastName:testUser.lastName
  });
    assert.equal(res.body.email,testUser.email);
    assert.equal(res.body.firstName,testUser.firstName);
    assert.equal(res.body.lastName,testUser.lastName);
    bcrypt.compare("mySecurePassword123", res.body.password, function(err: any, result: boolean) {
      assert(result);
    });
  });
});

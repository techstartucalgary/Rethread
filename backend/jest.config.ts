import type { Config } from "jest";

const config: Config = {
  preset: "ts-jest",
  testEnvironment: "node",
  verbose: true,
  globals: {
    "ts-jest": {
      tsconfig: "tsconfig.json",
    },
  },
  testMatch: ["<rootDir>/dist/**/*.test.js"],
  coverageReporters: ["html"],
  collectCoverage: true,
  collectCoverageFrom: ["<rootDir>/dist/src/**/*.js"],
  coverageDirectory: "<rootDir>/coverage",
};

export default config;

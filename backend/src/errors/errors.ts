export class BadRequestError extends Error {
  constructor(public message: string) {
    super(message);
    this.name = "BadRequestError";
  }
}

export class UnauthorizedError extends Error {
  constructor(public message: string) {
    super(message);
    this.name = "UnauthorizedError";
  }
}

export class ForbiddenError extends Error {
  constructor(public message: string) {
    super(message);
    this.name = "ForbiddenError";
  }
}

export class NotFoundError extends Error {
  constructor(public message: string) {
    super(message);
    this.name = "NotFoundError";
  }
}

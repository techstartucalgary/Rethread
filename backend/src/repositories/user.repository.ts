import { PrismaClient } from "@prisma/client";
import {
  PrismaUserInterface,
  UserInterface,
  UserRepositoryInterface,
} from "../../types.js";

class UserRepository implements UserRepositoryInterface {
  constructor(private prisma: PrismaClient) {}

  async createUser(user: UserInterface): Promise<PrismaUserInterface> {
    const newUser = await this.prisma.user.create({
      data: {
        email: user.getEmail(),
        password: user.getPassword(),
        firstName: user.getFirstName(),
        lastName: user.getLastName(),
      },
    });
    return newUser;
  }

  async getUserByEmail(email: string): Promise<PrismaUserInterface | null> {
    const user = await this.prisma.user.findUnique({
      where: {
        email: email,
      },
    });

    return user;
  }
}

export default UserRepository;

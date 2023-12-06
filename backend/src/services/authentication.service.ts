import { UserRepositoryInterface } from "../../types";
import UserRepository from "../repositories/user.repository";

class AuthenticationService implements AuthenticationService {
  constructor(private UserRepository: UserRepositoryInterface) {}

  async login(): Promise<void> {
    // TODO: Implement login and initialize session (Anfaal)
  }

  async signup(): Promise<void> {
    // TODO: Implement signup and initialize session (Ryan)
  }

  async logout(): Promise<void> {
    req.session.destroy((err) => {
      if (err) {
          return console.log(err);
      }
      res.redirect("/")
      })
    }
  }


export default AuthenticationService;

import { UserRepositoryInterface } from "../../types";
import {User} from "../models/user.model"

class AuthenticationService implements AuthenticationService {
  constructor(private userRepository: UserRepositoryInterface) {}

  async login(): Promise<void> {
    // TODO: Implement login and initialize session (Anfaal)
  }

  async signup(email: string, password:string, firstName:string, lastName:string): Promise<void> {
    // TODO: Implement signup and initialize session (Ryan)
    const newUser = new User(email,password,firstName,lastName)
    this.userRepository.createUser(newUser)
  }

  async logout(): Promise<void> {
    // TODO: Implement logout and destroy session (Alison)
  }
}

export default AuthenticationService;

import { AlgorithmServiceInterface, Synthetic } from "../../types.js";

class AlgorithmService implements AlgorithmServiceInterface {
  isClothingEcoFriendly = async (prompt: string): Promise<boolean> => {
    const testString: string = prompt;

    const testArray: Array<String> = testString.split(" ");
    let isEcoFriendly: boolean = true;

    for (const element of testArray) {
      const upperCaseElement: String = element.toUpperCase();
      if (Synthetic[upperCaseElement as keyof typeof Synthetic]) {
        isEcoFriendly = false;
        break;
      }
    }

    return isEcoFriendly;
  };
}

export default AlgorithmService;

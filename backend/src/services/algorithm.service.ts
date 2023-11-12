import { Synthetic } from "../../types.js";

export function isClothingEcoFriendly(prompt: string): boolean {
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
}

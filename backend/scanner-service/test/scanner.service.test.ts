import ScannerProvider from "../src/abstract/scanner.abstract.js";
import { TesseractServiceError } from "../src/error/tesseract.error.js";
import ScannerService from "../src/service/scanner.service.js";
import { ScannerRequest, Tag } from "../src/types.js";

describe("ScannerService Unit Tests", () => {
  let scannerService: ScannerService;
  let mockScannerProvider: MockScannerProvider;

  beforeAll(() => {
    mockScannerProvider = new MockScannerProvider();
    scannerService = new ScannerService(mockScannerProvider);
  });

  test("Get materials from text", () => {
    const materials: Tag[] = scannerService.getMaterials(
      "90% Cotton 10% Nylon",
    );
    expect(materials).toBeInstanceOf(Array);
    expect(materials).toHaveLength(2);
    expect(materials[0].material).toBe("Cotton");
    expect(materials[0].percentage).toBe("90");
    expect(materials[1].material).toBe("Nylon");
    expect(materials[1].percentage).toBe("10");
  });

  test("Get text from image", async () => {
    const text: string = await scannerService.getTextFromImage({
      imageUrl: "http://example.com/image.jpg",
    });
    expect(text).toBe("text from image");
    expect(text).not.toBe("");
  });

  test("Get text from image with empty URL throws TesseractServiceError", async () => {
    await expect(
      scannerService.getTextFromImage({ imageUrl: "" }),
    ).rejects.toThrow(TesseractServiceError);
  });

  afterAll(() => {
    jest.clearAllMocks();
  });
});

class MockScannerProvider implements ScannerProvider {
  getMaterials(text: string): Tag[] {
    throw new Error("Method not implemented.");
  }

  getTextFromImage(scannerRequest: ScannerRequest): Promise<string> {
    const { imageUrl } = scannerRequest;
    if (!imageUrl) {
      return Promise.reject(new TesseractServiceError());
    }
    return Promise.resolve("text from image");
  }
}

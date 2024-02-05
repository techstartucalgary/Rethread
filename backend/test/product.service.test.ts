import ProductService from "../src/services/product.service.js";

import ProductProvider from "../src/abstracts/product.abstract.js";
import { ProductNotFoundError } from "../src/errors/product.error.js";
import {
  PrismaProduct,
  PrismaProducts,
  CreateProduct,
  GetProduct,
} from "../src/types.js";

describe("ProductService Tests", () => {
  let productService: ProductService;
  let mockProductProvider: MockProductProvider;

  beforeAll(() => {
    mockProductProvider = new MockProductProvider();
    productService = new ProductService(mockProductProvider);
  });

  test("Fetch all products", async () => {
    const products = await productService.getProducts();
    expect(products).toBeInstanceOf(Array);
    expect(products).toHaveLength(1);
    expect(products[0].id).toBe("1");
  });

  test("Fetch a product by ID", async () => {
    const product = await productService.getProductById({ id: "1" });
    expect(product).toHaveProperty("id");
    expect(product.title).toBe("Mock Product 1");
  });

  test("Create a product", async () => {
    const newProduct = await productService.createProduct({
      title: "New Test Product",
      size: "Large",
      color: "Blue",
      description: "A new test product description",
      gender: "Female",
      category: "Test Category",
      price: 50,
      imageUrl: "http://example.com/newproduct.jpg",
    });
    expect(newProduct).toHaveProperty("id");
    expect(newProduct.title).toBe("New Test Product");
  });

  test("Delete a non-existent product", async () => {
    await expect(
      productService.deleteProduct({ id: "non-existent" })
    ).rejects.toThrow(ProductNotFoundError);
  });

  afterAll(() => {
    jest.clearAllMocks();
  });
});

class MockProductProvider implements ProductProvider {
  getProducts(): Promise<PrismaProducts> {
    return Promise.resolve([
      {
        id: "1",
        title: "Mock Product 1",
        size: "Medium",
        color: "Red",
        description: "A mock product for testing",
        gender: "Unisex",
        category: "Mock Category",
        price: 100,
        imageUrl: "http://example.com/mockproduct1.jpg",
        createdAt: new Date(),
        updatedAt: new Date(),
      },
    ]);
  }

  getProductById(getProduct: GetProduct): Promise<PrismaProduct> {
    if (getProduct.id === "1") {
      return Promise.resolve({
        id: "1",
        title: "Mock Product 1",
        size: "Medium",
        color: "Red",
        description: "A mock product for testing",
        gender: "Unisex",
        category: "Mock Category",
        price: 100,
        imageUrl: "http://example.com/mockproduct1.jpg",
        createdAt: new Date(),
        updatedAt: new Date(),
      });
    } else {
      return Promise.reject(new ProductNotFoundError());
    }
  }

  createProduct(createProduct: CreateProduct): Promise<PrismaProduct> {
    return Promise.resolve({
      id: "2",
      title: createProduct.title,
      size: createProduct.size,
      color: createProduct.color,
      description: createProduct.description,
      gender: createProduct.gender,
      category: createProduct.category,
      price: createProduct.price,
      imageUrl: createProduct.imageUrl,
      createdAt: new Date(),
      updatedAt: new Date(),
    });
  }

  deleteProduct(getProduct: GetProduct): Promise<PrismaProduct> {
    if (getProduct.id === "1") {
      return Promise.resolve({
        id: "1",
        title: "test",
        size: "test",
        color: "test",
        description: "test",
        gender: "test",
        category: "test",
        price: 1,
        imageUrl: "test",
        createdAt: new Date(),
        updatedAt: new Date(),
      });
    } else {
      return Promise.reject(new ProductNotFoundError());
    }
  }
}

export default MockProductProvider;

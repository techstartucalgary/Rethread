// FilterModel.swift

import Foundation

struct ClothingItem: Identifiable {
    let id = UUID()
    var name: String
    var type: ClothingType
    var color: String
    var price: Int
    var imageName: String
}

enum ClothingType: String, CaseIterable {
    case pants = "Pants"
    case tShirt = "T-Shirt"
    case jacket = "Jacket"
}

var allItems: [ClothingItem] = [
    // Populate with your actual clothing items
    ClothingItem(name: "1/4 zip fleece", type: .jacket, color: "Red", price: Int(100), imageName: "patagoniaQuar"),
    // Add more items...
]

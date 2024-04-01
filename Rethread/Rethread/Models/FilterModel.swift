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


var ArcteryxItems: [ClothingItem] = [
    // Populate with your actual clothing items
    ClothingItem(name: "Beta Jacket".uppercased(), type: .jacket, color: "Red", price: Int(500), imageName: "BETAJACKETMENS"),
    ClothingItem(name: "Trevon Pants".uppercased(), type: .pants, color: "Red", price: Int(160), imageName: "arcPants"),
    ClothingItem(name: "Ionia Logo Shirt SS".uppercased(), type: .tShirt, color: "Red", price: Int(80), imageName: "arcShirt"),
    ClothingItem(name: "BETA AR JACKET", type: .jacket, color: "Blue", price: Int(170), imageName: "arc_1"),
    ClothingItem(name: "BETA AR JACKET ", type: .jacket, color: "Red", price: Int(750), imageName: "arc_3"),
    ClothingItem(name: "SABRE INSULATED JACKET", type: .jacket, color: "Blue", price: Int(1000), imageName: "arc_1"),
    ClothingItem(name: "CORMAC POLO SHIRT", type: .tShirt, color: "Blue", price: Int(140), imageName: "arc_4"),
    ClothingItem(name: "KYANITE LW JACKET", type: .jacket, color: "Blue", price: Int(170), imageName: "arc_5"),
    ClothingItem(name: "BETA AR JACKET ", type: .jacket, color: "Red", price: Int(750), imageName: "arc_1"),



]

// FilterModel.swift

import Foundation

struct ClothingItem: Identifiable {
    let id = UUID()
    var name: String
    var type: ClothingType
    var color: String
    var price: Int
    var imageName: String
    var style: ClothingStyle
}

enum ClothingType: String, CaseIterable {
    case pants = "Pants"
    case tShirt = "T-Shirt"
    case jacket = "Jacket"

}

enum ClothingStyle: String, CaseIterable {
    case active = "Active"
    case classic = "Classic"
    case casual = "Casual"
}

var allItems: [ClothingItem] = [
    // Populate with your actual clothing items
    ClothingItem(name: "1/4 zip fleece", type: .jacket, color: "Red", price: Int(100), imageName: "patagoniaQuar", style: .active),
    // Add more items...
]


var ArcteryxItems: [ClothingItem] = [
    // Populate with your actual clothing items
    ClothingItem(name: "Beta Jacket".uppercased(), type: .jacket, color: "Red", price: Int(500), imageName: "BETAJACKETMENS", style: .active),
    ClothingItem(name: "Trevon Pants".uppercased(), type: .pants, color: "Red", price: Int(160), imageName: "arcPants", style: .classic),
    ClothingItem(name: "Ionia Logo Shirt SS".uppercased(), type: .tShirt, color: "Red", price: Int(80), imageName: "arcShirt", style: .casual),
    ClothingItem(name: "BETA AR JACKET", type: .jacket, color: "Blue", price: Int(170), imageName: "arc_1", style: .casual),
    ClothingItem(name: "BETA AR JACKET ", type: .jacket, color: "Red", price: Int(750), imageName: "arc_3", style: .active),
    ClothingItem(name: "SABRE INSULATED JACKET", type: .jacket, color: "Blue", price: Int(1000), imageName: "arc_1", style: .classic),
    ClothingItem(name: "CORMAC POLO SHIRT", type: .tShirt, color: "Blue", price: Int(140), imageName: "arc_4", style: .active),
    ClothingItem(name: "KYANITE LW JACKET", type: .jacket, color: "Blue", price: Int(170), imageName: "arc_5", style: .active),
    ClothingItem(name: "BETA AR JACKET ", type: .jacket, color: "Red", price: Int(750), imageName: "arc_1", style: .active),



]

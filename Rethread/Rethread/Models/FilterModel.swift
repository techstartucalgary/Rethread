// FilterModel.swift

import Foundation
import SwiftUI

struct ClothingItem: Identifiable {
    let id = UUID()
    var name: String
    var type: ClothingType
    var color: String
    var price: Int
    var imageName: String
    var style: ClothingStyle
    var productLink: String?
    var description: String?
}

enum ClothingType: String, CaseIterable {
    case acessories = "Extras"
    case tops = "Tops"
    case bottoms = "Bottoms"
    case Shoes = "Shoes"
}

enum ClothingStyle: String, CaseIterable {
    case active = "Active"
    case classic = "Classic"
    case casual = "Casual"
}

//var allItems: [ClothingItem] = [
//    
//]


var ArcteryxItems: [ClothingItem] = [
    // Populate with your actual clothing items
    ClothingItem(name: "Beta Jacket".capitalized, type: .tops, color: "Red", price: Int(500), imageName: "https://images.arcteryx.com/S24/1350x1710/Beta-Jacket-Black.jpg", style: .active),
    ClothingItem(name: "Trevon Pants".capitalized, type: .bottoms, color: "Red", price: Int(160), imageName: "https://images.arcteryx.com/S23/1350x1710/Levon-Pant-Serene.jpg", style: .classic),
    ClothingItem(name: "Ionia Logo Shirt SS".capitalized, type: .tops, color: "Red", price: Int(80), imageName: "https://images.arcteryx.com/F23/1350x1710/Ionia-Merino-Wool-Logo-Shirt-SS-Bordeaux.jpg", style: .casual),
    ClothingItem(name: "BETA AR JACKET".capitalized, type: .bottoms, color: "Blue", price: Int(750), imageName: "https://images.arcteryx.com/S24/1350x1710/Beta-AR-Jacket-Forage-Tatsu.jpg", style: .casual),
    ClothingItem(name: "Squamish Hoody".capitalized, type: .tops, color: "Red", price: Int(220), imageName: "https://images.arcteryx.com/F23/1350x1710/Squamish-Hoody-Pytheas.jpg", style: .active),
    ClothingItem(name: "SABRE INSULATED JACKET".capitalized, type: .tops, color: "Blue", price: Int(1000), imageName: "https://images.arcteryx.com/F23/1350x1710/Sabre-Jacket-Black-Sapphire.jpg", style: .classic),
    ClothingItem(name: "CORMAC POLO SHIRT".capitalized, type: .tops, color: "Blue", price: Int(140), imageName: "https://images.arcteryx.com/F23/1350x1710/Sabre-Jacket-Black-Sapphire.jpg", style: .active),
    ClothingItem(name: "KYANITE LW JACKET".capitalized, type: .tops, color: "Blue", price: Int(180), imageName: "https://images.arcteryx.com/S24/1350x1710/Kyanite-LT-Hoody-W-Velocity.jpg", style: .active),
    ClothingItem(name: "BETA AR JACKET ".capitalized, type: .tops, color: "Red", price: Int(750), imageName: "arc_1", style: .active),
]

var recommendedItems: [ClothingItem] = [
    ClothingItem(name: "Skomer 24 WS", type: .tops, color: "Blue", price: 200, imageName: "https://static.vaude.ca/wp-content/uploads/2024/02/15829_3660.jpg", style: .active, productLink: "https://www.vaude.ca/en/product/skomer-24-ws/"),
    ClothingItem(name: "Cotopaxi Do Good", type: .tops, color: "Blue", price: 120, imageName: "https://media-www.atmosphere.ca/product/div-03-softgoods/dpt-72-casual-clothing/sdpt-01-mens/334180318/cotopaxi-m-do-good-hoodie-823-heather-grey-e075593d-4104-47fa-ade6-f77e4be324d8-jpgrendition.jpg?imdensity=1&imwidth=1244&impolicy=gZoom", style: .active, productLink: "https://www.sportchek.ca/en/pdp/cotopaxi-men-s-do-good-hoodie-78270300f.334180318.html?gad_source=1&gclid=Cj0KCQjw_qexBhCoARIsAFgBletUWEClNQ4iKY1tzIwgQ6K135Xs0pZjiCzDPeDgTYcyUnt_qGDjzOwaAiWNEALw_wcB&gclsrc=aw.ds")
]

//
//  MediaModel.swift
//  InstReels
//
//

import Foundation

struct Media: Identifiable {
    var id = UUID().uuidString
    var url: String
    var title: String
    var isExpanded = false
    var vidType: VideoType
}

enum VideoType: String, CaseIterable {
    case all = "All"
    case active = "Active"
    case classic = "Classic"
    case casual = "Casual"
}

extension Media {
    static var previews: [Self] {
        [
            Media(url: "sus1", title: "Shop Sustianable", vidType: .casual),
            Media(url: "sus2", title: "ReThread rocks!", vidType: .casual),
            Media(url: "Reel4", title: "How to buy sustainable fashaion", vidType: .classic),
            Media(url: "sus3", title: "Become a programmer without a degree", vidType: .active)
        ]
    }
}

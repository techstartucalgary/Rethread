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
            Media(url: "https://www.youtube.com/shorts/1mhqy38JeN4", title: "I love Sustainable fashion", vidType: .casual),
            Media(url: "Reel3", title: "ReThread rocks!", vidType: .classic),
            Media(url: "Reel4", title: "How to buy sustainable fashaion", vidType: .active),
            Media(url: "Reel5", title: "Become a programmer without a degree", vidType: .active)
        ]
    }
}

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
}

extension Media {
    static var previews: [Self] {
        [
            Media(url: "Reel2", title: "I love Sustainable fashion"),
            Media(url: "Reel3", title: "ReThread rocks!"),
            Media(url: "Reel4", title: "How to buy sustainable fashaion"),
            Media(url: "Reel5", title: "Become a programmer without a degree")
        ]
    }
}

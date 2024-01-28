import Foundation


struct User: Identifiable, Codable {
    let id: String
    let firstname: String
    let lastname: String
    let email: String
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, firstname: "Parsa", lastname: "Kargari", email: "parsakargari3@gmail.com")
}

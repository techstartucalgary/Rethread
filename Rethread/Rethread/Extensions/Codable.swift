// Codable.swift

import Foundation

public protocol StorageCodable: Codable, RawRepresentable {}

extension StorageCodable {
    init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8), let result = try? JSONDecoder().decode(Self.self, from: data) else { return nil }
        self = result
    }

    var rawValue: String {
        guard let data = try? JSONEncoder().encode(self), let result = String(data: data, encoding: .utf8) else { return "" }
        return result
    }
}

extension Profile: StorageCodable {

}

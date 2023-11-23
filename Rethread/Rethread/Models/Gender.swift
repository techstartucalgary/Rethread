// Gender.swift

import Foundation

enum Gender: CaseIterable, Codable, Identifiable, Hashable {
    case male, female, nonbinary, other
    var id: Self {
        self
    }
    var displayString: String {
        switch self {
        case .male:
            "🧍‍♂️Male"
        case .female:
            "🧍‍♀️Female"
        case .nonbinary:
            "🧍Non-Binary"
        case .other:
            "❓Other"
        }
    }
}

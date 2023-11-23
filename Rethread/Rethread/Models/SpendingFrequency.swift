// SpendingFrequency.swift

import Foundation

enum SpendingFrequency: CaseIterable, Codable, Identifiable, Hashable {
    case leastspending, secondleastspending, thirstleastspending, fourthleastspending, mostspending
    var id: Self {
        self
    }

    var spendingDisplayString: String {
        switch self {

        case .leastspending:
            "😞💰 $0 - $100"
        case .secondleastspending:
            "🥺 $100 - $300"
        case .thirstleastspending:
            "🤷‍♂️💸 $300 - $500"
        case .fourthleastspending:
            "💸 $500 - $800"
        case .mostspending:
            "👑 $800+"
        }
    }
}

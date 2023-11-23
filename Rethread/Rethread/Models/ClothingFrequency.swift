// ClothingFrequency.swift

import Foundation

enum ClothingFrequency: CaseIterable, Codable, Identifiable, Hashable {
    case leastfreq, secondleastfreq, thirdleastfreq, fourthleastfreq, mostfreq
    var id: Self {
        self
    }
    var clothingFreqDispalyString: String {
        switch self {
        case .leastfreq:
            "💤 1-3 times a year"
        case .secondleastfreq:
            "🤏 Every 2-3 months"
        case .thirdleastfreq:
            "🔄 1-2 times a month"
        case .fourthleastfreq:
            "💅 3-4 times a month"
        case .mostfreq:
            "🛍️ 5+ times a month"
        }
    }
}



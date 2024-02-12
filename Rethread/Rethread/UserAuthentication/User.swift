import Foundation


struct User: Identifiable, Codable {
    let id: String
    let firstname: String
    let lastname: String
    let email: String
    let dateOfBirth: String
    let gender: String
    let phoneNumber: String
    let postalCode: String
    let onboardingComplete: Bool
}

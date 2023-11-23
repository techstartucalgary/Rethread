// OnboardingButtonStyle.swift

import SwiftUI

struct OnboardingButtonStyle: PrimitiveButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(role: configuration.role) {
            configuration.trigger()
        } label: {
            configuration.label
                .font(.title.weight(.medium))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 6)
                .clipShape(.rect(cornerRadius: 10))
        }
        .buttonStyle(.borderedProminent)
    }
}

extension PrimitiveButtonStyle where Self == OnboardingButtonStyle {
    static var onboarding: Self {
        .init()
    }
}

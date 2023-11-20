// IntroView.swift

import SwiftUI

struct IntroView: View {

    @AppStorage("signed_in") var currentUserSignedIn: Bool = false

    var body: some View {
        ZStack {
            RadialGradient (colors: [Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)),Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))], center: .topLeading, startRadius: 5, endRadius: 500)
                .ignoresSafeArea()

            if currentUserSignedIn {
                ProfileView()
            }
            else {
                OnboardingView()
            }
        }
    }
}

#Preview {
    IntroView()
}

// IntroView.swift

import SwiftUI

struct IntroView: View {
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false

    var body: some View {
        ZStack {
            // Your existing radial gradient
            if currentUserSignedIn {
                // Do Nothing for now
            } else {
                OnboardingView() // This will be your custom view for onboarding
            }
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}


#Preview {
    IntroView()
}

import SwiftUI

struct IntroView: View {
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
//    init() {
//        UserDefaults.standard.set(false, forKey: "signed_in")
//        print("Current user signed in: \(currentUserSignedIn)")
//        }

    var body: some View {
        ZStack {
            if currentUserSignedIn {
                // Display main content
                OnboardingView()
            } else {
                // Display the LoginSignupView
                LoginSignupView(currentUserSignedIn: $currentUserSignedIn)
            }
        }
    }
}


#Preview {
    IntroView()
}

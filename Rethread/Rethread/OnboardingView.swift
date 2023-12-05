import SwiftUI

struct OnboardingView: View {
    @State private var currentScreenIndex = 0

    var body: some View {
        VStack {
            if currentScreenIndex == 0 {
                WelcomeView(action: goToNextScreen)
            } else if currentScreenIndex == 1 {
                QuestionView(question: "Q1", options: ["Option 1", "Option 2", "Option 3", "Option 4"], action: goToNextScreen)
            } else if currentScreenIndex == 2 {
                QuestionView(question: "Q2", options: ["Option 1", "Option 2", "Option 3", "Option 4"], action: goToNextScreen)
            } else {
                FinalView(action: finishOnboarding)
            }
        }
        .transition(.slide)
    }
    
    func goToNextScreen() {
        withAnimation {
            currentScreenIndex += 1
        }
    }
    
    func finishOnboarding() {
        // Code to finish onboarding and update @AppStorage value
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

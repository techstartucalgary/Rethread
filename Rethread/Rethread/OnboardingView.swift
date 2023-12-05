import SwiftUI

struct OnboardingView: View {
    // # Of pages
    var numberOfPages = 4
    @State private var currentScreenIndex = 0

    var body: some View {
        VStack {
            if currentScreenIndex == 0 {
                WelcomeView(action: goToNextScreen)
            } else if currentScreenIndex == 1 {
                QuestionView(
                    question: "Who penned this timeless wisdom: 'You were born with wings, why prefer to crawl through life?'",
                    options: ["Kahlil Gibran", "Rumi", "Hafez", "Shakespeare"],
                    isLastPage: false, 
                    action: goToNextScreen, 
                    previousAction: goToPreviousScreen
                )
            } else if currentScreenIndex == 2 {
                QuestionView(
                    question: "Identify the author of this quote: 'The only impossible journey is the one you never begin.'",
                    options: ["Tony Robbins", "Neil Armstrong", "Mark Twain", "J.R.R. Tolkien"],
                    isLastPage: false, 
                    action: goToNextScreen, 
                    previousAction: goToPreviousScreen
                )
            } else {
                QuestionView(
                    question: "Determine who said: 'Out beyond ideas of wrongdoing and rightdoing, there is a field. I'll meet you there.'",
                    options: ["Rumi", "Oscar Wilde", "Emily Dickinson", "Pablo Neruda"],
                    isLastPage: true, 
                    action: goToNextScreen, 
                    previousAction: goToPreviousScreen
                )
            }
        }
        .transition(.slide)
    }

    func goToPreviousScreen() {
        withAnimation {
            if currentScreenIndex > 0 {
                currentScreenIndex -= 1
            }
        }
    }
    
    func goToNextScreen() {
        withAnimation {
            if currentScreenIndex < numberOfPages - 1 {
                currentScreenIndex += 1
            } else {
                // finishOnboarding()
            }
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

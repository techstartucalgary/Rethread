import SwiftUI

struct OnboardingView: View {
    // # Of pages
    var numberOfPages = 4
    @State private var currentScreenIndex = 0
    @State private var answers: [[String]] = Array(repeating: [], count: 3)

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
                    previousAction: goToPreviousScreen,
                    selectedAnswers: $answers[currentScreenIndex - 1] 
                )
            } else if currentScreenIndex == 2 {
                QuestionView(
                    question: "Identify the author of this quote: 'The only impossible journey is the one you never begin.'",
                    options: ["Tony Robbins", "Neil Armstrong", "Mark Twain", "J.R.R. Tolkien"],
                    isLastPage: false, 
                    action: goToNextScreen, 
                    previousAction: goToPreviousScreen,
                    selectedAnswers: $answers[currentScreenIndex - 1]
                )
            } else {
                QuestionView(
                    question: "Determine who said: 'Out beyond ideas of wrongdoing and rightdoing, there is a field. I'll meet you there.'",
                    options: ["Rumi", "Oscar Wilde", "Emily Dickinson", "Pablo Neruda"],
                    isLastPage: true, 
                    action: goToNextScreen,
                    previousAction: goToPreviousScreen,
                    selectedAnswers: $answers[currentScreenIndex - 1]
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
                finishOnboarding()
            }
        }
    }
    
    func finishOnboarding() {
        sendAnswersToBackend(answers)
        answers.removeAll()
        
        // Navigate somewhere. Possibly home screen?
    }
    
    func sendAnswersToBackend(_ answers: [[String]]) {
        // Implement the network request logic here
        print("Sending answers to backend:", answers)
    }

}

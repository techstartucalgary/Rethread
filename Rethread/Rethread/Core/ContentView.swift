import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.currentUser?.onboardingComplete != true{
                WelcomeView()
            } else if viewModel.userSession != nil {
                // Send to logged in view
            } else {
                MainView()
            }
        }
    }
}

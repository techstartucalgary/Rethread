import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    var body: some View {
        Group {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else {
                if viewModel.currentUser?.onboardingComplete == false {
                    WelcomeView()
                } else if viewModel.userSession != nil {
                    HomeView()
                } else {
                    MainView()
                }
            }
        }
    }
}

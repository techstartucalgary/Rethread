import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    var body: some View {
        if viewModel.isLoading {
            ProgressView("Loading...")
        } else if viewModel.currentUser?.onboardingComplete == false {
            WelcomeView()
        } else if viewModel.userSession != nil {
            MainView().environmentObject(self.viewModel)
        } else {
            AuthenticationView()
        }
    }
}

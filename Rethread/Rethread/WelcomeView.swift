import SwiftUI
import AVKit

struct WelcomeView: View {
    @State private var showOnboarding = false
    @State private var player = AVPlayer()
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            PlayerView()
                .edgesIgnoringSafeArea(.all)
                .padding(.bottom, 290)

            
            Spacer()
            
            VStack(alignment: .center, spacing: 40.0) {
                
                Text("Hi, " + (viewModel.currentUser?.firstname ?? "User") + "!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .padding(.top, 20)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                
                Button("Get Started", action: {
                    withAnimation {
                        showOnboarding.toggle()
                    }
                    })
                    .buttonStyle(PrimaryButtonStyle(width: 200, height: 20))
                    .padding(.bottom, 40.0)
                    .padding(.top)
                
            }
            .frame(maxWidth: .infinity)
            .background(Color.white) // Apply background and corner radius
            .cornerRadius(15) // Adjust the corner radius as needed

        }
        .fullScreenCover(isPresented: $showOnboarding) {
            OnboardingView()
        }
        .edgesIgnoringSafeArea(.all) // This will extend the content to the edges
        .background(Color(UIColor.systemGray6))
        .navigationBarBackButtonHidden(true)
        .overlay(
            GeometryReader { geometry in
                Color.white.opacity(0.65) // Adjust the opacity here for semi-transparency
                    .frame(width: geometry.size.width, height: geometry.safeAreaInsets.top)
                    .edgesIgnoringSafeArea(.top)
            }, alignment: .top
        )
    }
}

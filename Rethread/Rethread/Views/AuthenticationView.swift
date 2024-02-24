import SwiftUI
import NavigationTransitions

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct AuthenticationView: View {
    @State private var path: [String] = []

    var body: some View {
        NavigationStack (path: $path) {
            ZStack (alignment: .bottom) {
                // Add Image
                Image("flowerMainPage")
                    .resizable()
                    .overlay(Color.black.opacity(0.1))
                    .clipped()
                    .edgesIgnoringSafeArea(.all)
                    .padding(.bottom, 220)

                // Botom Part
                VStack (spacing: 50) {
                    
                    HStack {
                        Text("Get involved with" + "\n" + "sustainable fashion")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.primaryDark)
                            .opacity(0.5)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(6)
                        Spacer()
                    }
                    .padding(.horizontal, 35)
                    .padding(.top, 25)
                    
                   
                    
                    VStack (spacing: 17) {
                        Button(action: {
                            path.append("SignInView")
                        }) {
                            HStack {
                                Text("Log In")
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                        .buttonStyle(PrimaryButtonStyle(width: 300))
                        
                        HStack {
                            Spacer()
                            
                            Button(action: {
                                path.append("SignUpView")
                            }) {
                                Text("Create Account")
                                    .foregroundColor(Color.primaryDark)
                                    .fontWeight(.semibold)
                                    .underline()
                            }
                        }
                        .padding(.horizontal, 35)
                    }
                    .navigationDestination(for: String.self) { view in
                        if view == "SignInView" {
                            SignInView(path: $path)
                        } else if view == "SignUpView" {
                            SignUpView(path: $path)
                        } else if view == "WelcomeView" {
                            WelcomeView()
                        }
                    }
                }
                .background(RoundedCorners(
                    color: .white,
                    tl: 20,
                    tr: 20
                ))
                .frame(height: 270)
            }
            .frame(maxHeight: .infinity)
        }
        .navigationTransition(.slide(axis: .vertical))
        // Safe area for iPhone X and above
        .edgesIgnoringSafeArea(.all) // This will extend the content to the edges
        .background(Color(UIColor.systemGray6))
        .overlay(
            GeometryReader { geometry in
                Color.white.opacity(0.3) // Adjust the opacity here for semi-transparency
                    .frame(width: geometry.size.width, height: geometry.safeAreaInsets.top)
                    .edgesIgnoringSafeArea(.top)
            }, alignment: .top
        )
    }
}

#Preview {
    AuthenticationView()
}


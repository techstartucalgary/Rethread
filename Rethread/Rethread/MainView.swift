import SwiftUI
import NavigationTransitions

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct MainView: View {
    @AppStorage("isLoggedIn") var isLoggedIn = false
    @State private var path: [String] = []

    var body: some View {
        NavigationStack (path: $path) {
            VStack {
                Spacer()

                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.gray)
                    .padding(.bottom,20)
                    .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)

                // Description text
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit purus sit amet luctus venenatis, lectus magna fringilla urna.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 25)
                    .padding(.bottom, 55)


                HStack(spacing: 30) {
                    // Log In Button
                    Button(action: {
                        path.append("SignInView")
                    }) {
                        HStack {
                            Text("Log In")
                            Image(systemName: "arrow.right.circle")
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(PrimaryButtonStyle())

                    // Sign Up Button
                    Button(action: {
                        path.append("SignUpView")
                    }) {
                        HStack {
                            Text("Join Us")
                            Image(systemName: "person.crop.circle.badge.plus")
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(SecondaryButtonStyle())
                }
                .padding(.horizontal)
                .padding(.bottom, 15)
                .navigationDestination(for: String.self) { view in
                    if view == "SignInView" {
                        SignInView(path: $path)
                    } else if view == "SignUpView" {
                        SignUpView(path: $path)
                    } else if view == "WelcomeView" {
                        WelcomeView(path: $path)
                    }
                }
            }
            .frame(maxHeight: .infinity)
            .onAppear() {
                if isLoggedIn {
                    
                    // Get user data from database and store in userDefaults
                    // We want to check if the user has onboarding completed or not
                    // If not, we want to show the onboarding view
                    
                    // If logged in, and onboarding is not completed, show onboarding
                }
            }
        }
        .navigationTransition(.slide(axis: .vertical))
        // Safe area for iPhone X and above
        .safeAreaInset(edge: .top, alignment: .center, spacing: 0) {
            Color.clear
                .frame(height: 0)
                .background(Material.bar)
        }
        
    }
}

struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String

    var body: some View {
        TextField(placeholder, text: $text)
            .foregroundColor(Color.primaryTextColor)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            .zIndex(-1)
    }
        
}

#if DEBUG
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
#endif


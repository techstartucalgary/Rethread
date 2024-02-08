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
    @State private var path: [String] = []

    var body: some View {
        NavigationStack (path: $path) {
            ZStack (alignment: .bottom) {
                // Add Image
                Image("starSky")
                    .resizable()
                    .overlay(Color.black.opacity(0.01))
                    .clipped()
                    .edgesIgnoringSafeArea(.all)
                    .padding(.bottom, 210)

                // Description text
                VStack {
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit purus sit amet luctus venenatis, lectus magna fringilla urna.")
                        .font(.body)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 25)
                        .padding(.bottom, 55)
                        .padding(.top, 35)
                    
                    
                    
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
                            WelcomeView()
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .background(Color.white) // Background for text readability
                .cornerRadius(20)
                .edgesIgnoringSafeArea(.bottom)
            }
            .frame(maxHeight: .infinity)
        }
        .navigationTransition(.slide(axis: .vertical))
        // Safe area for iPhone X and above
        .edgesIgnoringSafeArea(.all) // This will extend the content to the edges
        .background(Color(UIColor.systemGray6))
        .overlay(
            GeometryReader { geometry in
                Color.white.opacity(0.65) // Adjust the opacity here for semi-transparency
                    .frame(width: geometry.size.width, height: geometry.safeAreaInsets.top)
                    .edgesIgnoringSafeArea(.top)
            }, alignment: .top
        )
    }
}

struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String
    var disableAutocorrection: Bool = false

    var body: some View {
        TextField(placeholder, text: $text)
            .disableAutocorrection(disableAutocorrection)
            .autocapitalization(disableAutocorrection ? .none : .sentences)
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


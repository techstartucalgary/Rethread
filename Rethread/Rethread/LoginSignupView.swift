import SwiftUI

struct LoginSignupView: View {
    @Binding var currentUserSignedIn: Bool
    @State private var showingSignIn = false
    // ... other properties and logic

    var body: some View {
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
                    showingSignIn = true
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
                    // Sign up
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

        }
        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .fullScreenCover(isPresented: $showingSignIn) {
            SignInView(currentUserSignedIn: $currentUserSignedIn)
        }
    }
}

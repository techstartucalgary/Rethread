import SwiftUI

struct LoginSignupView: View {
    @Binding var currentUserSignedIn: Bool
    // ... other properties and logic

    var body: some View {
        VStack {
            Spacer()

            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 450)
                .padding(.bottom,20)
                .foregroundColor(.gray)

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
                    // Logic to show login screen
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
                    // Logic to show signup screen
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
    }
}


#if DEBUG
struct LoginSignupView_Previews: PreviewProvider {
    static var previews: some View {
        LoginSignupView(currentUserSignedIn: .constant(false))
    }
}
#endif

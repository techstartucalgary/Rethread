import SwiftUI

struct VerificationView: View {
    // Sign in or Sign up verification?
    @State var isSignIn: Bool
    @Binding var path: [String]
    @Environment(\.dismiss) private var dismiss
    @State private var code: [String] = ["", "", "", ""]
    @FocusState private var focusedField: Field?
    
    enum Field: Int, Hashable {
        case field1 = 0, field2, field3, field4

        var next: Field? {
            return Field(rawValue: self.rawValue + 1)
        }
    }

    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                    }
                    .buttonStyle(SecondaryButtonStyle(width: 15, height: 15))
                    .clipShape(Circle())
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 40)
                .padding(.bottom, 20)

                Text("Verify your account")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal, 25)
                    .padding(.bottom, 1)
                    .foregroundColor(Color.primaryColor)

                HStack (spacing: 0) {
                    Text("Enter the 4-digit PIN code sent to your email address xxx@example.com.")
                        .fontWeight(.medium)
                        .foregroundColor(Color.primaryColor)
                    Spacer()
                }
                .padding(.horizontal, 25)
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 10) {
                        ForEach(0..<4, id: \.self) { index in
                            TextField("", text: $code[index])
                                .frame(width: 45, height: 45)
                                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.primary, lineWidth: 1))
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                                .focused($focusedField, equals: Field(rawValue: index))
                                .onChange(of: code[index]) { newValue in
                                    if newValue.count == 1 {
                                        // A character is entered in the current field
                                        if index < code.count - 1 {
                                            // Move to the next field only if it's not the last one
                                            focusedField = Field(rawValue: index + 1)
                                        } else {
                                            // Last field - perhaps perform some action or unfocus
                                            focusedField = nil
                                        }
                                    } else if newValue.isEmpty && index > 0 {
                                        // Backspace is pressed, and it's not the first field
                                        // Move to the previous field
                                        focusedField = Field(rawValue: index - 1)
                                    }
                                }



                        }
                    }
                    .padding(.horizontal, 25)
                    .padding(.top, 30)
                    
                }
                Spacer()
            }

            // Bottom content, including the sign-in button
            VStack (spacing: 16) {
                Button("Verify") {
                    // Handle sign in
                    if isSignIn {
                        // Sign in
                        print("Sign in")
                    } else {
                        withAnimation {
                            dismiss()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                path.append("WelcomeView")
                            }
                        }
                    }
                }
                .buttonStyle(PrimaryButtonStyle(width: 300))
                
                Button(action: {
                    // Handle request new code
                }) {
                    Text("Request new code")
                        .foregroundColor(Color.primaryColor)
                        .fontWeight(.semibold)
                        .underline() // Underlined text
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom) // Aligns buttons to the bottom
        }
        .onTapGesture {
        self.hideKeyboard()
        }
        
    }
}



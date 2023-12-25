import SwiftUI

struct VerificationView: View {
    @Binding var currentUserSignedIn: Bool
    @Environment(\.presentationMode) var presentationMode
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
                        presentationMode.wrappedValue.dismiss()
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
                                .onChange(of: code[index]) { newValue, oldValue in
                                    if newValue.count > 0 { // If a character is entered
                                        if let nextField = focusedField?.next, index < code.count - 1 {
                                            // If it's not the last field, move to the next field
                                            self.focusedField = nextField
                                        } else {
                                            // If it's the last field, unfocus
                                            focusedField = nil
                                        }
                                    } else { // If backspace is pressed
                                        if let previousField = focusedField?.rawValue, index > 0 {
                                            // If it's not the first field, move to the previous field
                                            self.focusedField = Field(rawValue: previousField - 1)
                                        }
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
                    // Go to the home screen, set currentUserSignedIn to true
                    currentUserSignedIn = true
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

#if DEBUG
struct Verification_Preview: PreviewProvider {
    static var previews: some View {
        VerificationView(currentUserSignedIn: .constant(false))
    }
}
#endif


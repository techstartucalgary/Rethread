import SwiftUI

struct VerificationView: View {
    @State var isSignIn: Bool
    @Binding var path: [String]
    var formData: SignUpFormData?
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    // OTP Info
    @State var otpFields: [String] = Array(repeating: "", count: 6)
    @State var otpText: String = ""
    
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
                    Text("Enter the 6-digit PIN code sent to your phone number " + (formData?.phoneNumber ?? ""))
                        .fontWeight(.medium)
                        .foregroundColor(Color.primaryColor)
                    Spacer()
                }
                .padding(.horizontal, 25)
                
                
                Verification(otpFields: $otpFields, otpText: otpText)
                    .padding(.horizontal, 10)
                
                
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
                        // Confirm OTP. If successful, create user.
                        let otpCode = otpFields.joined()
                        Task {
                            do {
                                if let formData = formData {
                                    try await viewModel.createUser(formData: formData)
                                }
                            } catch {
                                print("DEBUG: Error verifying code: \(error.localizedDescription)")
                            }
                        }


                        dismiss()
                    }
                }
                .buttonStyle(PrimaryButtonStyle(width: 300, isDisabled: checkStates()))
                .disabled(checkStates())
                                
                                
                Button(action: {
                    if let phoneNumber = formData?.phoneNumber {
                        Task {

                        }
                    }
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
    
    func checkStates()->Bool {
        for index in 0..<6 {
            if otpFields[index].isEmpty { return true }
        }
        
        return false
    }
}

#if DEBUG
struct VerificationView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView(isSignIn: false, path: .constant([""]), formData: nil)
    }
}

#endif



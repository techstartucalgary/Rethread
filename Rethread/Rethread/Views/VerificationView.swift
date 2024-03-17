import SwiftUI

struct VerificationView: View {
    @State var isSignIn: Bool
    @Binding var path: [String]
    var formData: SignUpFormData?
    @Binding var signInData: SignInFormData
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var isLoading = false
    
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
                    .foregroundColor(Color.primaryDark)

                HStack (spacing: 0) {
                    Text("Enter the 6-digit PIN code sent to your phone number " + (formData?.phoneNumber ?? ""))
                        .fontWeight(.medium)
                        .foregroundColor(Color.primaryDark)
                    Spacer()
                }
                .padding(.horizontal, 25)
                
                
                Verification(otpFields: $otpFields, otpText: otpText)
                    .padding(.horizontal, 10)
                
                
                Spacer()
            }

            // Bottom content, including the sign-in button
            VStack (spacing: 16) {
                if isLoading {
                    ProgressView()
                } else {
                    Button("Verify") {
                        // Handle sign in
                        isLoading = true
                        let otpCode = otpFields.joined()
                        if isSignIn {
                            // MARK: SIGN IN OTP
                            Task {
                                do {
                                    print(signInData)
                                    print("DEBUG")
                                    try await viewModel.signIn(withEmail: signInData.email, password: signInData.password)
                                    isLoading = false
                                    dismiss()
                                } catch {
                                    print("DEBUG: Error logging user in : \(error.localizedDescription)")
                                }
                            }
                        } else {
                            // MARK: SIGN UP OTP
                            Task {
                                do {
                                     try await viewModel.createUser(formData: formData!)
                                    isLoading = false
                                     dismiss()
                                } catch {
                                    print("DEBUG: Error verifying user: \(error.localizedDescription)")
                                }
                            }
                        }
                    }
                    .buttonStyle(PrimaryButtonStyle(width: 300, isDisabled: checkStates() || isLoading))
                    .disabled(checkStates() || isLoading)
                    
                    
                    Button(action: {
                        // MARK: REQUEST NEW CODE
                        
                    }) {
                        Text("Request new code")
                            .foregroundColor(Color.primaryDark)
                            .fontWeight(.semibold)
                            .underline() // Underlined text
                    }
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

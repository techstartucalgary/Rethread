import SwiftUI
import CustomTextField

struct SignInFormData {
    var email: String = ""
    var password: String = ""
}

struct SignInView: View {
    @Binding var path: [String]
    @State private var formData = SignInFormData()
    @State private var isShowingVerification: Bool = false
    @State private var isPasswordVisible: Bool = false
    @FocusState var isFieldFocus: FieldToFocus?
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    enum FieldToFocus {
        case secureField, textField
    }

    var body: some View {
        VStack {
            // Top content, including the back button and text fields
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
                .padding(.top, 30)
                .padding(.bottom, 25)

                Text("Welcome back!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal, 25)
                    .padding(.bottom, 1)
                    .foregroundColor(Color.primaryDark)

                HStack (spacing: 0) {
                    Text("Login below or ")
                        .fontWeight(.medium)
                        .foregroundColor(Color.primaryDark)
                    Button(action: {
                        path.removeLast()
                        path.append("SignUpView")
                    }) {
                        Text("create an account")
                            .foregroundColor(Color.primaryDark)
                            .fontWeight(.bold)
                            .underline()
                    }
                    Spacer()
                }
                .padding(.horizontal, 25)
                
                
                VStack(alignment: .leading, spacing: 20) {
                    CustomField(text: $formData.email, titleText: "Email", placeHolderText: "example@domain.com")
                    
                    CustomField(text: $formData.password, titleText: "Password", placeHolderText: "Password", secureText: true)
                    
                    Button(action: {
                        // Handle forgot password action
                    }) {
                        Text("Forgot Password")
                            .foregroundColor(Color.primaryDark)
                            .underline() // Underlined text
                    }
                    .padding(.leading, 5)
                }
                .padding(.horizontal, 25)
                .padding(.top, 20)

                Spacer()
            }
            

            // Bottom content, including the sign-in button
            VStack (spacing: 20) {
                Button("Sign In") {
                    Task {
                        try await viewModel.signInAndRetrievePhoneNumber(withEmail: formData.email, password: formData.password) { phoneNumber, error in
                            if let error = error {
                                // Handle error (e.g., show an alert)
                                print("Sign-in error: \(error.localizedDescription)")
                            } else if let phoneNumber = phoneNumber {
                                // Proceed with showing OTP verification view
                                print("Retrieved phone number: \(phoneNumber)")
                                Task {
                                    try await viewModel.sendVerificationCode(phoneNumber: phoneNumber) { success, error in
                                        if success {
                                            self.isShowingVerification = true
                                        } else {
                                            print("DEBUG: Error sending verification code: \(error?.localizedDescription ?? "Unknown error")")
                                        }
                                    }
                                }
                            } else {
                                // No phone number found, handle accordingly
                                print("No phone number associated with this account.")
                            }
                        }
                    }
                }
                .buttonStyle(PrimaryButtonStyle(width: 300))
                .padding(.bottom, 5)

                VStack {
                    Text("Or continue with")
                        .foregroundColor(Color.black)
                        .opacity(0.95)
                        .font(.system(size: 15))
                        .padding(.bottom, 4)

                    HStack (spacing: 20) {
                        Button(action: {
                            // HANDLE META LOGIN
                        }) {
                            Image("metaLogo")
                                .resizable()
                                .frame(width: 30, height: 25)
                        }
                        .buttonStyle(PrimaryButtonStyle(width: 15, height: 15))
                        .clipShape(Circle())
                        
                        Button(action: {
                            // HANDLE GOOGLE LOGIN
                        }) {
                            Image("googleLogo")
                                .resizable()
                                .frame(width: 20, height: 20)
                        }
                        .buttonStyle(PrimaryButtonStyle(width: 15, height: 15))
                        .clipShape(Circle())
                        
                        Button(action: {
                            // HANDLE GOOGLE LOGIN
                        }) {
                            Image("appleLogo")
                                .resizable()
                                .frame(width: 18, height: 20)
                        }
                        .buttonStyle(PrimaryButtonStyle(width: 15, height: 15))
                        .clipShape(Circle())
                    }

                }
                .padding(.bottom, 15)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
        .fullScreenCover(isPresented: $isShowingVerification) {
            VerificationView(isSignIn: true, path: $path, signInData: $formData)
        }
        .gesture(TapGesture().onEnded{
            self.hideKeyboard()
        })
        .ignoresSafeArea(.keyboard)
        .navigationBarBackButtonHidden(true)
    }
}

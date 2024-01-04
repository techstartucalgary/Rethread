import SwiftUI



struct SignInView: View {
    @Binding var path: [String]
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isShowingVerification: Bool = false
    @State private var isPasswordVisible: Bool = false
    @FocusState var isFieldFocus: FieldToFocus?
    @Environment(\.dismiss) private var dismiss
    
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
                .padding(.top, 40)
                .padding(.bottom, 20)

                Text("Welcome back!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal, 25)
                    .padding(.bottom, 1)
                    .foregroundColor(Color.primaryColor)

                HStack (spacing: 0) {
                    Text("Login below or ")
                        .fontWeight(.medium)
                        .foregroundColor(Color.primaryColor)
                    Button(action: {
                        path.removeLast()
                        path.append("SignUpView")
                    }) {
                        Text("create an account")
                            .foregroundColor(Color.primaryColor)
                            .fontWeight(.bold)
                            .underline() // Underlined text
                    }
                    Spacer()
                }
                .padding(.horizontal, 25)
                
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Email")
                        .foregroundColor(Color.primaryColor)
                        .padding(.horizontal, 25)
                        .padding(.top, 25)
                    
                    CustomTextField(placeholder: "Email", text: $email)
                        .padding(.horizontal, 25)
                        .padding(.top, 9)
                    
                    Text("Password")
                        .foregroundColor(Color.primaryColor)
                        .padding(.horizontal, 25)
                        .padding(.top, 20)
                        .padding(.bottom, 9)
            
                    HStack {
                        if isPasswordVisible {
                            TextField("Password", text: $password)
                                .disableAutocorrection(true)
                                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                                .focused($isFieldFocus, equals: .textField)
                        } else {
                            SecureField("Password", text: $password)
                                .disableAutocorrection(true)
                                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                                .focused($isFieldFocus, equals: .secureField)
                        }
                         
                        Button(action: {
                            self.isPasswordVisible.toggle()
                        }) {
                            Image(systemName: self.isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(Color.gray)
                        }
                    }
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                    .padding(.horizontal, 25)
                    .onChange(of: isPasswordVisible) {
                        isFieldFocus = isPasswordVisible ? .textField : .secureField
                    }
                }

                Spacer()
            }

            // Bottom content, including the sign-in button
            VStack (spacing: 16) {
                Button("Sign In") {
                    // Handle sign in action
                    self.isShowingVerification = true
                }
                .buttonStyle(PrimaryButtonStyle(width: 300))
                
                

                Button(action: {
                    // Handle forgot password action
                }) {
                    Text("Forgot Password")
                        .foregroundColor(Color.primaryColor)
                        .fontWeight(.semibold)
                        .underline() // Underlined text
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom) // Aligns buttons to the bottom
        }
        .fullScreenCover(isPresented: $isShowingVerification) {
            VerificationView(isSignIn: true, path: $path)
        }
        .gesture(TapGesture().onEnded{
            self.hideKeyboard()
        })
        .ignoresSafeArea(.keyboard)
        .navigationBarBackButtonHidden(true)
    }
}

struct MainView2_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

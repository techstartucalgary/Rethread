import SwiftUI

struct SignUpView: View {
    @Binding var currentUserSignedIn: Bool

    struct SignUpFormData {
        var firstName: String = "" // First name text field
        var lastName: String = "" // Last name text field
        var email: String = "" // Email text field
        var password: String = "" // Password text field
        var confirmPassword: String = "" // Confirm password text field
        var phoneNumber: String = "" // Phone number text field
        var postalCode: String = "" // Zip code text field
        var dateOfBirth: Date = Date() // Date of birth text field
        var gender: String = "" // Gender text field
    }

    @State private var formData = SignUpFormData()
    @State private var isPasswordVisible: Bool = false
    @State private var showingDatePicker = false
    @State private var genderOptions = ["Male", "Female", "Other"]
    @FocusState var isFieldFocus: FieldToFocus?
    @Environment(\.presentationMode) var presentationMode
    
    enum FieldToFocus {
        case secureField, textField
    }

    var body: some View {
        VStack {
            // Top content, including the back button and text fields
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
                
                Text("Create an account")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal, 25)
                    .padding(.bottom, 1)
                    .foregroundColor(Color.primaryColor)
                
                HStack (spacing: 0) {
                    Text("Enter your account details below or  ")
                        .fontWeight(.medium)
                        .foregroundColor(Color.primaryColor)
                    Button(action: {
                        // Handle forgot password action
                    }) {
                        Text("log in")
                            .foregroundColor(Color.primaryColor)
                            .fontWeight(.bold)
                            .underline() // Underlined text
                    }
                    Spacer()
                }
                .padding(.horizontal, 25)
                .padding(.bottom, 10)
            }
            ScrollView {
            VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 0) {
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 0) {
                                Text("First Name")
                                    .foregroundColor(Color.primaryColor)
                                    .padding(.leading, 25)
                                    .padding(.top, 20)
                                
                                CustomTextField(placeholder: "First Name", text: $formData.firstName)
                                    .padding(.leading, 25)
                                    .padding(.top, 9)
                            }
                            
                            VStack(alignment: .leading, spacing: 0) {
                                Text("Last Name")
                                    .foregroundColor(Color.primaryColor)
                                    .padding(.trailing, 25)
                                    .padding(.top, 20)
                                
                                CustomTextField(placeholder: "Last Name", text: $formData.lastName)
                                    .padding(.trailing, 25)
                                    .padding(.top, 9)
                            }
                        }
                        
                        Text("Email")
                            .foregroundColor(Color.primaryColor)
                            .padding(.horizontal, 25)
                            .padding(.top, 20)
                        
                        CustomTextField(placeholder: "Email", text: $formData.email)
                            .padding(.horizontal, 25)
                            .padding(.top, 9)

                        Text("Phone Number")
                            .foregroundColor(Color.primaryColor)
                            .padding(.horizontal, 25)
                            .padding(.top, 20)

                        CustomTextField(placeholder: "Phone Number", text: $formData.phoneNumber)
                            .padding(.horizontal, 25)
                            .padding(.top, 9)
                        
                        Text("Password")
                            .foregroundColor(Color.primaryColor)
                            .padding(.horizontal, 25)
                            .padding(.top, 20)
                            .padding(.bottom, 9)
                        
                        SecureField("Password", text: $formData.password)
                            .disableAutocorrection(true)
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                            .padding(.horizontal, 25)
                        
                        Text("Confirm Password")
                            .foregroundColor(Color.primaryColor)
                            .padding(.horizontal, 25)
                            .padding(.top, 20)
                            .padding(.bottom, 9)
                        
                        SecureField("Confirm Password", text: $formData.confirmPassword)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                            .padding(.horizontal, 25)

                        Text("Postal Code")
                            .foregroundColor(Color.primaryColor)
                            .padding(.horizontal, 25)
                            .padding(.top, 20)

                        CustomTextField(placeholder: "Postal Code", text: $formData.postalCode)
                            .padding(.horizontal, 25)
                            .padding(.top, 9)

                        HStack {
                            VStack (alignment: .leading, spacing: 0){
                                Text("Date of Birth")
                                    .foregroundColor(Color.primaryColor)
                                    .padding(.leading, 25)
                                    .padding(.top, 20)
                                
                                // include date picker
                                
                            }

                            VStack (alignment: .leading, spacing: 0) {
                                Text("Gender")
                                    .foregroundColor(Color.primaryColor)
                                    .padding(.trailing, 25)
                                    .padding(.top, 20)
                                
                                // include gender selector
                            }
                        }
                        
                    }
                }

                Spacer()
            }

            // Bottom content, including the sign-in button
            VStack (spacing: 16) {
                Button("Join Us") {
                    // Handle sign up
                    
                }
                .buttonStyle(PrimaryButtonStyle(width: 300))
                
                Button(action: {
                    // Handle terms and conditions
                }) {
                    Text("Terms and Conditions")
                        .foregroundColor(Color.primaryColor)
                        .fontWeight(.semibold)
                        .underline() // Underlined text
                }
            }
            .frame(maxWidth: .infinity) // Aligns buttons to the bottom
            .padding(.top, 10)
        }
        .gesture(TapGesture().onEnded{
            self.hideKeyboard()
        })
        .ignoresSafeArea(.keyboard)
    }
}

// Preview
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(currentUserSignedIn: .constant(false))
    }
}

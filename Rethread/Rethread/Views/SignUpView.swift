import SwiftUI

struct SignUpFormData {
    var firstName: String = "" // First name text field
    var lastName: String = "" // Last name text field
    var email: String = "" // Email text field
    var password: String = "" // Password text field
    var confirmPassword: String = "" // Confirm password text field
    var phoneNumber: String = "" // Phone number text field
    var postalCode: String = "" // Zip code text field
    var dateOfBirth: String = "" // Date of birth text field
    var gender: String = "Male" // Gender text field
}

struct SignUpView: View {
    @Binding var path: [String]
    @State private var isShowingVerification: Bool = false
    @State private var formData = SignUpFormData()
    @State private var isPasswordVisible = false
    @State private var showingDatePicker = false
    @State private var showingTermsAndConditions = false
    @State private var showingGenderPicker = false
    @State private var genderOptions = ["Male", "Female", "Other"]
    @State private var areTermsAccepted = false
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    func toggleDatePicker() {
        showingDatePicker.toggle()
    }


    var body: some View {
        ZStack {
            VStack {
                // Top content, including the back button and text fields
                ScrollView {
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
                            path.removeLast()
                            path.append("SignInView")
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
                
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                VStack(alignment: .leading, spacing: 0) {
                                    Text("First Name")
                                        .foregroundColor(Color.primaryColor)
                                        .padding(.leading, 25)
                                        .padding(.top, 20)
                                    
                                    CustomTextField(placeholder: "First Name", text: $formData.firstName, disableAutocorrection: true)
                                        .padding(.leading, 25)
                                        .padding(.top, 9)
                                }
                                
                                VStack(alignment: .leading, spacing: 0) {
                                    Text("Last Name")
                                        .foregroundColor(Color.primaryColor)
                                        .padding(.trailing, 25)
                                        .padding(.top, 20)
                                    
                                    CustomTextField(placeholder: "Last Name", text: $formData.lastName, disableAutocorrection: true)
                                        .padding(.trailing, 25)
                                        .padding(.top, 9)
                                }
                            }
                            
                            Text("Email")
                                .foregroundColor(Color.primaryColor)
                                .padding(.horizontal, 25)
                                .padding(.top, 20)
                            
                            CustomTextField(placeholder: "Email", text: $formData.email, disableAutocorrection: true)
                                .padding(.horizontal, 25)
                                .padding(.top, 9)
                            HStack {
                                VStack (alignment: .leading, spacing: 0){
                                    Text("Date of Birth")
                                        .foregroundColor(Color.primaryColor)
                                        .padding(.top, 20)
                                    
                                    HStack {
                                        TextField("MM / DD / YYYY", text: $formData.dateOfBirth )
                                            .foregroundColor(Color.primaryTextColor)
                                            .keyboardType(.numberPad)
                                            .onChange(of: formData.dateOfBirth) { newValue in
                                                formData.dateOfBirth = formatDate(newValue)
                                            }
                                        
                                        
                                        Button(action: {
                                            // Actions to present a date picker
                                            toggleDatePicker()
                                        }) {
                                            Image(systemName: "calendar")
                                                .foregroundColor(.gray)
                                        }
                                    }
                                    .padding()
                                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                                    .padding(.top, 9)
                                }
                                
                                
                                VStack (alignment: .leading, spacing: 0) {
                                    Text("Gender")
                                        .foregroundColor(Color.primaryColor)
                                        .padding(.trailing, 25)
                                        .padding(.top, 20)
                                    
                                    CustomDropdownMenu(items: [
                                        DropdownItem(id: 1, title: "Male", onSelect: {formData.gender = "Male"}),
                                        DropdownItem(id: 2, title: "Female", onSelect: {formData.gender = "Female"}),
                                        DropdownItem(id: 3, title: "Other", onSelect: {formData.gender = "Other"})
                                    ])
                                    .frame(width:130)
                                    .padding(.top, 9)
                                    
                                }
                            }
                            .padding(.horizontal, 25)
                            
                            Text("Phone Number")
                                .foregroundColor(Color.primaryColor)
                                .padding(.horizontal, 25)
                                .padding(.top, 20)
                            
                            CustomTextField(placeholder: "Phone Number", text: $formData.phoneNumber, disableAutocorrection: true)
                                .padding(.horizontal, 25)
                                .padding(.top, 9)
                            
                            Text("Password")
                                .foregroundColor(Color.primaryColor)
                                .padding(.horizontal, 25)
                                .padding(.top, 20)
                                .padding(.bottom, 9)
                            
                            SecureField("Password", text: $formData.password)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
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
                            
                            CustomTextField(placeholder: "Postal Code", text: $formData.postalCode, disableAutocorrection: true)
                                .padding(.horizontal, 25)
                                .padding(.top, 9)
                            
                        }
                    }
                    
                    Spacer()
                    
                    
                    // Bottom content, including the sign-in button
                    VStack (spacing: 16) {
                        Button("Join Us") {
                            // Handle sign up
                            print(formData)
                            
                            // Send verification code
                            Task {
                                do {
                                    self.isShowingVerification = true
                                } catch {
                                    print("DEBUG: Error starting auth: \(error.localizedDescription)")
                                }
                            }
                            
                        }
                        .buttonStyle(PrimaryButtonStyle(width: 300, isDisabled: !areTermsAccepted))
                        .disabled(!areTermsAccepted)
                        
                        HStack {
                            Image(systemName: areTermsAccepted ? "checkmark.square.fill" : "square")
                                .foregroundColor(Color.primaryColor)
                                .onTapGesture {
                                    areTermsAccepted.toggle()
                                }
                                .offset(y: 2)
                                .font(.system(size: 20))
                            

                            Button(action: {
                                showingTermsAndConditions.toggle()
                            }) {
                                Text("Terms and Conditions")
                                    .foregroundColor(Color.primaryColor)
                                    .fontWeight(.semibold)
                                    .underline() // Underlined text
                            }
                        }
                    }
                    .frame(maxWidth: .infinity) // Aligns buttons to the bottom
                    .padding(.vertical, 10)
                }
            }
            .fullScreenCover(isPresented: $isShowingVerification) {
                VerificationView(isSignIn: false, path: $path, formData: formData)
            }
            .gesture(TapGesture().onEnded{
                self.hideKeyboard()
            })
        }
        // Date picker modal
        .sheet(isPresented: $showingDatePicker) {
            DatePickerModalView(showModal: $showingDatePicker, chosenDate: $formData.dateOfBirth)
                .presentationDetents([.fraction(0.7)])
                .presentationDragIndicator(.visible)
                
        }
        .sheet(isPresented: $showingTermsAndConditions){
            TermsAndConditions()
                .presentationDetents([.medium, .large])
                .padding(.horizontal, 15)
                .padding(.top, 15)
        }
        .navigationBarBackButtonHidden(true)
    }
}

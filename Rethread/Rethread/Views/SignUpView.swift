import SwiftUI
import CustomTextField

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
    @State private var tempSignInData = SignInFormData()
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
                    .padding(.top, 30)
                    .padding(.bottom, 5)
                    
                    Text("Create an account")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.horizontal, 25)
                        .padding(.bottom, 1)
                        .foregroundColor(Color.primaryDark)
                    
                    HStack (spacing: 0) {
                        Text("Create a new account or ")
                            .fontWeight(.medium)
                            .foregroundColor(Color.primaryDark)
                        Button(action: {
                            path.removeLast()
                            path.append("SignInView")
                        }) {
                            Text("log in")
                                .foregroundColor(Color.primaryDark)
                                .fontWeight(.bold)
                                .underline() // Underlined text
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 25)
                }
                
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading, spacing: 20) {
                            HStack {

                                CustomField(text: $formData.firstName,
                                            titleText: "First Name",
                                            placeHolderText: "John")
                                
                                CustomField(text: $formData.lastName, 
                                            titleText: "Last Name",
                                            placeHolderText: "Doe")
                        
                            }
                            
                            CustomField(text: $formData.email,
                                        titleText: "Email",
                                        placeHolderText: "example@domain.com")
                            
                            HStack {
                                EGTextField(text: $formData.dateOfBirth)
                                    .setTitleText("Date of Birth")
                                    .setTitleColor(Color.primaryDark)
                                    .setPlaceHolderText("DD / MM / YYYY")
                                    .setPlaceHolderTextColor(Color.PrimaryLight)
                                    .setTruncateMode(.tail)
                                    .setBorderColor(.primaryDark)
                                    .setTextColor(Color.primaryDark)
                                    .setDisableAutoCorrection(true)
                                    .setTextFieldHeight(48)
                                    .setFocusedBorderColorEnable(true)
                                    .setTrailingImage(Image(systemName: "calendar"), click: toggleDatePicker)
                                    .setTrailingImageForegroundColor(Color.primaryDark)
                                    .keyboardType(.numberPad)
                                    .onChange(of: formData.dateOfBirth) { newValue in
                                        formData.dateOfBirth = formatDate(newValue)}
                                
                                
                                VStack (alignment: .leading, spacing: 0) {
                                    Text("Gender")
                                        .foregroundColor(Color.primaryDark)
                                    
                                    CustomDropdownMenu(items: [
                                        DropdownItem(id: 1, title: "Male", onSelect: {formData.gender = "Male"}),
                                        DropdownItem(id: 2, title: "Female", onSelect: {formData.gender = "Female"}),
                                        DropdownItem(id: 3, title: "Other", onSelect: {formData.gender = "Other"})
                                    ])
                                    .frame(width:130)
                                    .padding(.top, 5)
                                    
                                }
                            }
            
                            
                            CustomField(text: $formData.phoneNumber, titleText: "Phone Number", placeHolderText: "(999) 999-9999")
                            
                            CustomField(text: $formData.password, titleText: "Password", placeHolderText: "Password", secureText: true)
                            
                            CustomField(text: $formData.confirmPassword, titleText: "Confirm Password", placeHolderText: "Confirm Password", secureText: true)
                            
                            CustomField(text: $formData.postalCode, titleText: "Postal Code", placeHolderText: "123 QAZ")
                            
                        }
                        .padding(.top, 20)
                        .padding(.horizontal, 25)
                    }
                    
                    Spacer()
                    
                    
                    // Bottom content, including the sign-in button
                    VStack (spacing: 16) {
                        Button("Join Us") {
                            // Assume validation passed
                            Task {
                                do {
                                    try await viewModel.sendVerificationCode(phoneNumber: "+14039918538") { success, error in
                                        if success {
                                            isShowingVerification.toggle()
                                        } else {
                                            print("DEBUG: Error sending verification code: \(error?.localizedDescription ?? "Unknown error")")
                                        }
                                    }
                                }
                            }
                        }

                        .buttonStyle(PrimaryButtonStyle(width: 300, isDisabled: !areTermsAccepted))
                        .disabled(!areTermsAccepted)
                        
                        HStack {
                            Image(systemName: areTermsAccepted ? "checkmark.square.fill" : "square")
                                .foregroundColor(Color.primaryDark)
                                .onTapGesture {
                                    areTermsAccepted.toggle()
                                }
                                .offset(y: 2)
                                .font(.system(size: 20))
                            

                            Button(action: {
                                showingTermsAndConditions.toggle()
                            }) {
                                Text("Terms and Conditions")
                                    .foregroundColor(Color.primaryDark)
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
                // Dummy signinData
                VerificationView(isSignIn: false, path: $path, formData: formData, signInData: $tempSignInData)
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

#if DEBUG
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(path: .constant(["SignUpView"]))
    }
}
#endif

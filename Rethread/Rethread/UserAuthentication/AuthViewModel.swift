import Foundation
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var tempSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var CLIENT_CODE: String = ""
    private var verificationId: String?
    @Published var isLoading: Bool = true
    @Published var isVerified: Bool = false
    
    init(){
        self.userSession = Auth.auth().currentUser
        self.isLoading = true
        Task {
            await fetchUser()
            self.isLoading = false
        }
    }
    
    // Sign In function
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: Failed to log in with error .\(error.localizedDescription)")
        }
    }
    
    // Sign Up a user
    func createUser(formData: SignUpFormData) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: formData.email, password: formData.password)
            self.userSession = result.user
            
            let user = User(id: result.user.uid, firstname: formData.firstName, lastname: formData.lastName,
                            email: formData.email, dateOfBirth: formData.dateOfBirth, gender: formData.gender,
                            phoneNumber: formData.phoneNumber,postalCode: formData.postalCode, onboardingComplete: false)
            
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            print("DEBUG: Error creating user: \(error.localizedDescription)")
        }
    }
    
    func updateOnboardingComplete() async throws {
        do {
            let userRef = Firestore.firestore().collection("users").document(userSession!.uid)
            try await userRef.updateData(["onboardingComplete": true])
            await fetchUser()
        } catch {
            print("DEBUG: Error updating user onboard status: \(error.localizedDescription)")
        }
    }
    
    // Signout
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    // Delete Account
    func deleteAccount() {
        //TODO: Implement user deleting account.
    }

    // Send Verification Code
    func sendVerificationCode(phoneNumber: String, completion: @escaping (Bool, Error?) -> Void) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
            if let error = error {
                print("Error sending verification code: \(error.localizedDescription)")
                completion(false, error)
                return
            }
            guard let verificationID = verificationID else {
                print("Verification ID not received")
                completion(false, nil)
                return
            }
            self.verificationId = verificationID
            completion(true, nil)
        }
    }
    
    // Attempt to sign in and retrieve phone number without fully establishing a session
    func signInAndRetrievePhoneNumber(withEmail email: String, password: String, completion: @escaping (String?, Error?) -> Void) async {
        do {
            // Sign in the user
            let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
            
            // Fetch user details from Firestore
            let uid = authResult.user.uid
            let userDocument = try await Firestore.firestore().collection("users").document(uid).getDocument()
            
            if let userDocument = userDocument.data(), let phoneNumber = userDocument["phoneNumber"] as? String {
                // Successfully retrieved phone number
                
                // Sign out the user
                try Auth.auth().signOut()
                
                // Return the phone number
                completion(phoneNumber, nil)
            } else {
                // Phone number not found in the document
                completion(nil, NSError(domain: "AppError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Phone number not found in Firestore."]))
            }
        } catch {
            completion(nil, error)
        }
    }



    // Verify Phone Number
    func verifyPhoneNumber(verificationCode: String) async throws {
        guard let verificationId = self.verificationId else {
            throw NSError(domain: "AppError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Verification ID not found"])
        }
        
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationId, verificationCode: verificationCode)
        _ = try await Auth.auth().signIn(with: credential)
    }


    // Fetch User
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
        self.currentUser = try? snapshot.data(as: User.self)
    }
}

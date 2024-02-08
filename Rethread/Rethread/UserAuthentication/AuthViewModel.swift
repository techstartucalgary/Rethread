import Foundation
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var CLIENT_CODE: String = ""
    private var verificationId: String?
    
    init(){
        self.userSession = Auth.auth().currentUser
        
        Task {
            await fetchUser()
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
    
    // Fetch User
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
        self.currentUser = try? snapshot.data(as: User.self)
    }
    
    
    
//    func sendPhoneAuth() async {
//        PhoneAuthProvider.provider().verifyPhoneNumber("+16505551111", uiDelegate: nil) { [weak self] verificationID, error in
//            guard let verificationID = verificationID, error == nil else {
//                print("DEBUG: Error sending phone auth: \(error!.localizedDescription)")
//                return
//            }
//            self?.verificationId = verificationID
//        }
//    }
//    func verifyPhoneAuth(otp: String) async {
//        guard let verificationId = self.verificationId else {return}
//        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationId, verificationCode: otp)
//
//        Auth.auth().signIn(with: credential) { (result, error) in
//            if let error = error {
//                print("DEBUG: Error verifying phone auth: \(error.localizedDescription)")
//                return
//            }
//            self.userSession = result?.user
//        }
//    }
    
}

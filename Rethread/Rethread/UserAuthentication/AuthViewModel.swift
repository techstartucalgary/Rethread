import Foundation
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init(){
        
    }
    
    // Sign In function
    func signIn(withEmail email: String, password: String) async throws {
        print("Sign In AUTH")
    }
    
    // Sign Up a user
    func createUser(withEmail email: String, password: String, firstname: String, lastname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, firstname: firstname, lastname: lastname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
        } catch {
            print("DEBUG: Error creating user: \(error.localizedDescription)")
        }
    }
    
    // Signout
    func signOut() {
        
    }
    
    // Delete Account
    func deleteAccount() {
        
    }
    
    // Fetch User
    func fetchUser() async {
        
    }
}

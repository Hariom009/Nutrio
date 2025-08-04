import SwiftUI
import Firebase
import FirebaseFirestore // for storage
import FirebaseAuth // for auth
import GoogleSignIn
import GoogleSignInSwift

@MainActor
final class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User? // firebase wala user
    @Published var currentUser: User? // apna wala user
    @Published var isError : Bool = false
    @Published var isLoading: Bool = false
    @Published var authChecked = false
    private let auth = Auth.auth()
    private let firestore = Firestore.firestore()
    
    init(){
        setupAuthStateListener()
    }
    // No need to login again and again it handles the logged in user till user signs Out or delete Account
    
    private func setupAuthStateListener() {
        Auth.auth().addStateDidChangeListener { _, user in
            self.userSession = user
            
            Task {
                if let uid = user?.uid {
                    await self.fetchUser(by: uid)
                }
                self.authChecked = true
            }
        }
    }
    func createUser(email: String, fullName: String, password: String) async {
        do{
            let authResult = try await auth.createUser(withEmail: email, password: password)
            await storeUserInFireStore(uid: authResult.user.uid, email: email, fullName: fullName)
        }catch{
          isError = true
        }
    }
    func storeUserInFireStore(uid:String, email:String, fullName:String) async{
        let user =  User(uid: uid, email: email, fullname: fullName)
        
        do{
            try firestore.collection("users").document(uid).setData(from: user)
        }catch{
            isError = true
        }
    }
    func login(email:String,password:String) async{
        do{
            let authResult = try await auth.signIn(withEmail: email, password: password)
            userSession = authResult.user
            await fetchUser(by: authResult.user.uid)
            print("Current User", currentUser)
        }catch{
            isError = true
        }
    }
    func fetchUser(by uid: String) async{
        do {
            let document = try await firestore.collection("users").document(uid).getDocument()
            currentUser = try document.data(as: User.self)
        }catch{
          isError = true
        }
    }
    func signOut(){
        isLoading = true
        do{
           userSession = nil
            currentUser = nil
            try auth.signOut()
        }catch{
          isError = true
        }
        isLoading = false
    }
    func deleteAccount() async{
        isLoading = true
        do{
            try await auth.currentUser?.delete()
            try await firestore.collection("users").document(currentUser!.uid).delete()
            userSession = nil
            currentUser = nil
        }catch{
            isError = true
        }
        isLoading = false
    }
    func resetPassword(email: String) async{
        do{
            try await auth.sendPasswordReset(withEmail: email)
        }catch{
            isError = true
        }
    }
    func signInWithGoogle(presentingViewController: UIViewController) async {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        isLoading = true

        do {
            let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController)
            guard let idToken = result.user.idToken?.tokenString else { return }

            let credential = GoogleAuthProvider.credential(
                withIDToken: idToken,
                accessToken: result.user.accessToken.tokenString
            )

            let authResult = try await auth.signIn(with: credential)
            userSession = authResult.user

            let uid = authResult.user.uid
            let email = authResult.user.email ?? ""
            let name = authResult.user.displayName ?? ""

            let docRef = firestore.collection("users").document(uid)
            let document = try await docRef.getDocument()

            if !document.exists {
                //  Create Firestore user document if missing
                let newUser = User(uid: uid, email: email, fullname: name)
                try docRef.setData(from: newUser)
            }

            // Now fetch the user safely
            await fetchUser(by: uid)

            print("Google Sign-In success: \(email)")

        } catch {
            print("Google Sign-In failed: \(error.localizedDescription)")
            isError = true
        }
        
        isLoading = false
    }
    
}

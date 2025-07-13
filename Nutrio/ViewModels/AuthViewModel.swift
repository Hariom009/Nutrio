//
//  AuthViewModel.swift
//  Nutrio
//
//  Created by Hari's Mac on 17.06.2025.
//

import SwiftUI
import FirebaseFirestore // for storage
import FirebaseAuth // for auth

@MainActor
final class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User? // firebase wala user
    @Published var currentUser: User? // apna wala user
    @Published var isError : Bool = false
    private let auth = Auth.auth()
    private let firestore = Firestore.firestore()
    
    init(){
        
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
        do{
           userSession = nil
            currentUser = nil
            try auth.signOut()
        }catch{
          isError = true
        }
    }
    func deleteAccount() async{
        do{
            try await auth.currentUser?.delete()
            try await firestore.collection("users").document(currentUser!.uid).delete()
            userSession = nil
            currentUser = nil
        }catch{
            isError = true
        }
    }
}

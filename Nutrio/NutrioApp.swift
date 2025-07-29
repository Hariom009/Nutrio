//
//  NutrioApp.swift
//  Nutrio
//
//  Created by Hari's Mac on 13.06.2025.
//

import SwiftUI
import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
    @available(iOS 9.0, *)
     func application(_ application: UIApplication, open url: URL,
                      options: [UIApplication.OpenURLOptionsKey: Any])
       -> Bool {
       return GIDSignIn.sharedInstance.handle(url)
     }
}
@main
struct NutrioApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var authViewModel = AuthViewModel()
    @ObservedObject var router = Router()
    @AppStorage("newUser") var newUser: Bool = true

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath){
                Group{
                    if newUser {
                       WelcomeView(newUser: $newUser)
                    }else{
                        MainTabView()
                    }
                }
                .navigationDestination(for: Router.AuthFlow.self) { destinatiom in
                    switch destinatiom {
                    case .welcomescreen: WelcomeView(newUser: $newUser)
                    case .loginhome: SignInView()
                    case .loginemail: LoginView()
                    case .createAccount: CreateAccountView()
                    case .forgotPassword: ResetPasswordView()
                    case .profile: ProfileView()
                    case .emailSent: EmailSentView()
                    case .home: MainTabView()
                        
                    }
                }
            }
            .environmentObject(authViewModel)
            .environmentObject(router)
        }
    }
}

extension View {
    func getRootViewController() -> UIViewController? {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let root = screen.windows.first?.rootViewController else {
            return nil
        }
        return root
    }
}

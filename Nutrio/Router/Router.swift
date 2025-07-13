//
//  Router.swift
//  Nutrio
//
//  Created by Hari's Mac on 13.07.2025.
//

import Foundation
import SwiftUI


final class Router: ObservableObject{
    @Published var navPath = NavigationPath()
    
    enum AuthFlow:Hashable,Codable{
        case loginhome
        case welcomescreen
        case loginemail
        case createAccount
        case forgotPassword
        case profile
        case emailSent
        case home
    }
    func navigate(to destination: AuthFlow){
        navPath.append(destination)
    }
    func navigateBack(){
        navPath.removeLast()
    }
    func navigateToRoot(){
        navPath.removeLast(navPath.count)
    }
}

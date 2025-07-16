//
//  ContentView.swift
//  Nutrio
//
//  Created by Hari's Mac on 18.06.2025.
//
//
//import SwiftUI
//
//struct ContentView: View {
//    
//    @Binding var newUser: Bool
//    @EnvironmentObject var router: Router
//    @EnvironmentObject var authViewModel: AuthViewModel
//    var body: some View {
//        VStack{
//            if newUser{
//                router.navigate(to: .welcomescreen)
//            }else{
//                router.navigate(to: .home)
//            }
//        }
//    }
//}
//
//#Preview {
//    ContentView(newUser: .constant(false))
//}

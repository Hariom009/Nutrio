//
//  WelcomeView.swift
//  Nutrio
//
//  Created by Hari's Mac on 13.06.2025.
//

import SwiftUI

struct WelcomeView: View {
    @State private var navigate = false
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var router: Router
    @Binding var newUser: Bool
    var body: some View {
        ZStack{
            Image("welcom_bg")
                .resizable()
                .frame(width: .screenWidth, height: .screenHeight)
                .scaledToFill()
            VStack{
                Spacer()
                Image("app_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60,height: 60)
                    .padding(.bottom,8)
                
                Text("Welcome\nto out store")
                    .font(.customfont(.bold, fontSize: 48))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                
                Text("Get your groceries in as fast as one hour")
                    .font(.customfont(.bold, fontSize: 16))
                    .foregroundStyle(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.bottom,30)
                
                StartButton
                Spacer()
                    .frame(height: 80)
            }
            .padding(.horizontal,20)
        }
        .ignoresSafeArea()
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
    private var StartButton: some View{
        Button {
            if authViewModel.userSession == nil || authViewModel.currentUser == nil{
                router.navigate(to: .loginhome)
            }else {
                router.navigate(to: .home)
            }
            newUser = false
        } label: {
            Text("Get Started")
                .foregroundStyle(.white)
                .frame(minWidth: 0,maxWidth: .infinity,minHeight: 60,maxHeight: 60)
                .background(Color.primaryApp)
                .cornerRadius(20)
        }
    }
}
    
    #Preview {
        NavigationView{
            WelcomeView(newUser: .constant(false))
                .environmentObject(AuthViewModel())
        }
    }

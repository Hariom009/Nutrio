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
    var body: some View {
        ZStack{
            Image("welcom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
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
                
                NavigationLink{
                    Group{
                        if authViewModel.userSession == nil{
                            SignInView()
                        }else {
                            ProfileView()
                        }
                    }
                    .environmentObject(authViewModel)
                }label: {
                    Text("Get Started")
                        .foregroundStyle(.white)
                        .frame(minWidth: 0,maxWidth: .infinity,minHeight: 60,maxHeight: 60)
                        .background(Color.primaryApp)
                        .cornerRadius(20)
                }
                .navigationBarBackButtonHidden(true)
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
}

#Preview {
    NavigationView{
        WelcomeView()
            .environmentObject(AuthViewModel())
    }
}

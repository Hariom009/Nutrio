//
//  SignUpView.swift
//  Nutrio
//
//  Created by Hari's Mac on 18.06.2025.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var loginVM = MainViewModel.shared;
    var body: some View {
        ZStack{
            Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth,height: .screenHeight)
            
            VStack{
                Image("color_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                    .padding(.bottom,.screenWidth * 0.1)
                
                Text("SignUp")
                    .font(.customfont(.bold, fontSize: 26))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                    .padding(.bottom,4)
                Text("Enter your emails and password")
                    .font(.customfont(.medium, fontSize: 18))
                    .foregroundColor(.secondaryText)
                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                    .padding(.bottom,.screenWidth * 0.1)
                
                    LineTextField(txt: $loginVM.txtEmail, placeholder: "Enter your email address",title: "Email")
                        .padding(.bottom,.screenWidth * 0.07)
                    LineSecureField(txt: $loginVM.txtPassword, ShowPassword: $loginVM.showPassword, placeholder: "Enter password",title: "Password")
                        
                Button {
                    
                } label: {
                    Text("Forgot Password?")
                        .font(.customfont(.regular, fontSize: 14))
                        .foregroundColor(.primaryText)
                }
                .frame(minWidth: 0,maxWidth: .infinity,alignment: .trailing)
                .padding(.bottom,.screenWidth * 0.05)
                
                RoundButton(title: "Log In"){
                    
                }
                .padding(.bottom,.screenWidth * 0.05)
                
                HStack{
                    Text("Don't have an Account?")
                        .font(.customfont(.regular, fontSize: 14))
                        .foregroundColor(.primaryText)
                    Button {
                        
                    } label: {
                        Text("Sign Up")
                            .foregroundColor(.primaryApp)
                    }

                }

                Spacer()
            }
            .padding(.top,.topInsets + 64)
            .padding(.horizontal,20)
            .padding(.bottom,.bottomInsets)
            VStack{
                HStack{
                    Button{
                        mode.wrappedValue.dismiss()
                    }label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding(.top,.topInsets)
            .padding(.horizontal,20)
        }
        .background(Color.white)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}
#Preview {
    SignUpView()
}

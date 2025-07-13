//
//  LoginView.swift
//  Nutrio
//
//  Created by Hari's Mac on 13.06.2025.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var loginVM = MainViewModel.shared;
    @State var email: String = ""
    @State var password: String = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var showcreateAccView = false
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
                
                Text("Loging")
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
                
                Button{
                    Task{
                        await authViewModel.login(email: loginVM.txtEmail, password: loginVM.txtPassword)
                    }
                }label: {
                    Text("Login")
                        .foregroundStyle(.white)
                        .padding(.horizontal,80)
                        .padding(.vertical,20)
                        .background(
                            RoundedRectangle(cornerRadius: 18)
                                .foregroundColor(.primaryApp)
                        )
                }
                
                HStack{
                    Text("Don't have an Account?")
                        .font(.customfont(.regular, fontSize: 14))
                        .foregroundColor(.primaryText)
                    Button {
                        showcreateAccView.toggle()
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
        .sheet(isPresented: $showcreateAccView){
            CreateAccountView()
        }
        .background(Color.white)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    LoginView()
}

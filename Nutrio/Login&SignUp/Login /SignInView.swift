//
//  SignInView.swift
//  Nutrio
//
//  Created by Hari's Mac on 13.06.2025.
//

import SwiftUI
import CountryPicker

struct SignInView: View {
    @State var txtMobile: String = ""
    @State var isShowPicker: Bool = false
    @State var countryObj: Country?
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var router: Router
    var body: some View {
        ZStack{
            Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth,height: .screenHeight)
            VStack{
                Image("sign_in_top")
                    .resizable()
                    .scaledToFill()
                    .frame(width: .screenWidth,height: .screenWidth)
                Spacer()
            }
            ScrollView{
                VStack(alignment: .leading){
                    Text("Get your groceries\nwith nectar")
                        .font(.customfont(.bold, fontSize: 26))
                        .foregroundColor(.primaryText)
                        .padding(.bottom,5)
                    
                    HStack{
                        Button{
                            isShowPicker.toggle()
                        }label: {
                            if let countryObj = countryObj{
                                
                                Text("\(countryObj.isoCode.getFlag())")
                                    .font(.customfont(.medium, fontSize: 35))
                                    .foregroundColor(.primaryText)
                                Text("+\(countryObj.phoneCode)")
                                    .font(.customfont(.medium, fontSize: 24))
                                    .foregroundColor(.primaryText)
                            }
                        }
                        TextField("Enter Mobile number",text: $txtMobile)
                            .frame(minWidth: 0,maxWidth: .infinity)
                    }
                    Divider()
                        .padding(.bottom, 25)
                   // Login WIth Email Button ...
                    loginWithEmail
                        Button{
                            
                        }label: {
                            Image("google_logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20,height: 20)
                            Text("Continue with Google")
                                .font(.customfont(.bold, fontSize: 18))
                                .foregroundStyle(.white)
                                .multilineTextAlignment(.center)
                        }
                        .frame(minWidth: 0,maxWidth: .infinity,minHeight: 60,maxHeight: 60)
                        .background(Color(hex: "5383EC"))
                        .cornerRadius(20)
                        .padding(.bottom,8)

                     
                        Button{
                            
                        }label: {
                            Image("fb_logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20,height: 20)
                            Text("Continue with Facebook")
                                .font(.customfont(.bold, fontSize: 18))
                                .foregroundStyle(.white)
                                .multilineTextAlignment(.center)
                        }
                        .frame(minWidth: 0,maxWidth: .infinity,minHeight: 60,maxHeight: 60)
                        .background(Color(hex: "#4A66AC"))
                        .cornerRadius(20)
                    HStack{
                        Spacer()
                        Text("Don't have an account?")
                            .font(.caption)
                        // Create account
                        CreateAccountView
                        Spacer()
                    }
                }
                
                .padding(.horizontal,20)
                .frame(width: .screenWidth, alignment: .leading)
                .padding(.top, .topInsets + .screenWidth)
            }
            
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
        .onAppear{
            self.countryObj = Country(phoneCode: "91", isoCode: "IN")
        }
        .sheet(isPresented: $isShowPicker){
            CountryPickerUI(country: $countryObj)
        }
     
    }
    private var CreateAccountView: some View {
        Button{
            router.navigate(to: .createAccount)
        }label: {
           Text("Sign Up")
            .font(.headline)
        }
    }
    private var loginWithEmail: some View{
        Button{
            router.navigate(to: .loginemail)
        }label: {
            Text("or login with email")
                .font(.customfont(.medium, fontSize: 14))
                .foregroundColor(.primaryText)
                .multilineTextAlignment(.center)
                .frame(minWidth: 0,maxWidth: .infinity,alignment: .center)
                .padding(.bottom,25)
        }
    }
}

#Preview {
    SignInView()
}

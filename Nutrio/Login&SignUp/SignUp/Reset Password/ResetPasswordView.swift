//
//  ResetPasswordView.swift
//  Nutrio
//
//  Created by Hari's Mac on 13.07.2025.
//

import SwiftUI

struct ResetPasswordView: View {
    @State var email:String = ""
    @EnvironmentObject var authViewModel:AuthViewModel
    @EnvironmentObject var router: Router
    var body: some View {
        VStack{
            VStack(alignment: .leading, spacing: 16){
                Text("Reset Password")
                    .font(.largeTitle)
                    .fontWeight(.regular)
                Text("Enter the email associated to your account and we'll send an email with instruction to reset your password.")
                    .font(.caption)
                TextField("Enter your email", text: $email)
                    .padding(.top,8)
                    .autocapitalization(.none)
                Divider()
            }
            .padding(.all,16)
            
            Button{
                Task{
                    await authViewModel.resetPassword(email: email)
                    if !authViewModel.isError{
                        router.navigate(to: .emailSent)
                    }else{
                        print("error is here ")
                    }
                }
            }label:{
                Text("Send Instructions")
                    .foregroundStyle(.white)
                    .padding(.horizontal,80)
                    .padding(.vertical,20)
                    .background(
                        RoundedRectangle(cornerRadius: 18)
                            .foregroundColor(.primaryApp)
                    )
            }
            Spacer()
        }
        .padding()
        .toolbarRole(.editor)
    }
}

#Preview {
    ResetPasswordView()
}

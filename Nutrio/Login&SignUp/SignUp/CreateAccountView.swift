

import SwiftUI
import Foundation
// So in this one i got a interesting error de to navigation Stack clashes with the router class navigation to this CreateAccountView()
// So be sure to call router.navigate and remvoe navigation Stack otherwise it will crash evnetually
struct CreateAccountView: View {
    @State private var email: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""
    @State private var confirmpassword: String = ""
    @EnvironmentObject var authViewModel: AuthViewModel // yha use krna pdega state object
    @Environment(\.dismiss) var dismiss
    
    //@EnvironmentObject var router: Router
    var body: some View {
            VStack(spacing:16){
                Text("Plaese fill all the details for your account")
                    .font(.headline)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.vertical)
                
                InputView(placeholder: "Email or phone number", text: $email)
                    .autocapitalization(.none)
                InputView(placeholder: "Your name", text: $fullName)
                InputView(placeholder: "Password",isSecureField: true, text: $password)
                
                ZStack(alignment:.trailing){
                    VStack{
                        InputView(
                            placeholder: "Confirm Your passoword",
                            isSecureField: true,
                            text: $confirmpassword
                        )
                        Spacer()
                        if !password.isEmpty || !confirmpassword.isEmpty{
                            Image(systemName: "\(isValidPassword ? "checkmark" : "xmark").circle.fill")
                                .imageScale(.large)
                                .foregroundColor(isValidPassword ? .green : .red)
                        }
                    }
                }
                Spacer()
                Button{
                    Task{
                        await authViewModel.createUser(
                            email: email,
                            fullName: fullName,
                            password: password
                        )
//                        if !authViewModel.isError{
//                            router.navigateBack()
//                        }
                    }
                    dismiss()
                }label: {
                    Text("Create Account")
                        .foregroundStyle(.white)
                        .padding(.horizontal,40)
                        .padding(.vertical,20)
                        .background(
                            RoundedRectangle(cornerRadius: 18)
                                .foregroundColor(.primaryApp)
                        )
                }
                
            }
            .navigationTitle("Set up your account")
            //.toolbarRole(.editor)
            .padding()
        }
        var isValidPassword : Bool{
            confirmpassword == password
        }
    }

#Preview {
    CreateAccountView()
}

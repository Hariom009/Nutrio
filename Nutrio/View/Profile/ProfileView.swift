//
//  ProfileView.swift
//  Nutrio
//
//  Created by Hari's Mac on 18.06.2025.
//

import SwiftUI
struct ProfileView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
   // @EnvironmentObject var router: Router
    var body: some View {
        
        if let user =  authViewModel.currentUser{
            List{
                Section{
                    HStack(spacing: 16){
                        Text(user.initials)
                            .foregroundColor(.white)
                            .font(.title)
                            .fontWeight(.semibold)
                            .frame(width:70,height:70)
                            .background(Color(.lightGray))
                            .clipShape(Circle())
                            .padding()
                        VStack(alignment: .leading,spacing: 4){
                            Text(user.fullname)
                                .font(.headline)
                                .fontWeight(.bold)
                            
                            Text(user.email)
                              //  .foregroundStyle(.black)
                                .font(.footnote)
                        
                        }
                    }
                }
                Section("Accounts"){
                    Button{
                       // authViewModel.signOut()
                    }label: {
                        Label {
                            Text("Sign Out")
                                .foregroundStyle(.black)
                        } icon: {
                            Image(systemName: "arrow.left.circle.fill")
                                .foregroundStyle(.red)
                        }

                    }
                    Button{
//                        Task{
//                           await authViewModel.deleteAccount()
//                        }
                    }label: {
                        ZStack{
                            Label {
                                Text("Delete Account")
                                    .foregroundStyle(.black)
                            } icon: {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundStyle(.red)
                            }
                        }
                    }
                }
            }
        }
        else if (authViewModel.userSession != nil){
            ProgressView("Please Wait")
        }
      
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthViewModel())
}

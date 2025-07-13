//
//  EmailSentView.swift
//  Nutrio
//
//  Created by Hari's Mac on 13.07.2025.
//

import SwiftUI

struct EmailSentView: View {
    @EnvironmentObject var router: Router
    var body: some View {
        VStack{
            VStack(spacing: 24){
                Spacer()
                Image(systemName: "envelope.fill")
                    .resizable()
                    .frame(width: 120, height: 80)
                    .foregroundColor(Color.primaryApp)
                Text("Check you email")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text("We have sent password recover instructions to your email")
                    .font(.caption)
            }
            .padding()
            Button{
                router.navigateToRoot()
            }label: {
                Text("Skip,I'll confirm later")
                    .foregroundStyle(.white)
                    .padding(.vertical,12)
                    .padding(.horizontal,80)
                    .background(
                        RoundedRectangle(cornerRadius: 18)
                            .fill(Color.primaryApp)
                    )
            }
            VStack(spacing: 8){
                Spacer()
                
                Text("Didn't recieve the email? Check you spam")
                    .font(.subheadline)
                HStack{
                    Text("filter, or")
                        .font(.subheadline)
                    Button{
                        router.navigateBack()
                        print("TRy another tapped ")
                    }label: {
                        Text("try another email adddress")
                            .font(.subheadline)
                            .foregroundStyle(Color.primaryApp)
                    }
                }
            }
            .padding(.bottom,24)
        }
    }
}
#Preview {
    EmailSentView()
}

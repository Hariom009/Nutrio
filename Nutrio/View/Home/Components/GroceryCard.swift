//
//  GroceryCard.swift
//  Nutrio
//
//  Created by Hari's Mac on 24.07.2025.
//

import SwiftUI

struct GroceryCard: View {
    var text:String
    var image:String
    var colour:Color
    var body: some View {
        VStack{
            HStack(spacing:16){
                Image("\(image)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 90)
                   
                Text("Pulses")
                    .font(.custom("Gilroy.medium", size: 18))
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
            }
            .padding()
            .padding(.trailing,72)
            .background(
                RoundedRectangle(cornerRadius: 18)
                    .fill(colour.opacity(0.2))
            )
        }
    }
}
#Preview{
    GroceryCard(text: "Pulses", image: "pulses", colour: Color.orange)
}

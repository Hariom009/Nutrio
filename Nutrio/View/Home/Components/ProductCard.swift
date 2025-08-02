//
//  ProductCard.swift
//  Nutrio
//
//  Created by Hari's Mac on 21.06.2025.
//

import SwiftUI

struct ProductCard: View {
     var imagename: String
     var title:String
     var amount: String
     var price: Double
    var body: some View {
        VStack(spacing: 2){
                Image("\(imagename)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 99,height: 79)
            
            Spacer()
            VStack(alignment: .leading,spacing: 0){
                VStack(alignment: .leading, spacing: 8){
                    Text(title)
                        .font(.system(size: 16,weight: .semibold))
                    Text("\(amount), Price")
                        .font(.caption)
                    
                }
                HStack(spacing: 35){
                    Text("$\(price,specifier: "%.2f")")
                    
                        .font(.system(size: 18,weight: .bold,design: .rounded))
                    Button{
                        
                    }label: {
                        Image(systemName: "plus")
                            .fontWeight(.bold)
                            .frame(width: 45,height: 45)
                            .foregroundStyle(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 18)
                                    .fill(Color.primaryApp)
                            )
                    }
                }
            }
        }
        .padding()
        .frame(width: 173, height: 249)
        .background(
            RoundedRectangle(cornerRadius: 18)
                .stroke(lineWidth: 0.2)
        )
    }
}

#Preview {
    ProductCard(imagename:"Organic Bananas",title:"Organic Bananas", amount: "7", price:4.99)
}

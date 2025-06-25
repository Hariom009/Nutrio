//
//  ProductCard.swift
//  Nutrio
//
//  Created by Hari's Mac on 21.06.2025.
//

import SwiftUI

struct ProductCard: View {
    @Binding var imagename: String
    @Binding var title:String
    @Binding var amount: String
    @Binding var price: Double
    var body: some View {
        VStack(spacing: 20){
            Image("\(imagename)")
                .resizable()
                .scaledToFit()
                .frame(width: 100,height: 100)
            VStack(alignment: .leading, spacing: 8){
               Text(title)
                    .font(.system(size: 16,weight: .semibold))
               Text("\(amount), Price")
                    .font(.caption)
                
            }
            HStack(spacing: 35){
                Text("$\(price,specifier: "%.2f")")
                    
                    .font(.system(size: 14,weight: .bold,design: .rounded))
                Button{
                    
                }label: {
                    Image(systemName: "plus")
                        .padding(12)
                        .foregroundStyle(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 18)
                                .fill(Color.primaryApp)
                        )
                }
            }
        }
    }
}

#Preview {
    ProductCard(imagename:.constant("banana"),title: .constant("Organic Bananas"), amount: .constant("7 pcs"), price: .constant(4.99))
}

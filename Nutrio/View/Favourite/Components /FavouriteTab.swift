//
//  FavouriteTab.swift
//  Nutrio
//
//  Created by Hari's Mac on 26.07.2025.
//

import SwiftUI

struct FavouriteTab: View {
    let product: Product
    var body: some View {
        HStack(spacing: 24){
            Image("\(product.image)")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 64)
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .lineLimit(1)

                Text("\(product.amount), Price")
                    .font(.custom("Gilroy-Medium", size: 14))
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
            }
            .layoutPriority(1)

            
            Spacer()
            HStack(spacing: 6){
                Text("$\(product.price, specifier: "%.2f")")
                    .font(.custom("Gilroy-Regular", size: 16))
                    .fontWeight(.semibold)
                
                Image("next")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 9, height: 10)
                    //.padding()
            }
            
        }
        .navigationTitle("Favourite")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal,16)
        .padding()
    }
}

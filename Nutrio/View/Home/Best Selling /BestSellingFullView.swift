//
//  BestSellingFullView.swift
//  Nutrio
//
//  Created by Hari's Mac on 10.08.2025.
//

import Foundation
import SwiftUI

struct BestSellingFullView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView(showsIndicators: false){
            // Here we add some prelisted products using product card
            LazyVGrid(columns: columns, alignment: .leading, spacing: 8){
                ForEach(ProductManagerFirebase.shared.BestSellingProducts, id: \.self){ item in
                    NavigationLink{
                        ProductView(product: item)
                    }label:{
                        ProductCard(imagename: item.image, title: item.name, amount: item.amount, price: item.price)
                            .foregroundStyle(.black)
                    }
                }
            }
            .padding()
            .navigationTitle("Best Selling")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

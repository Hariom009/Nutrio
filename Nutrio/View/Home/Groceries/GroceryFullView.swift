//
//  GroceryFullView.swift
//  Nutrio
//
//  Created by Hari's Mac on 10.08.2025.
//

import Foundation
import SwiftUI

struct GroceryFullView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    let subCategory: String
    let title: String
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, alignment: .leading, spacing: 8) {
                ForEach(
                    ProductManagerFirebase.shared.products.filter { $0.subCategory == subCategory },
                    id: \.productuid
                ) { item in
                    NavigationLink {
                        ProductView(product: item)
                    } label: {
                        ProductCard(
                            imagename: item.image,
                            title: item.name,
                            amount: item.amount,
                            price: item.price
                        )
                        .foregroundStyle(.black)
                    }
                }
            }
            .padding()
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

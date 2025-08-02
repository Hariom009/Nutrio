//
//  CartView.swift
//  Nutrio
//
//  Created by Hari's Mac on 20.07.2025.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var CartManager: CartManager
    var body: some View {
        VStack{
            ScrollView(showsIndicators: false){
                ForEach(CartManager.cartItemsAdded,id: \.self){ product in
                    if product == product {
                        VStack(alignment: .leading, spacing: 10) {
        
                            FavouriteTab(product: product)
                            
                            Divider()
                                .frame(height: 0.5)
                                .padding(.leading, 30)
                                .padding(.trailing, 30)
                                .background(Color.clear)
                        }
                    }
                }
            }
            Button{
                
            }label: {
                RoundCapsuleButton(title: "Go to Checkout")
            }
        }
    }
}

#Preview {
    CartView(CartManager: CartManager())
}

//
//  FavoriteView.swift
//  Nutrio
//
//  Created by Hari's Mac on 20.07.2025.
//

import SwiftUI

struct FavoriteView: View {
    var body: some View {
        VStack{
            ScrollView(showsIndicators: false){
                ForEach(sampleProducts,id: \.self){ product in
                    if product.favourite {
                        VStack(alignment: .leading, spacing: 10) {
                            NavigationLink{
                              ProductView(product: product)
                            }label:{
                                FavouriteTab(product: product)
                                    .foregroundStyle(.black)
                            }

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
                RoundCapsuleButton(title: "Add All To Cart")
            }
        }
    }
}

#Preview {
    FavoriteView()
}

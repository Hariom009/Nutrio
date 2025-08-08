//
//  ProductView.swift
//  Nutrio
//
//  Created by Hari's Mac on 24.07.2025.
//

import SwiftUI

struct ProductView: View {
    @State var product: Product!
    @State private var isFavorite = false
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
    
    ScrollView(showsIndicators: false){
        ZStack{
                VStack(spacing: 36){
                    Image("\(product.image)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 330, height: 200)
                        .padding(.top, 80) // More space at the top
                       // .padding(.top, 40)
                    HStack{
                        VStack(alignment: .leading){
                            Text("\(product.name)")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.black)
                            Text("\(product.amount) Price")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            
                        }
                        Spacer()
                        Button {
                            guard let userID = authViewModel.userSession?.uid else { return }
                            if !isFavorite{
                               FavouriteManager.shared.addFavourite(product, userID: userID)
                                isFavorite = true
                            }else{
                                Task{
                                    await FavouriteManager.shared.deleteFavourite(product, userID: userID)
                                }
                                isFavorite = false
                            }
                        } label: {
                            Image(systemName: isFavorite ? "heart.fill" : "heart")
                                .foregroundStyle(.black)
                                .font(.title)
                        }


                    }
                    HStack(spacing: 24){
                        Button{
                            
                        }label:{
                            Image(systemName: "minus")
                                .foregroundStyle(.gray)
                                .font(.headline)
                        }
                        Text("1")
                            .font(.headline)
                            .foregroundStyle(.black)
                            .padding(.horizontal,16)
                            .padding(.vertical,12)
                            .background(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color.black, lineWidth: 0.3)
                            )
                        Button{
                            
                        }label:{
                            Image(systemName: "plus")
                                .foregroundStyle(.green)
                                .font(.headline)
                        }
                        Spacer()
                        
                        Text("$\(product.price,specifier: "%.2f")")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                    }
                    VStack(alignment: .leading){
                        Text("Product Detail")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                        Text("Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        
                    }
                    HStack{
                        Text("Nutrition")
                            .font(.headline)
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                        Spacer()
                        Text("100 grams")
                        Button{
                            
                        }label: {
                            Image(systemName: "chevron.right")
                                .font(.subheadline)
                                .foregroundStyle(.black)
                            
                        }
                    }
                    HStack{
                        Text("Review")
                            .font(.headline)
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                        Spacer()
                        Text("5 stars")
                        Button{
                            
                        }label: {
                            Image(systemName: "chevron.right")
                                .font(.subheadline)
                                .foregroundStyle(.black)
                            
                        }
                    }
                    RoundCapsuleButton(title: "Add to Basket")
                }
                .padding()
            }
        }
    .onAppear {
        Task {
            if let userID = authViewModel.currentUser?.uid {
                isFavorite = await FavouriteManager.shared.checkProductIsFavourite(product, userID: userID)
            }
        }
    }
  }
}

#Preview {
    ProductView()
}

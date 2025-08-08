//
//  FavoriteView.swift
//  Nutrio
//
//  Created by Hari's Mac on 20.07.2025.
//

import SwiftUI
struct FavoriteView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject private var favouriteManager = FavouriteManager.shared

    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                ForEach(favouriteManager.favourites, id: \.self) { product in
                    VStack(alignment: .leading, spacing: 10) {
                        NavigationLink {
                            ProductView(product: product)
                        } label: {
                            FavouriteTab(product: product)
                                .foregroundStyle(.black)
                        }

                        Divider()
                            .frame(height: 0.5)
                            .padding(.horizontal, 30)
                            .background(Color.clear)
                    }
                }
            }

            Button {
                guard let userID = authViewModel.currentUser?.uid else {
                    return
                }
                Task {
                    await favouriteManager.loadFavourites(userId: userID)
                }
            } label: {
                RoundCapsuleButton(title: "Add All To Cart")
            }
        }
        .onAppear {
            guard let userID = authViewModel.currentUser?.uid else { return }
            Task {
                await favouriteManager.loadFavourites(userId: userID)
            }
        }
    }
}

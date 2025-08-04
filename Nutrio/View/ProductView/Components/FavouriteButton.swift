////
////  FavouriteButton.swift
////  Nutrio
////
////  Created by Hari's Mac on 04.08.2025.
////
//
//import Foundation
//import SwiftUI
//import FirebaseAuth
//
//struct FavoriteHeartButton: View {
//    let product: Product
//    @StateObject private var favoritesManager = FavoritesManager()
//    @State private var isFavorite = false
//    @State private var isAnimating = false
//    @State private var isProcessing = false
//    
//    var body: some View {
//        Button(action: {
//            toggleFavorite()
//        }) {
//            ZStack {
//                // Background circle for better tap area
//                Circle()
//                    .fill(Color.clear)
//                    .frame(width: 44, height: 44)
//                
//                Image(systemName: isFavorite ? "heart.fill" : "heart")
//                    .font(.system(size: 20, weight: .medium))
//                    .foregroundColor(isFavorite ? .red : .gray)
//                    .scaleEffect(isAnimating ? 1.3 : 1.0)
//                    .opacity(isProcessing ? 0.6 : 1.0)
//            }
//        }
//        .disabled(isProcessing)
//        .buttonStyle(PlainButtonStyle())
//        .onAppear {
//            Task {
//                await checkFavoriteStatus()
//            }
//        }
//        .animation(.easeInOut(duration: 0.1), value: isAnimating)
//    }
//    
//    // MARK: - Helper Methods
//    private func toggleFavorite() {
//        guard !isProcessing else { return }
//        
//        isProcessing = true
//        isAnimating = true
//        
//        // Haptic feedback
//        let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
//        impactFeedback.impactOccurred()
//        
//        Task {
//            do {
//                try await favoritesManager.toggleFavorite(product: product)
//                await checkFavoriteStatus()
//            } catch {
//                print("Error toggling favorite: \(error)")
//            }
//            
//            await MainActor.run {
//                isProcessing = false
//                isAnimating = false
//            }
//        }
//    }
//    
//    private func checkFavoriteStatus() async {
//        guard let userId = Auth.auth().currentUser?.uid,
//              let productId = product.id else {
//            await MainActor.run {
//                isFavorite = false
//            }
//            return
//        }
//        
//        let favoriteStatus = await favoritesManager.checkIfFavorite(productId: productId, userId: userId)
//        await MainActor.run {
//            isFavorite = favoriteStatus
//        }
//    }
//}

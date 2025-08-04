//import SwiftUI
//import FirebaseFirestore
//import FirebaseFirestore
//
//@MainActor
//class FavoritesManager: ObservableObject {
//    static let shared = FavoritesManager()
//    
//    @Published var favoriteProducts: [Product] = []
//    @Published var isLoading = false
//    
//    private let db = Firestore.firestore()
//    
//    private init() {}
//    
//    // MARK: - Add Favorite
//    func addFavorite(productId: String, userId: String) async throws {
//      let favorite = UserFavorite(userId: userId, productId: productId, dateAdded: .now)
//      try await db.collection("user_favourites")
//                  .addDocument(from: favorite)
//    }
//
//    
//    // MARK: - Remove Favorite
//    func removeFavorite(productId: String, userId: String) async throws {
//        let query = db.collection("user_favorites")
//            .whereField("userId", isEqualTo: userId)
//            .whereField("productId", isEqualTo: productId)
//        
//        let snapshot = try await query.getDocuments()
//        
//        for document in snapshot.documents {
//            try await document.reference.delete()
//        }
//    }
//    
//    func isProductFavorite(_ productId: String, for userId: String) async -> Bool {
//        do {
//            let snapshot = try await db.collection("user_favorites")
//                .whereField("userId", isEqualTo: userId)
//                .whereField("productId", isEqualTo: productId)
//                .getDocuments()
//
//            return !snapshot.documents.isEmpty
//        } catch {
//            print("🔥 Failed to check if product is favorite: \(error)")
//            return false
//        }
//    }
//
//    
//    // MARK: - Load All Favorites
//    func loadUserFavorites(userId: String) async throws {
//        isLoading = true
//        defer { isLoading = false }
//        
//        let favoritesQuery = db.collection("user_favorites")
//            .whereField("userId", isEqualTo: userId)
//        
//        let favoritesSnapshot = try await favoritesQuery.getDocuments()
//        let favoriteProductIds = favoritesSnapshot.documents.compactMap {
//            try? $0.data(as: UserFavorite.self).productId
//        }
//        
//        if !favoriteProductIds.isEmpty {
//            let productsQuery = db.collection("products")
//                .whereField(FieldPath.documentID(), in: favoriteProductIds)
//            
//            let productsSnapshot = try await productsQuery.getDocuments()
//            let products = productsSnapshot.documents.compactMap { doc in
//                var product = try? doc.data(as: Product.self)
//                product?.favourite = true
//                return product
//            }
//            self.favoriteProducts = products
//        } else {
//            self.favoriteProducts = []
//        }
//    }
//}

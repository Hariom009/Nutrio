import Foundation
import Firebase
import FirebaseFirestore
import SwiftUI


class FavouriteManager: ObservableObject {
    static let shared = FavouriteManager()

    @Published var favourites: [Product] = []

    func addFavourite(_ product: Product, userID: String){
        let db = Firestore.firestore()
        let userFavourite = UserFavorite(userId: userID, product: product)

        do {
            try db.collection("favourites").addDocument(from: userFavourite)
            print("New favourite product is added")
        } catch {
            print("Failed to add product as favourite: \(error.localizedDescription)")
        }
    }
    
    func checkProductIsFavourite(_ product: Product, userID: String) async -> Bool {
        let db = Firestore.firestore()
        
        do {
            let snapshot = try await db.collection("favourites")
                .whereField("userId", isEqualTo: userID)
                .whereField("product.name", isEqualTo: product.name)
                .getDocuments()
            
            return !snapshot.documents.isEmpty
        } catch {
            print("Error checking favourite status: \(error.localizedDescription)")
            return false
        }
    }
    func deleteFavourite(_ product: Product, userID: String) async{
        let db = Firestore.firestore()
        
        do {
            let snapshot = try await db.collection("favourites")
                .whereField("userId", isEqualTo: userID)
                .whereField("product.name", isEqualTo: product.name)
                .getDocuments()
            
            for document in snapshot.documents {
             if let fav = try? document.data(as: UserFavorite.self) {
                    try await db.collection("favourites").document(document.documentID).delete()
                 print("\(product.name) as favourite is deleted")
                }
            }
        }catch{
           print("Couldn't delete product that is added as favourite: \(error)")
        }
    }

    func loadFavourites(userId: String) async {
        DispatchQueue.main.async {
            self.favourites.removeAll()
        }
        let db = Firestore.firestore()
        do {
            let snapshot = try await db.collection("favourites")
                .whereField("userId", isEqualTo: userId)
                .getDocuments()

            for document in snapshot.documents {
                if let fav = try? document.data(as: UserFavorite.self) {
                    DispatchQueue.main.async {
                        self.favourites.append(fav.product)
                        print("Fetched favourite: \(fav.product.name)")
                    }
                }
            }
        } catch {
            print("Couldn't load the data from firestore: \(error)")
        }
    }
}

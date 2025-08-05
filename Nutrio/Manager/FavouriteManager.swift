import Foundation
import Firebase
import FirebaseFirestore
import SwiftUI


class FavouriteManager{
    static let shared = FavouriteManager()
    
    @State var favourites: [UserFavorite] = []
    
    private init(){
        loadFavourites()
    }
    
    func loadFavourites() {
        favourites.removeAll()
        let db = Firestore.firestore()
        db.collection("favourites").getDocuments { (snapshot, error) in
            if let error = error {
                print("❌ Error loading favourites: \(error.localizedDescription)")
                return
            }
            
            self.favourites = snapshot?.documents.compactMap { doc in
                try? doc.data(as: UserFavorite.self)
            } ?? []
            
            print("✅ Loaded \(self.favourites.count) favourite lists.")
        }
    }

    private func fetchFavouriteDocument(for userID: String, completion: @escaping (QueryDocumentSnapshot?, UserFavorite?) -> Void) {
        let db = Firestore.firestore()
        let ref = db.collection("favourites").whereField("userId", isEqualTo: userID)
        
        ref.getDocuments { snapshot, error in
            if let error = error {
                print("❌ Error fetching favourites: \(error.localizedDescription)")
                completion(nil, nil)
                return
            }
            
            guard let document = snapshot?.documents.first else {
                completion(nil, nil)
                return
            }
            
            do {
                let favourite = try document.data(as: UserFavorite.self)
                completion(document, favourite)
            } catch {
                print("❌ Error decoding favourite: \(error.localizedDescription)")
                completion(nil, nil)
            }
        }
    }
    private func createFavouriteDocument(for userID: String, with product: Product) {
        let db = Firestore.firestore()
        let newFavourite = UserFavorite(userId: userID, products: [product], dateAdded: Date())

        do {
            try db.collection("favourites").addDocument(from: newFavourite)
            print("✅ Created new favourites list for user \(userID)")
        } catch {
            print("❌ Error creating favourites: \(error.localizedDescription)")
        }
    }
    private func updateFavouriteDocument(_ document: QueryDocumentSnapshot, with product: Product, existingFavourite: inout UserFavorite) {
        guard !existingFavourite.products.contains(where: { $0.id == product.id }) else {
            print("⚠️ Product already in favourites.")
            return
        }

        existingFavourite.products.append(product)

        do {
            // Encode array of products manually
            let encodedProducts = try existingFavourite.products.map { try Firestore.Encoder().encode($0) }

            document.reference.setData([
                "products": encodedProducts
            ], merge: true)

            print("✅ Added product to existing favourites.")
        } catch {
            print("❌ Error updating favourites: \(error.localizedDescription)")
        }
    }


    func addFavourite(product: Product, userID: String) {
        fetchFavouriteDocument(for: userID) { document, existingFavourite in
            if let document = document, var favourite = existingFavourite {
                self.updateFavouriteDocument(document, with: product, existingFavourite: &favourite)
            } else {
                self.createFavouriteDocument(for: userID, with: product)
            }
        }
    }
    
    func checkIfFavourite(productId: String, userID: String) -> Bool {
        for favourite in favourites {
            if favourite.userId == userID {
                return favourite.products.contains(where: { $0.id == productId })
            }
        }
        return false
    }
    
    func removeProductFromFavourites(userID: String, productID: String, completion: @escaping (Bool) -> Void) {
        let db = Firestore.firestore()
        let userFavsRef = db.collection("favourites").whereField("userId", isEqualTo: userID)

        userFavsRef.getDocuments { (snapshot, error) in
            if let error = error {
                print("❌ Error fetching favourites: \(error.localizedDescription)")
                completion(false)
                return
            }

            guard let document = snapshot?.documents.first else {
                print("⚠️ No favourites found for user.")
                completion(false)
                return
            }

            do {
                var favourite = try document.data(as: UserFavorite.self)

                // Filter out the product
                favourite.products.removeAll { $0.id == productID }

                let encodedProducts = try favourite.products.map { try Firestore.Encoder().encode($0) }

                document.reference.setData([
                    "products": encodedProducts
                ], merge: true) { error in
                    if let error = error {
                        print("❌ Error updating favourites: \(error.localizedDescription)")
                        completion(false)
                    } else {
                        print("✅ Product removed from favourites.")
                        completion(true)
                    }
                }

            } catch {
                print("❌ Error decoding or updating favourites: \(error.localizedDescription)")
                completion(false)
            }
        }
    }

//    func deleteField(
//        productID: String,
//        fieldName: String,
//        userID : String,
//        completion: @escaping (Bool) -> Void
//    ) {
//        let db = Firestore.firestore()
//        
//        db.collection("favourites")
//          .document(userID)
//          .updateData([
//              fieldName: FieldValue.delete()
//          ]) { error in
//              if let error = error {
//                  print("❌ Error deleting field '\(fieldName)': \(error.localizedDescription)")
//                  completion(false)
//              } else {
//                  print("✅ Field '\(fieldName)' deleted successfully from document \(documentID).")
//                  completion(true)
//              }
//          }
//    }
}

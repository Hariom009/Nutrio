import Foundation
import SwiftUI
import FirebaseFirestore

struct Product: Identifiable, Codable, Hashable {
    @DocumentID var id: String? // Let Firestore generate the ID if needed

    let name: String
    let price: Double
    let amount: String
    let image: String
    let ProductType: String
    let subCategory: String
    var favourite: Bool

    // Optional init if needed (but Swift will synthesize one automatically)
    init(id: String? = nil, name: String, price: Double, amount: String, image: String, ProductType: String, subCategory: String, favourite: Bool) {
        self.id = id
        self.name = name
        self.price = price
        self.amount = amount
        self.image = image
        self.ProductType = ProductType
        self.subCategory = subCategory
        self.favourite = favourite
    }
}

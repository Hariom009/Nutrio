

import Foundation
import SwiftUI

struct Product: Identifiable, Hashable{
    var id: ObjectIdentifier
    let name: String
    let price: Double
    let amount: String
    let image: String
    let ProductType: String
    let subCategory: String
    var favourite: Bool // ✅ Newly added

    init(id: ObjectIdentifier, name: String, price: Double, amount: String, image: String, ProductType: String, subCategory: String, favourite: Bool) {
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

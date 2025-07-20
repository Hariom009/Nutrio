//
//  Product.swift
//  Nutrio
//
//  Created by Hari's Mac on 20.07.2025.
//

import Foundation
import SwiftUI

struct Product: Identifiable{
    var id: ObjectIdentifier
    let name: String
    let price: Double
    let amount: Int
    let image: String
    let ProductType: String
    let subCategory:String
    init(id: ObjectIdentifier, name: String, price: Double, amount: Int, image: String, ProductType: String, subCategory:String) {
        self.id = id
        self.name = name
        self.price = price
        self.amount = amount
        self.image = image
        self.ProductType = ProductType
        self.subCategory = subCategory
    }
}

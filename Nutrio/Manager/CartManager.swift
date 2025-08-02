
import Foundation
import SwiftUI

class CartManager: ObservableObject {
 
    @Published var cartItemsAdded:[Product] = []
    @Published var totalItemsInCart:Int = 0
    
    func addToCart(_ product:Product){
        cartItemsAdded.append(product)
        totalItemsInCart += 1
    }
    func removeFromCart(_ product:Product){
        cartItemsAdded = cartItemsAdded.filter{$0.id != product.id}
        totalItemsInCart -= 1
    }
}

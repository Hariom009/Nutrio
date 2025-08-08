//  ProductManagerFirebase.swift
//  Nutrio
//
//  Created by Hari's Mac on 04.08.2025.
//

import Foundation
import SwiftUI
import FirebaseFirestore

public class ProductManagerFirebase: ObservableObject {
    @Published var products: [Product] = [

        // Soft Drinks
        Product(productuid: UUID(), name: "Diet Coca Cola", price: 1.5, amount: "375 ml", image: "diet_coke", ProductType: "Soft Drink", subCategory: "Carbonated", favourite: true),
        Product(productuid: UUID(), name: "Pepsi", price: 1.4, amount: "375 ml", image: "Pepsi Can", ProductType: "Soft Drink", subCategory: "Carbonated", favourite: false),
        Product(productuid: UUID(), name: "Sprite", price: 1.3, amount: "375 ml", image: "sprite_can", ProductType: "Soft Drink", subCategory: "Carbonated", favourite: true),

        // Grocery - Pulses
        Product(productuid: UUID(), name: "Red Lentils", price: 2.0, amount: "500 gram", image: "red_lentils", ProductType: "Grocery", subCategory: "Pulses", favourite: false),
        Product(productuid: UUID(), name: "Green Gram", price: 2.5, amount: "1 kg", image: "green_gram", ProductType: "Grocery", subCategory: "Pulses", favourite: true),
        Product(productuid: UUID(), name: "Rice", price: 2.5, amount: "5 kg", image: "rice", ProductType: "Grocery", subCategory: "Grain", favourite: false),

        // Grocery - Vegetables
        Product(productuid: UUID(), name: "Tomato", price: 0.5, amount: "1 kg", image: "tomato", ProductType: "Grocery", subCategory: "Vegetable", favourite: true),
        Product(productuid: UUID(), name: "Potato", price: 0.3, amount: "1 kg", image: "potato", ProductType: "Grocery", subCategory: "Vegetable", favourite: false),

        // Grocery - Oil & Flour
        Product(productuid: UUID(), name: "Sunflower Oil", price: 5.0, amount: "1 lt", image: "sunflower_oil", ProductType: "Grocery", subCategory: "Oil", favourite: false),
        Product(productuid: UUID(), name: "Wheat Flour", price: 3.0, amount: "5 kg", image: "wheat_flour", ProductType: "Grocery", subCategory: "Flour", favourite: true),

        // Fruits
        Product(productuid: UUID(), name: "Red Apple", price: 2.2, amount: "1 kg", image: "apple_red", ProductType: "Fruit", subCategory: "Fresh Fruit", favourite: true),
        Product(productuid: UUID(), name: "Organic Bananas", price: 1.0, amount: "12 pcs", image: "Organic Bananas", ProductType: "Fruit", subCategory: "Fresh Fruit", favourite: true),

        // Juices
        Product(productuid: UUID(), name: "Orange Juice", price: 2.5, amount: "1 pcs", image: "orange_juice", ProductType: "Juice", subCategory: "Fruit Juice", favourite: true),
        Product(productuid: UUID(), name: "Mango Juice", price: 2.7, amount: "1 pcs", image: "mango_juice", ProductType: "Juice", subCategory: "Fruit Juice", favourite: false),
        Product(productuid: UUID(), name: "Apple Grape Juice", price: 3.0, amount: "1 pcs", image: "juice_apple_grape", ProductType: "Juice", subCategory: "Fruit Juice", favourite: false),
        Product(productuid: UUID(), name: "Coconut Water", price: 3.0, amount: "1", image: "coconut_water", ProductType: "Juice", subCategory: "Fruit Juice", favourite: false),

        // Egg & Noodles
        Product(productuid: UUID(), name: "Egg Chicken Red", price: 1.8, amount: "12", image: "Egg Chicken Red", ProductType: "Grocery", subCategory: "Eggs", favourite: false),
        Product(productuid: UUID(), name: "Egg Chicken White", price: 1.8, amount: "12", image: "egg_chicken_white", ProductType: "Grocery", subCategory: "eggs", favourite: true),
        Product(productuid: UUID(), name: "Egg Noodles New", price: 1.8, amount: "2 pcs", image: "egg_noodies_new", ProductType: "Grocery", subCategory: "eggs", favourite: false),

        // Noodles
        Product(productuid: UUID(), name: "Egg Noodles", price: 1.8, amount: "1 pcs", image: "egg_noodles", ProductType: "Grocery", subCategory: "Noodles", favourite: true),
        Product(productuid: UUID(), name: "Egg Pasta", price: 1.8, amount: "1 pcs", image: "egg_pasta", ProductType: "Grocery", subCategory: "Noodles", favourite: false),

        // Meat
        Product(productuid: UUID(), name: "Chicken Breast", price: 6.0, amount: "1 kg", image: "Broiler Chicken", ProductType: "Meat", subCategory: "chicken", favourite: true),
        Product(productuid: UUID(), name: "Broiler Chicken", price: 2.4, amount: "1 kg", image: "Broiler Chicken", ProductType: "Grocery", subCategory: "chicken", favourite: false),
        Product(productuid: UUID(), name: "Beef Bone", price: 2.4, amount: "1 kg", image: "beef_bone", ProductType: "Grocery", subCategory: "chicken", favourite: true),
        Product(productuid: UUID(), name: "Fish meat", price: 3.0, amount: "1 kg", image: "meat_fish", ProductType: "Grocery", subCategory: "chicken", favourite: false),

        // Vegetables
        Product(productuid: UUID(), name: "Bell Pepper Red", price: 1.99, amount: "250 gm", image: "Bell Pepper Red", ProductType: "Grocery", subCategory: "vegetable", favourite: true),
        Product(productuid: UUID(), name: "Ginger", price: 1.8, amount: "250 gm", image: "Ginger", ProductType: "Grocery", subCategory: "vegetable", favourite: false)
    ]
    
    @Published var BestSellingProducts: [Product] = [
        Product(productuid: UUID(), name: "Red Apple", price: 2.2, amount: "1 kg", image: "apple_red", ProductType: "Fruit", subCategory: "Fresh Fruit", favourite: true),
        Product(productuid: UUID(), name: "Rice", price: 2.5, amount: "5 kg", image: "rice", ProductType: "Grocery", subCategory: "Grain", favourite: false),
        Product(productuid: UUID(), name: "Pepsi", price: 1.4, amount: "375 ml", image: "Pepsi Can", ProductType: "Soft Drink", subCategory: "Carbonated", favourite: false),
        Product(productuid: UUID(), name: "Sunflower Oil", price: 5.0, amount: "1 lt", image: "sunflower_oil", ProductType: "Grocery", subCategory: "Oil", favourite: false)
    ]

    @Published var OnSaleProducts: [Product] = [
        Product(productuid: UUID(), name: "Mango Juice", price: 2.7, amount: "1 pcs", image: "mango_juice", ProductType: "Juice", subCategory: "Fruit Juice", favourite: false),
        Product(productuid: UUID(), name: "Potato", price: 0.3, amount: "1 kg", image: "potato", ProductType: "Grocery", subCategory: "Vegetable", favourite: false),
        Product(productuid: UUID(), name: "Egg Noodles", price: 1.8, amount: "1 pcs", image: "egg_noodles", ProductType: "Grocery", subCategory: "Noodles", favourite: true),
        Product(productuid: UUID(), name: "Coconut Water", price: 3.0, amount: "1", image: "coconut_water", ProductType: "Juice", subCategory: "Fruit Juice", favourite: false)
    ]

    static let shared = ProductManagerFirebase()
    
    func uploadSampleProducts() {
        let db = Firestore.firestore()
        for product in products {
            do {
                try db.collection("products").document().setData(from: product)
            } catch {
                print("Failed to upload product: \(error)")
            }
        }
    }
    
    func uploadBestSellingProducts() {
        let db = Firestore.firestore()
        for product in BestSellingProducts {
            do {
                try db.collection("BestSellingProducts").document().setData(from: product)
            } catch {
                print("Failed to upload product: \(error)")
            }
        }
    }

    func uploadOnSaleProducsts() {
        let db = Firestore.firestore()
        for product in OnSaleProducts {
            do {
                try db.collection("OnSaleProducts").document().setData(from: product)
            } catch {
                print("Failed to upload product: \(error)")
            }
        }
    }

    func loadProducts() {
        let db = Firestore.firestore()
        db.collection("products").getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching products: \(error)")
                return
            }

            self.products = snapshot?.documents.compactMap {
                try? $0.data(as: Product.self)
            } ?? []
        }
    }

    func fetchProduct(productName: String, productID: String) async throws -> Product? {
        let db = Firestore.firestore()
        
        let snapshot = try await db.collection("products")
            .whereField("name", isEqualTo: productName)
            .getDocuments()
        
        for document in snapshot.documents {
            let data = document.data()
            if let name = data["name"] as? String,
               let price = data["price"] as? Double,
               let amount = data["amount"] as? String,
               let image = data["image"] as? String,
               let productType = data["ProductType"] as? String,
               let subCategory = data["subCategory"] as? String,
               let favourite = data["favourite"] as? Bool,
               let productuidStr = data["productuid"] as? String,
               let productuid = UUID(uuidString: productuidStr) {

                return Product(productuid: productuid, name: name, price: price, amount: amount, image: image, ProductType: productType, subCategory: subCategory, favourite: favourite)
            }
        }
        return nil
    }
    
    
    func searchProducts(query: String) async throws -> [Product] {
        let db = Firestore.firestore()
        
        let snapshot = try await db.collection("products")
            .whereField("name", isGreaterThanOrEqualTo: query)
            .whereField("name", isLessThan: query + "\u{f8ff}")
            .getDocuments()
        
        return snapshot.documents.compactMap { doc in
            try? doc.data(as: Product.self)
        }
    }
   
}

//
//  SampleData.swift
//  Nutrio
//
//  Created by Hari's Mac on 26.07.2025.
//

import Foundation
import SwiftUI
let sampleProducts: [Product] = [
    // Soft Drinks
    Product(id: ObjectIdentifier(Product.self), name: "Diet Coca Cola", price: 1.5, amount: "375 ml", image: "diet_coke", ProductType: "Soft Drink", subCategory: "Carbonated", favourite: true),
    Product(id: ObjectIdentifier(Product.self), name: "Pepsi", price: 1.4, amount: "375 ml", image: "Pepsi Can", ProductType: "Soft Drink", subCategory: "Carbonated", favourite: false),
    Product(id: ObjectIdentifier(Product.self), name: "Sprite", price: 1.3, amount: "375 ml", image: "sprite_can", ProductType: "Soft Drink", subCategory: "Carbonated", favourite: true),

    // Grocery - Pulses
    Product(id: ObjectIdentifier(Product.self), name: "Red Lentils", price: 2.0, amount: "500 gram", image: "red_lentils", ProductType: "Grocery", subCategory: "Pulses", favourite: false),
    Product(id: ObjectIdentifier(Product.self), name: "Green Gram", price: 2.5, amount: "1 kg", image: "green_gram", ProductType: "Grocery", subCategory: "Pulses", favourite: true),
    Product(id: ObjectIdentifier(Product.self), name: "Rice", price: 2.5, amount: "5 kg", image: "rice", ProductType: "Grocery", subCategory: "Grain", favourite: false),

    // Grocery - Vegetables
    Product(id: ObjectIdentifier(Product.self), name: "Tomato", price: 0.5, amount: "1 kg", image: "tomato", ProductType: "Grocery", subCategory: "Vegetable", favourite: true),
    Product(id: ObjectIdentifier(Product.self), name: "Potato", price: 0.3, amount: "1 kg", image: "potato", ProductType: "Grocery", subCategory: "Vegetable", favourite: false),

    // Grocery - Oil & Flour
    Product(id: ObjectIdentifier(Product.self), name: "Sunflower Oil", price: 5.0, amount: "1 lt", image: "sunflower_oil", ProductType: "Grocery", subCategory: "Oil", favourite: false),
    Product(id: ObjectIdentifier(Product.self), name: "Wheat Flour", price: 3.0, amount: "5 kg", image: "wheat_flour", ProductType: "Grocery", subCategory: "Flour", favourite: true),

    // Fruits
    Product(id: ObjectIdentifier(Product.self), name: "Red Apple", price: 2.2, amount: "1 kg", image: "apple_red", ProductType: "Fruit", subCategory: "Fresh Fruit", favourite: true),
    Product(id: ObjectIdentifier(Product.self), name: "Organic Bananas", price: 1.0, amount: "12 pcs", image: "Organic Bananas", ProductType: "Fruit", subCategory: "Fresh Fruit", favourite: true),

    // Juices
    Product(id: ObjectIdentifier(Product.self), name: "Orange Juice", price: 2.5, amount: "1 pcs", image: "orange_juice", ProductType: "Juice", subCategory: "Fruit Juice", favourite: true),
    Product(id: ObjectIdentifier(Product.self), name: "Mango Juice", price: 2.7, amount: "1 pcs", image: "mango_juice", ProductType: "Juice", subCategory: "Fruit Juice", favourite: false),
    Product(id: ObjectIdentifier(Product.self), name: "Apple Grape Juice", price: 3.0, amount: "1 pcs", image: "juice_apple_grape", ProductType: "Juice", subCategory: "Fruit Juice", favourite: false),
    Product(id: ObjectIdentifier(Product.self), name: "Coconut Water", price: 3.0, amount: "1", image: "coconut_water", ProductType: "Juice", subCategory: "Fruit Juice", favourite: false),

    // Egg & Noodles
    Product(id: ObjectIdentifier(Product.self), name: "Egg Chicken Red", price: 1.8, amount: "12", image: "Egg Chicken Red", ProductType: "Grocery", subCategory: "Eggs", favourite: false),
    Product(id: ObjectIdentifier(Product.self), name: "Egg Chicken White", price: 1.8, amount: "12", image: "egg_chicken_white", ProductType: "Grocery", subCategory: "eggs", favourite: true),
    Product(id: ObjectIdentifier(Product.self), name: "Egg Noodles New", price: 1.8, amount: "2 pcs", image: "egg_noodies_new", ProductType: "Grocery", subCategory: "eggs", favourite: false),
    
    // Noodles
    Product(id: ObjectIdentifier(Product.self), name: "Egg Noodles", price: 1.8, amount: "1 pcs", image: "egg_noodles", ProductType: "Grocery", subCategory: "Noodles", favourite: true),
    Product(id: ObjectIdentifier(Product.self), name: "Egg Pasta", price: 1.8, amount: "1 pcs", image: "egg_pasta", ProductType: "Grocery", subCategory: "Noodles", favourite: false),

    // Meat
    Product(id: ObjectIdentifier(Product.self), name: "Chicken Breast", price: 6.0, amount: "1 kg", image: "Broiler Chicken", ProductType: "Meat", subCategory: "chicken", favourite: true),
    Product(id: ObjectIdentifier(Product.self), name: "Broiler Chicken", price: 2.4, amount: "1 kg", image: "Broiler Chicken", ProductType: "Grocery", subCategory: "chicken", favourite: false),
    Product(id: ObjectIdentifier(Product.self), name: "Beef Bone", price: 2.4, amount: "1 kg", image: "beef_bone", ProductType: "Grocery", subCategory: "chicken", favourite: true),
    Product(id: ObjectIdentifier(Product.self), name: "Fish meat", price: 3.0, amount: "1 kg", image: "meat_fish", ProductType: "Grocery", subCategory: "chicken", favourite: false),

    // Vegetables
    Product(id: ObjectIdentifier(Product.self), name: "Bell Pepper Red", price: 1.99, amount: "250 gm", image: "Bell Pepper Red", ProductType: "Grocery", subCategory: "vegetable", favourite: true),
    Product(id: ObjectIdentifier(Product.self), name: "Ginger", price: 1.8, amount: "250 gm", image: "Ginger", ProductType: "Grocery", subCategory: "vegetable", favourite: false)
]

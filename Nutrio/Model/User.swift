//
//  User.swift
//  Nutrio
//
//  Created by Hari's Mac on 17.06.2025.
//

import Foundation

struct User: Codable{
    let uid: String
    let email: String
    let fullname: String

    var initials:String{
        let formatters = PersonNameComponentsFormatter()
       if let components = formatters.personNameComponents(from: fullname){
            formatters.style = .abbreviated
            return formatters.string(from: components)
        }
        return ""
    }
}

struct Favourite:Identifiable{
    let userId: String
    let id: String
    let name: String
    let price: Double
    let amount: String
    let image: String
    let ProductType: String
    let subCategory: String
    let favourite: Bool
}

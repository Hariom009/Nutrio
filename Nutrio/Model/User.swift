//
//  User.swift
//  Nutrio
//
//  Created by Hari's Mac on 17.06.2025.
//

import Foundation
import Firebase
import FirebaseFirestore

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

struct UserFavorite: Identifiable, Codable {
    @DocumentID var id: String?
    let userId: String
    let productId: String
    let dateAdded: Date
}

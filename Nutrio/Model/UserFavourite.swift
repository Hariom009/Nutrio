//
//  UserFavourtie.swift
//  Nutrio
//
//  Created by Hari's Mac on 05.08.2025.
//

import Foundation
import Firebase
import FirebaseFirestore

//struct UserFavorite: Identifiable, Codable {
//    @DocumentID var id: String?
//    let userId: String
//    var products : [Product]
//}

struct UserFavorite: Identifiable, Codable {
    @DocumentID var id: String?
    let userId: String
    let product: Product
}

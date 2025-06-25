//
//  MainViewModel.swift
//  Nutrio
//
//  Created by Hari's Mac on 13.06.2025.
//

import SwiftUI

class MainViewModel: ObservableObject {
    static var shared : MainViewModel = MainViewModel()
    
    @Published var txtEmail : String = ""
    @Published var txtPassword: String = ""
    @Published var showPassword: Bool = false
}

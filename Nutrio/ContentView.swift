//
//  ContentView.swift
//  Nutrio
//
//  Created by Hari's Mac on 18.06.2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
      WelcomeView()
            .environmentObject(authViewModel )
    }
}

#Preview {
    ContentView()
}

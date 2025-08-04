//
//  MainTabView.swift
//  Nutrio
//
//  Created by Hari's Mac on 20.07.2025.
//

import SwiftUI

enum Tab {
    case login
    case home
    case search
    case cart
    case favourite
    case profile
}
struct MainTabView: View {
    @State private var tab: Tab = .home
    @EnvironmentObject var router: Router
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject var cartManager = CartManager()
    
    var body: some View {
        VStack {
            if !authViewModel.authChecked {
                ProgressView("Checking authentication...")
            } else {
                if authViewModel.userSession == nil || authViewModel.currentUser == nil {
                    // Not authenticated → force login tab
                    SignInView()
                } else {
                    VStack {
                        Group {
                            switch tab {
                            case .login:
                                SignInView()
                            case .home:
                                HomeView()
                            case .search:
                                SearchView()
                            case .cart:
                                CartView(CartManager: cartManager)
                            case .favourite:
                                FavoriteView()
                            case .profile:
                                ProfileView()
                            }
                        }
                        if tab != .login {
                            CustomMiniTabBar(selectedTab: $tab)
                        }
                    }
                    .onChange(of: tab) { newTab in
                        if newTab == .profile {
                            if let uid = authViewModel.userSession?.uid {
                                Task { await authViewModel.fetchUser(by: uid) }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct CustomMiniTabBar: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack(spacing: 0) {
            // Left side tabs
            HStack(spacing: 16) {
                tabItem(icon: "store_tab", title: "Shop", tab: .home)
                tabItem(icon: "explore_tab", title: "Explore", tab: .search)
                tabItem(icon: "cart_tab", title: "Cart", tab: .cart)
                tabItem(icon: "fav_tab", title: "Favourite", tab: .favourite)
                tabItem(icon: "account_tab", title: "Account", tab: .profile)
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    @ViewBuilder
    func tabItem(icon:String,title: String, tab: Tab) -> some View {
        Button(action: {
            selectedTab = tab
        }) {
            VStack(spacing: 6) {
                Image("\(icon)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(selectedTab == tab ? .green : .gray)
                Text(title)
                    .font(.system(size: 8, weight: .medium))
                    .foregroundColor(selectedTab == tab ? .green : .gray)
                    .lineLimit(1)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(selectedTab == tab ? .green.opacity(0.15) : .clear)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}


#Preview {
    MainTabView()
}


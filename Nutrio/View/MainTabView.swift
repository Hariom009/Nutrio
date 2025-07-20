//
//  MainTabView.swift
//  Nutrio
//
//  Created by Hari's Mac on 20.07.2025.
//

import SwiftUI

enum Tab {
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
    var body: some View {
        VStack{
            Group{
                switch tab{
                case .home:
                    HomeView()
                case .search:
                    SearchView()
                case .cart:
                    CartView()
                case .favourite:
                    FavoriteView()
                case .profile:
                    ProfileView()
                }
            }
            CustomMiniTabBar(selectedTab: $tab)
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
struct CustomMiniTabBar: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack(spacing: 0) {
            // Left side tabs
            HStack(spacing: 16) {
                tabItem(icon: "house", title: "Shop", tab: .home)
                tabItem(icon: "text.magnifyingglass", title: "Explore", tab: .search)
                tabItem(icon: "cart", title: "Cart", tab: .cart)
                tabItem(icon: "heart", title: "Favourite", tab: .favourite)
                tabItem(icon: "person", title: "Account", tab: .profile)
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
                Image(systemName: icon)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(selectedTab == tab ? .indigo : .gray)
                Text(title)
                    .font(.system(size: 8, weight: .medium))
                    .foregroundColor(selectedTab == tab ? .indigo : .gray)
                    .lineLimit(1)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(selectedTab == tab ? .indigo.opacity(0.1) : .clear)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}


#Preview {
    MainTabView()
}


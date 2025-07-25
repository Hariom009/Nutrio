//
//  CategoryTab.swift
//  Nutrio
//
//  Created by Hari's Mac on 26.07.2025.
//

import SwiftUI
struct CategoryTab: View {
    var categoryTab: CategoryExploreTab
    var body: some View {
        VStack(spacing: 40){
            Image("\(categoryTab.image)")
                .resizable()
                .scaledToFit()
                .frame(width: 110,height: 74)
            Text("\(categoryTab.title)")
                .font(.custom("Gilroy-SemiBold", size: 16))
        }
        .frame(width: 170,height: 190)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(categoryTab.color.opacity(0.3))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(categoryTab.color,style: StrokeStyle(lineWidth: 1))
        )
    }
}

#Preview {
    CategoryTab(categoryTab: CategoryExploreTab(title: "Fresh Fruits & Vegetables", image: "frash_fruits", color: .green.opacity(0.5)))
}

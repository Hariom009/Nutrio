//
//  SearchView.swift
//  Nutrio
//
//  Created by Hari's Mac on 20.07.2025.
//

import SwiftUI

struct CategoryExploreTab:Identifiable,Hashable{
    let id = UUID()
    var title: String
    var image: String
    var color: Color
}
struct SearchView: View {
    @State var searchProduct: String = ""
    let Categories : [CategoryExploreTab] = [
                                            CategoryExploreTab(title: "Fresh Fruits & Vegetables", image: "frash_fruits", color: .green.opacity(0.5)),
                                            CategoryExploreTab(title: "Cooking Oil & Ghee", image: "cooking_oil", color: .yellow.opacity(0.5)),
                                            CategoryExploreTab(title: "Meat & Fish", image: "meat_fish", color: .orange.opacity(0.5)),
                                            CategoryExploreTab(title: "Bakery & Snacks", image: "bakery_snacks", color: .blue.opacity(0.5)),
                                            CategoryExploreTab(title: "Dairy & Eggs", image: "dairy_eggs", color: .purple.opacity(0.5)),
                                            CategoryExploreTab(title: "Beveraes", image: "beverages", color: .red.opacity(0.5)),
                                            CategoryExploreTab(title: "Fruit Juices", image: "frash_fruits", color: .pink.opacity(0.5))]
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 16) {
                // 🔍 Search Bar
                HStack(spacing: 8) {
                    Image("search")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                    
                    TextField("Search Store", text: $searchProduct)
                        .font(.custom("Gilroy-Medium", size: 14))
                        .padding(.horizontal, 12)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 18).fill(Color.gray.opacity(0.2)))

                // 🧱 Grid of CategoryTabs
                ScrollView(showsIndicators: false){
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 16),
                        GridItem(.flexible(), spacing: 16)
                    ], spacing: 16) {
                        ForEach(Categories, id: \.id) { category in
                            CategoryTab(categoryTab: category)
                        }
                    }
                    .padding(.horizontal,8)
                }
            }
            .padding()
        }
        .navigationTitle("Find Products")
        .navigationBarTitleDisplayMode(.inline)
    }

}

#Preview {
    SearchView()
}

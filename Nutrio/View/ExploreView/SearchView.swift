import SwiftUI
import FirebaseFirestore

struct CategoryExploreTab: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var image: String
    var color: Color
}

struct SearchView: View {
    @State private var searchProduct: String = ""
    @State private var searchResults: [Product] = []
    @State private var isLoading: Bool = false
    @FocusState var isFocused:Bool

    let Categories: [CategoryExploreTab] = [
        CategoryExploreTab(title: "Fresh Fruits & Vegetables", image: "frash_fruits", color: .green.opacity(0.5)),
        CategoryExploreTab(title: "Cooking Oil & Ghee", image: "cooking_oil", color: .yellow.opacity(0.5)),
        CategoryExploreTab(title: "Meat & Fish", image: "meat_fish", color: .orange.opacity(0.5)),
        CategoryExploreTab(title: "Bakery & Snacks", image: "bakery_snacks", color: .blue.opacity(0.5)),
        CategoryExploreTab(title: "Dairy & Eggs", image: "dairy_eggs", color: .purple.opacity(0.5)),
        CategoryExploreTab(title: "Beveraes", image: "beverages", color: .red.opacity(0.5)),
        CategoryExploreTab(title: "Fruit Juices", image: "frash_fruits", color: .pink.opacity(0.5))
    ]

    var body: some View {
        NavigationStack {
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
                        .focused($isFocused)
                        .onChange(of: searchProduct) { newValue in
                            if newValue.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || !isFocused {
                                searchResults = []
                            } else {
                                Task {
                                    await searchForProducts()
                                }
                            }
                        }

                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 18).fill(Color.gray.opacity(0.2)))

                // 🔍 Live Search Results
                if !searchResults.isEmpty {
                    ScrollView {
                        VStack(spacing: 12) {
                            ForEach(searchResults, id: \.productuid) { product in
                                NavigationLink(destination: ProductView(product: product)) {
                                    HStack {
                                        Image(product.image)
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                            .cornerRadius(10)
                                        VStack(alignment: .leading) {
                                            Text(product.name)
                                                .fontWeight(.semibold)
                                            Text("₹\(product.price, specifier: "%.2f")")
                                                .foregroundStyle(.gray)
                                                .font(.caption)
                                        }
                                        Spacer()
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.gray.opacity(0.1)))
                                }
                            }
                        }
                    }
                }
                else{
                    ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: [
                            GridItem(.flexible(), spacing: 16),
                            GridItem(.flexible(), spacing: 16)
                        ], spacing: 16) {
                            ForEach(Categories, id: \.id) { category in
                                CategoryTab(categoryTab: category)
                            }
                        }
                        .padding(.horizontal, 8)
                    }
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Find Products")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    func searchForProducts() async {
        let trimmed = searchProduct.trimmingCharacters(in: .whitespaces)

        if trimmed.isEmpty {
            searchResults = []
            return
        }

        isLoading = true
        defer { isLoading = false }

        do {
            let query = trimmed.capitalized
            searchResults = try await ProductManagerFirebase.shared.searchProducts(query: query)
        } catch {
            print("Search error: \(error)")
            searchResults = []
        }
    }
}

#Preview {
    SearchView()
}

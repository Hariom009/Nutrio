import SwiftUI

struct ProductImageView: View {
    var body: some View {
            VStack(spacing: 0) {
                Image("apple_red")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 330, height: 200)
                    .padding(.top, 80) // More space at the top
            }
        }
    }

#Preview {
    ProductImageView()
}

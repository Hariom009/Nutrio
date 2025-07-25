import SwiftUI

struct ProductImageView: View {
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.gray.opacity(0.2))
                .frame(height: 400) // or desired height
                .ignoresSafeArea(edges: .top)

            VStack(spacing: 0) {
                Image("apple_red")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 330, height: 200)
                    .padding(.top, 140) // More space at the top
                Spacer()
                    .frame(height: 10) // Less space at the bottom
            }
        }
        .padding(.bottom, 40)
    }
}

#Preview {
    ProductImageView()
}

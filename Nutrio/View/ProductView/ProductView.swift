//
//  ProductView.swift
//  Nutrio
//
//  Created by Hari's Mac on 24.07.2025.
//

import SwiftUI

struct ProductView: View {
    var body: some View {
        ZStack{
            Color.clear
                .ignoresSafeArea()
            VStack{
              ProductImageView()
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button{
                        
                    }label:{
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100,height: 100)
                    }
                }
            }
        }
    }
}

#Preview {
    ProductView()
}

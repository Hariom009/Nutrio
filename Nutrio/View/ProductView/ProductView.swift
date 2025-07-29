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
                HStack{
                    VStack(alignment: .leading){
                        Text("Natural Red Apple")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        Text("1kg,Price")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        
                    }
                    Spacer()
                    Button{
                        
                    }label: {
                        Image(systemName: "heart")
                            .foregroundStyle(.blue)
                            .font(.title)
                    }
                }
                HStack{
                    Button{
                        
                    }label:{
                        Image(systemName: "minus")
                            .foregroundStyle(.gray)
                            .font(.headline)
                    }
                    Text("1")
                        .font(.headline)
                        .foregroundStyle(.black)
                        .background(
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    Button{
                        
                    }label:{
                        Image(systemName: "plus")
                            .foregroundStyle(.gray)
                            .font(.headline)
                    }
                    Spacer()
                    
                    Text("$4.99")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                }
                VStack{
                    
                }
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

//
//  HomeView.swift
//  Nutrio
//
//  Created by Hari's Mac on 18.06.2025.
//

import SwiftUI

struct HomeView: View {
    @State private var searchProduct: String = ""
    @StateObject var HomeVM = HomeViewModel.shared
    var body: some View {
        ScrollView{
            VStack(spacing: 20) {
                VStack(spacing: 20){
                    Image("color_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30,height: 30)
                    HStack{
                        Image("location")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20,height: 19)
                        Text("Dhaka, Banassre")
                            .font(.customfont(.regular, fontSize: 18))
                    }
                }
            }
            ZStack{
                HStack(spacing: 8){
                    Image(systemName: "magnifyingglass")
                    TextField("Search Store", text: $searchProduct)
                        .padding(.horizontal,12)
                }.padding()
                .background(RoundedRectangle(cornerRadius: 18).fill(Color.gray.opacity(0.2)))
            }.padding()
            
                Image("banner_top")
                    .resizable()
                    .scaledToFit()
                    .padding(.all,10)
            VStack(alignment: .leading){
                HStack{
                    Text("Exclusive offers")
                        .font(.customfont(.medium, fontSize: 24))
                    Spacer()
                }.padding()
                ScrollView(.horizontal){
                    // Here we add some prelisted products using product card
                    
                }
            }
        }
    }
}

#Preview {
    HomeView()
}

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
    @EnvironmentObject var router: Router
    let bannerImages = ["banner_top","banner_top","banner_top"]
    let ExclusiveOffer = ["Organic Bananas", "Red Apple","Pepsi Can", "Broiler Chicken"]
    let BestSelling = [ "Ginger", "Bell Pepper Red", "Egg Chicken Red"]
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
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(bannerImages, id: \.self){
                        Image($0)
                            .resizable()
                            .frame(width:320,height: 120)
                            .scaledToFit()
                            .padding(.leading,4)
                    }
                }
            }
           // Exclusive Offers...
            VStack(alignment: .leading){
                HStack{
                    Text("Exclusive offers")
                        .font(.customfont(.medium, fontSize: 24))
                    Spacer()
                    Button {
                        
                        print("See all in exclusive offers pressed")
                        
                    } label: {
                        Text("See all")
                            .foregroundStyle(Color.primaryApp)
                            .font(.custom("Gilroy", size: 16))
                    }

                }.padding()
                ScrollView(.horizontal, showsIndicators: false){
                    // Here we add some prelisted products using product card
                    HStack(spacing: 8){
                        ForEach(ExclusiveOffer, id: \.self){ item in
                            ProductCard(imagename: "\(item)", title: "\(item)", amount: 7, price: 4.99)
                        }
                    }
                    
                }
                .padding()
            }
            // Best Sellers...
            
            VStack(alignment: .leading){
                HStack{
                    Text("Best Selling")
                        .font(.customfont(.medium, fontSize: 24))
                    Spacer()
                    Button {
                        
                        print("See all in Best Selling pressed")
                        
                    } label: {
                        Text("See all")
                            .foregroundStyle(Color.primaryApp)
                            .font(.custom("Gilroy", size: 16))
                    }

                }.padding()
                ScrollView(.horizontal, showsIndicators: false){
                    // Here we add some prelisted products using product card
                    HStack(spacing: 8){
                        ForEach(BestSelling, id: \.self){ item in
                            ProductCard(imagename: "\(item)", title: "\(item)", amount: 7, price: 4.99)
                        }
                    }
                    
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView()
}

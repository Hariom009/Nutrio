//
//  HomeView.swift
//  Nutrio
//
//  Created by Hari's Mac on 18.06.2025.
//

import SwiftUI
import CoreLocation


struct Grocery: Hashable{
    let id = UUID()
    var name: String
    var color: Color
}
struct HomeView: View {
    @State private var searchProduct: String = ""
    @StateObject var HomeVM = HomeViewModel.shared
    @EnvironmentObject var router: Router
    @StateObject private var locationManager = LocationManager()
    
    @State private var showPermissionAlert = false
    let bannerImages = ["banner_top"]
    
    let groceries = [Grocery(name: "Pulses", color: .orange),Grocery(name: "Vegetables", color: .green) ,Grocery(name: "Rice", color: .yellow)]
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(spacing: 20) {
                VStack(spacing: 20){
                    Image("color_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30,height: 30)
                    HStack {
                        Image("location")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 19)
                    }
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(bannerImages, id: \.self){
                        Image($0)
                            .resizable()
                            .frame(width:385,height: 145)
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
                        ForEach(ProductManagerFirebase.shared.OnSaleProducts, id: \.self){ item in
                            NavigationLink{
                                ProductView(product: item)
                            }label:{
                                ProductCard(imagename: item.image, title: item.name, amount: item.amount, price: item.price)
                                    .foregroundStyle(.black)
                            }
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
                        ForEach(ProductManagerFirebase.shared.BestSellingProducts, id: \.self){ item in
                            NavigationLink{
                                ProductView(product: item)
                            }label:{
                                ProductCard(imagename: "\(item.image)", title: "\(item.name)", amount: item.amount, price: item.price)
                                    .foregroundStyle(.black)
                            }
                        }
                    }
                    
                }
                .padding()
            }
            //Groceries ...
            VStack(alignment: .leading){
                HStack{
                    Text("Groceries")
                        .font(.customfont(.medium, fontSize: 24))
                    Spacer()
                    Button {
                        print("See all in Groceries pressed")
                        
                    } label: {
                        Text("See all")
                            .foregroundStyle(Color.primaryApp)
                            .font(.custom("Gilroy", size: 16))
                    }
                    
                }.padding()
                ScrollView(.horizontal, showsIndicators: false){
                    // Here we add some prelisted products using product card
                    HStack(spacing: 8){
                        ForEach(groceries, id: \.self){ item in
                            GroceryCard(text: "\(item.name)", image: "\(item.name.lowercased())", colour: item.color.opacity(0.5)
                            )
                        }
                    }
                    
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
        
        .alert("Location Permission Needed", isPresented: $showPermissionAlert) {
            Button("Open Settings") {
                if let url = URL(string: UIApplication.openSettingsURLString),
                   UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url)
                }
            }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Please allow location access in Settings to use this feature.")
        }
    }
}

#Preview {
    HomeView()
}

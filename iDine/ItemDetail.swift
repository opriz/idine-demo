//
//  ItemDetail.swift
//  iDine
//
//  Created by zhujian on 2025/2/23.
//

import SwiftUI

struct ItemDetail: View {
    let item: MenuItem
    @EnvironmentObject var order: Order
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        VStack{
            ZStack(alignment: .bottomTrailing){
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(.black)
                    .font(.caption)
                    .foregroundStyle(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
            
            HStack{
                Button("Order This") {
                    order.add(item: item)
                }
                .buttonStyle(.borderedProminent)
                .overlay(alignment: .topTrailing) {
                    if order.countFor(item: item) > 0 {
                        Text("\(order.countFor(item: item))")
                            .font(.caption2.bold())
                            .foregroundColor(.white)
                            .padding(5)
                            .background(Color.red)
                            .clipShape(Circle())
                            .offset(x: 10, y: -10)
                    }
                }
                
                Button(favorites.items.contains(item) ? "Unfavorite" : "Favorite") {
                    if favorites.items.contains(item) {
                        favorites.remove(item: item)
                    } else {
                        favorites.add(item: item)
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(favorites.items.contains(item) ? .gray : .accentColor)
            }
            
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ItemDetail(item: MenuItem.example).environmentObject(Order())
    }
}

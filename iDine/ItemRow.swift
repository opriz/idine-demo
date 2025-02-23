//
//  ItemRow.swift
//  iDine
//
//  Created by zhujian on 2025/2/23.
//

import SwiftUI

struct ItemRow: View {
    let item: MenuItem
    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    @EnvironmentObject var order: Order

    var body: some View {
            HStack{
                ZStack(alignment: .topTrailing) {
                    Image(item.thumbnailImage)
                        .clipShape(Rectangle())
                        .overlay(Rectangle().stroke(.gray, lineWidth: 2))
                    
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
                
                VStack(alignment: .leading){
                    Text(item.name)
                        .font(.headline)
                    Text("$\(item.price)")
                }
                Spacer()
                
                ForEach(item.restrictions, id: \.self) { restrection in
                    Text(restrection)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                        .background(colors[restrection, default: .black])
                        .clipShape(Circle())
                        .foregroundStyle(.white)
                    
                }
            }
    }
}

#Preview {
    ItemRow(item: MenuItem.example)
}

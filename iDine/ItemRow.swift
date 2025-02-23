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
    
    var body: some View {
            HStack{
                Image(item.thumbnailImage)
                    .clipShape(Rectangle())
                    .overlay(Rectangle().stroke(.gray, lineWidth: 2))
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

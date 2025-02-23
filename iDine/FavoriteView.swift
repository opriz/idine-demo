//
//  FavoriteView.swift
//  iDine
//
//  Created by zhujian on 2025/2/23.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var favoriteItems: Favorites
    
    var body: some View {
        NavigationStack {
            Group {
                if favoriteItems.items.isEmpty {
                    ContentUnavailableView(
                        "No favorites",
                        systemImage: "star.slash",
                        description: Text("You can add favorites from the menu")
                    )
                } else {
                    List {
                        ForEach(favoriteItems.items) {item in
                            NavigationLink(value: item) {
                                ItemRow(item: item)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                }
            }
            .navigationDestination(for: MenuItem.self) { item in
                ItemDetail(item: item)
            }
        }
        .navigationTitle("Favorites") 
        .toolbar {
            if !favoriteItems.items.isEmpty {
                EditButton()
            }
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        favoriteItems.items.remove(atOffsets: offsets)
    }
}

#Preview {
    FavoriteView().environmentObject(Favorites())
}

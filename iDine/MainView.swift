//
//  MainView.swift
//  iDine
//
//  Created by zhujian on 2025/2/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
            
            FavoriteView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
        }
    }
}

#Preview {
    MainView().environmentObject(Order())
}

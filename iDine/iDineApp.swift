//
//  iDineApp.swift
//  iDine
//
//  Created by zhujian on 2025/2/23.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    @StateObject var favs = Favorites()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
                .environmentObject(favs)
        }
    }
}

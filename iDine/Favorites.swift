//
//  Favorites.swift
//  iDine
//
//  Created by zhujian on 2025/2/23.
//

import SwiftUI

class Favorites: ObservableObject {
    @Published var items = [MenuItem]()
    
    func add(item: MenuItem) {
        items.append(item)
    }
    
    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}

//
//  Order.swift
//  iDine
//
//  Created by Paul Hudson on 27/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import SwiftUI

class Order: ObservableObject {
    @Published var items = [MenuItem]()
    
    // 添加一个计算属性来获取每个项目的数量
    var itemCounts: [MenuItem: Int] {
        var counts = [MenuItem: Int]()
        for item in items {
            counts[item, default: 0] += 1
        }
        return counts
    }

    var total: Int {
        if items.count > 0 {
            return items.reduce(0) { $0 + $1.price }
        } else {
            return 0
        }
    }
    
    // 获取去重后的项目列表
    var uniqueItems: [MenuItem] {
        Array(Set(items))
    }

    func add(item: MenuItem) {
        items.append(item)
    }

    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }

    // 获取特定商品的数量
    func countFor(item: MenuItem) -> Int {
        itemCounts[item] ?? 0
    }
}

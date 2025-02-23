//
//  OrderView.swift
//  iDine
//
//  Created by zhujian on 2025/2/23.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(order.uniqueItems) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("×\(order.itemCounts[item] ?? 0)")
                                .foregroundColor(.secondary)
                            Text("$\(item.price)")
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                
                Section {
                    NavigationLink("Place Order") {
                        CheckoutView()
                    }
                }
                .disabled(order.items.isEmpty)
            }
        }
        .navigationTitle("Order")
        .toolbar {
            EditButton()
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        let itemsToDelete = offsets.map { order.uniqueItems[$0] }
        for item in itemsToDelete {
            order.items.removeAll { $0 == item }
        }
    }
}

#Preview {
    OrderView().environmentObject(Order())
}

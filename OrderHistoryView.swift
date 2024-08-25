//
//  OrderHistoryView.swift
//  CupcakeJunction
//
//  Created by Priyankshu Sheet on 10/08/24.
//

import SwiftUI

struct OrderHistoryView: View {
    @State private var orderHistory: [Order] = []
    
    var body: some View {
        List(orderHistory) { order in
            VStack(alignment: .leading) {
                Text("Order #\(order.id)")
                    .font(Theme.titleFont)
                
                Text("\(order.quantity) x \(Order.types[order.type])")
                    .font(Theme.bodyFont)
                
                Text("Total: \(order.cost, format: .currency(code: "INR"))")
                    .font(Theme.bodyFont)
                    .foregroundColor(.secondary)
            }
        }
        .navigationTitle("Order History")
        .background(Theme.applyBackground())
        .onAppear {
            loadOrderHistory()
        }
    }
    
    func loadOrderHistory() {
        orderHistory = [
            Order(id: UUID().uuidString, type: 0, quantity: 6),
            Order(id: UUID().uuidString, type: 2, quantity: 12)
        ]
    }
}

#Preview {
    OrderHistoryView()
}

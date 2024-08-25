//
//  OrderFormView.swift
//  CupcakeJunction
//
//  Created by Priyankshu Sheet on 10/08/24.
//

import SwiftUI

struct OrderFormView: View {
    @Binding var order: Order
    
    var body: some View {
        Form {
            Section {
                Picker("Select your cake type", selection: $order.type) {
                    ForEach(Order.types.indices, id: \.self) {
                        Text(Order.types[$0])
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
                Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
            }
            Section {
                Toggle("Any special request?", isOn: $order.specialRequestEnabled.animation())
                
                if order.specialRequestEnabled {
                    
                    Toggle("Add extra frosting", isOn: $order.extraFrosting)
                    
                    Toggle("Add sprinkles", isOn: $order.addSprinkles)
                }
            }
        }
        .navigationTitle("Customize your Order")
        .background(Theme.applyBackground())
    }
}

#Preview {
    OrderFormView(order: .constant(Order(id: UUID().uuidString, type: 0, quantity: 3)))
}

//
//  AddressView.swift
//  CupcakeJunction
//
//  Created by Priyankshu Sheet on 07/08/24.
//

import SwiftUI

struct AddressView: View {
    @Binding var order: Order
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Image(systemName: "person.fill")
                    TextField("Name", text: $order.name)
                }
                .validation(order.name.isEmpty, message: "Name is required")
                
                HStack {
                    Image(systemName: "house.fill")
                    TextField("Street Address", text: $order.streetAddress)
                }
                .validation(order.name.isEmpty, message: "Street Address is required")
                
                HStack {
                    Image(systemName: "location.fill")
                    TextField("City", text: $order.city)
                }
                .validation(order.city.isEmpty, message: "City is required")
                
                HStack {
                    Image(systemName: "number.circle.fill")
                    TextField("Zip", text: $order.zip)
                }
                .validation(order.zip.isEmpty, message: "Zip code is required")
            }
            
            Section {
                NavigationLink("Check out") {
                    CheckoutView(order: order)
                }
            }
            .disabled(!order.hadValidAddress)
        }
        .navigationTitle("Delivery details")
        .background(Theme.applyBackground())
    }
}

extension View {
    func validation(_ condition: Bool, message: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            self
            
            if condition {
                Text(message)
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
    }
}

#Preview {
    AddressView(order: .constant(Order(id: UUID().uuidString, type: 0, quantity: 3)))
}

//
//  PromoCodeView.swift
//  CupcakeJunction
//
//  Created by Priyankshu Sheet on 10/08/24.
//

import SwiftUI

struct PromoCodeView: View {
    @State private var promoCode: String = ""
    @State private var discount: Double = 0.0
    
    var body: some View {
        Form {
            Section(header: Text("Enter Promo Code")) {
                TextField("Promo Code", text: $promoCode)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Apply") {
                    applyPromoCode()
                }
                .buttonStyle(CustomButtonStyle())
            }
            
            Section(header: Text("Loyalty Program")) {
                Text("You have \(Int(discount))% off on your next order!")
                    .font(Theme.bodyFont)
            }
        }
        .navigationTitle("Promotions")
        .background(Theme.applyBackground())
    }
    
    func applyPromoCode() {
        if promoCode == "SAVE20" {
            discount = 20.0
        }
        else {
            discount = 0.0
        }
    }
}

#Preview {
    PromoCodeView()
}

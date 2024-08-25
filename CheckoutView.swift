//
//  CheckoutView.swift
//  CupcakeJunction
//
//  Created by Priyankshu Sheet on 08/08/24.
//

import SwiftUI

struct CheckoutView: View {
    var order: Order
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    var body: some View {
        VStack {
            ProgressView(value: 3, total: 4)
                .progressViewStyle(CircularProgressViewStyle())
                .padding()
            
            ScrollView {
                VStack(spacing: 20) {
                    orderSummaryView
                    
                    AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    }
                placeholder: {
                    ProgressView()
                }
                .frame(height: 200)
                    
                    Text("Your total cost is \(order.cost, format: .currency(code: "INR"))")
                        .font(.title)
                    
                    Button("Place Order") {
                        Task {
                            await placeOrder()
                        }
                    }
                    .buttonStyle(CustomButtonStyle())
                    .padding(.top, 10)
                }
                .padding()
            }
        }
        .background(Theme.applyBackground())
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Thank You", isPresented: $showingConfirmation) {
            Button("OK") {  }
        } message: {
            Text(confirmationMessage)
        }
    }
    
    private var orderSummaryView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Order Summary")
                .font(Theme.titleFont)
                .padding(.bottom, 10)
            
            HStack {
                Text("Cake Type:")
                Spacer()
                Text("\(Order.types[order.type])")
                    .font(Theme.bodyFont)
            }
            
            HStack {
                Text("Quantity:")
                Spacer()
                Text("\(order.quantity)")
                    .font(Theme.bodyFont)
            }
            
            if order.specialRequestEnabled {
                HStack {
                    Text("Extra Frosting:")
                    Spacer()
                    Text(order.extraFrosting ? "Yes" : "No")
                        .font(Theme.bodyFont)
                }
                
                HStack {
                    Text("Extra Sprinkles:")
                    Spacer()
                    Text(order.addSprinkles ? "Yes" : "No")
                        .font(Theme.bodyFont)
                }
            }
        }
        .padding()
        .background(Color.white.opacity(0.9))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order)
        else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            
            confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            
            showingConfirmation = true
        }
        catch {
            print("Checkout failed: \(error.localizedDescription)")
        }
    }
}

#Preview {
    CheckoutView(order: Order(id: "1", type: 0, quantity: 3, specialRequestEnabled: true, extraFrosting: true, addSprinkles: true))
}

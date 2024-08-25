//
//  ContentView.swift
//  CupcakeJunction
//
//  Created by Priyankshu Sheet on 06/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var order = Order(id: UUID().uuidString, type: 0, quantity: 3)
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    headerView
                    
                    popularCupcakesSection
                    specialOffersSection
                    
                    NavigationLink("Customise Your Order", destination: OrderFormView(order: $order))
                        .buttonStyle(CustomButtonStyle())
                        .padding()
                    
                    NavigationLink("View Order History", destination: OrderHistoryView())
                        .buttonStyle(CustomButtonStyle())
                        .padding(.bottom, 20)
                }
                .padding()
            }
            .background(Theme.applyBackground())
            .navigationTitle("Cupcake Junction")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "cart.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                }
            }
        }
    }
    
    private var headerView: some View {
        HStack {
            Image(systemName: "cupcake.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(Theme.accentColor)
            
            Text("Cupcake Junction")
                .font(Theme.titleFont)
                .foregroundColor(Theme.accentColor)
        }
        .padding()
    }
    
    private var popularCupcakesSection: some View {
        Section(header: Text("Popular Cupcakes").font(Theme.bodyFont)) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(Order.types.indices, id: \.self) { index in
                        VStack {
                            Image(systemName: "cupcake.fill")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .padding()
                            
                            Text(Order.types[index])
                                .font(Theme.bodyFont)
                        }
                        .frame(width: 140, height: 180)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                }
            }
            .padding()
        }
    }
    
    private var specialOffersSection: some View {
        Section(header: Text("Special Offers").font(Theme.bodyFont)) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    
                    ForEach(0..<3) { _ in
                        VStack {
                            Image(systemName: "gift.fill")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .padding()
                            
                            Text("Buy 1 get 1 Free")
                                .font(Theme.bodyFont)
                        }
                        .frame(width: 140, height: 180)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                }
            }
            .padding()
        }
    }
}

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Theme.bodyFont)
            .padding()
            .background(Theme.accentColor)
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(radius: configuration.isPressed ? 2 : 5)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

#Preview {
    ContentView()
}

//
//  Theme.swift
//  CupcakeJunction
//
//  Created by Priyankshu Sheet on 10/08/24.
//

import SwiftUI

struct Theme {
    static let mainColor = Color("CupcakePink")
    static let accentColor = Color("CupcakeBrown")
    static let backgroundGradient = LinearGradient(gradient: Gradient(colors: [Color("CupcakeLightPink"), Color("CupcakeWhite")]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    static let titleFont = Font.custom("Lobster-Regular", size: 24)
    static let bodyFont = Font.custom("Poppins-Regular", size: 16)
    
    static func applyBackground() -> some View {
        backgroundGradient.edgesIgnoringSafeArea(.all)
    }
}

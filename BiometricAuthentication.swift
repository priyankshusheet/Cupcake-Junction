//
//  BiometricAuthentication.swift
//  CupcakeJunction
//
//  Created by Priyankshu Sheet on 10/08/24.
//

import SwiftUI
import LocalAuthentication

struct BiometricAuthentication: View {
    @State private var isAuthenticated = false
    
    var body: some View {
        VStack {
            if isAuthenticated {
                Text("You are aunthenticated!")
                    .font(Theme.titleFont)
                    .padding()
            }
            else {
                Text("Please authenticate to proceed")
                    .font(Theme.bodyFont)
                    .padding()
                
                Button("Authenticate") {
                    authenticate()
                }
                .buttonStyle(CustomButtonStyle())
            }
        }
        .background(Theme.applyBackground())
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to authenticate you to proceed."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticateionError in
                DispatchQueue.main.async {
                    if success {
                        self.isAuthenticated = true
                    }
                    else {
                    }
                }
            }
        }
        else {
        }
    }
}

#Preview {
    BiometricAuthentication()
}

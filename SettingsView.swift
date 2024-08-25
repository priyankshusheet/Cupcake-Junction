//
//  SettingsView.swift
//  CupcakeJunction
//
//  Created by Priyankshu Sheet on 10/08/24.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    var body: some View {
        Form {
            Section(header: Text("Appearance")) {
                Toggle(isOn: $isDarkMode) {
                    Text("Dark Mode")
                }
            }
            
            Section(header: Text("Account")) {
                NavigationLink("Profile Settings", destination: ProfileSettingView())
            }
        }
        .navigationTitle("Settings")
        .background(Theme.applyBackground())
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    SettingsView()
}

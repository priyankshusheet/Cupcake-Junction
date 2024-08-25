//
//  ProfileSettingView.swift
//  CupcakeJunction
//
//  Created by Priyankshu Sheet on 12/08/24.
//

import SwiftUI

struct ProfileSettingView: View {
    @State private var username: String = "Priyankshu"
    @State private var email: String = "priyankshu.sheet123@gmail.com"
    @State private var notificationsEnabled: Bool = true
    
    var body: some View {
        Form {
            Section(header: Text("Profile Information")) {
                HStack {
                    Text("Username")
                    Spacer()
                    TextField("Username", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.trailing)
                }
                
                HStack {
                    Text("Email")
                    Spacer()
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.emailAddress)
                }
            }
            Section(header: Text("Settings")) {
                Toggle(isOn: $notificationsEnabled) {
                    Text("Enable Notification")
                }
            }
            
            Section{
                Button(action: saveSettings) {
                    Text("Save Settings")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 44)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
        }
        .navigationTitle("Profile Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func saveSettings() {
        print("Settings saved for username: \(username), email: \(email), notifications: \(notificationsEnabled)")
    }
}

#Preview {
    ProfileSettingView()
}

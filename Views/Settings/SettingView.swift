//
//  SettingIcon.swift
//  Solo Leveling App
//
//  Created by Jashnoor Singh on 27/06/26.
//

import SwiftUI

struct SettingView: View {
    @State private var notificationEnabled = false
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    Toggle(isOn: $notificationEnabled){
                        settingsLabel(icon: "bell", title: "Notifications")
                    }
                }
                Section{
                    settingsLabel(icon: "moon", title: "Dark Mode")
                }
//                Section{
//                    NavigationLink
//                }
            }
        }
    }
    
    @ViewBuilder
    func settingsLabel(icon: String, title: String) -> some View {
        HStack {
            Image(systemName: icon)
                .frame(width: 24)
            Text(title)
        }
    }
}

#Preview {
    SettingView()
}

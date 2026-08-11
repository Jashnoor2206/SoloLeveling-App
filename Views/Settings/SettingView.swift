//
//  SettingIcon.swift
//  Solo Leveling App
//
//  Created by Jashnoor Singh on 27/06/26.
//

import SwiftUI

struct SettingView: View {
    @State private var notificationEnabled = false
    @Bindable var details : Details
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    Toggle(isOn: $notificationEnabled){
                        settingsLabel(icon: "bell", title: "Notifications")
                    }
                    
//                    NavigationLink(destination: ProfileView(details: details)){
//                        settingsLabel(icon: "person", title: "Edit Profile")
//                    }
                    
                    waterSleepLabel(icon: "drop", title: "Water Intake", variable: details.targetIntake)
                    waterSleepLabel(icon: "bed.double", title: "Sleeping Hours", variable: details.targetHours)
                    
                    settingsLabel(icon: "moon", title: "Change Mode")
                    settingsLabel(icon: "document", title: "Terms and Conditions")
                    settingsLabel(icon: "star", title: "Feedback")
                    settingsLabel(icon: "envelope", title: "Contact Us")
                    settingsLabel(icon: "rectangle.portrait.and.arrow.right", title: "Logout")
                }
            }.listSectionSpacing(.compact)
                .scrollContentBackground(.hidden)
                .background(Color(hex: "CCE2CB"))
                .navigationTitle("Settings")
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
    
    @ViewBuilder
    func waterSleepLabel(icon: String, title: String, variable: Int) -> some View{
        HStack{
            Image(systemName: icon)
                .frame(width: 24)
            Text(title)
            Spacer()
            Button{
                details.targetHours += 1
            }label: {
                Image(systemName: "plus")
                    .frame(width: 24)
            }
            Button{
                
            }label: {
                Image(systemName: "minus")
                    .frame(width: 24)
            }
        }
    }
}

#Preview {
    @State @Previewable var details = Details()
    SettingView(details: details)
}

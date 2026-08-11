//
//  MainTabView.swift
//  Solo Leveling App
//
//  Created by Jashnoor Singh on 03/07/26.
//

import SwiftUI

struct MainTabView: View {
    var game: Details
    var body: some View {
        TabView{
            NavigationStack{ HomeScreen(details: game) }
            .tabItem{ Label("Home", systemImage: "house.fill") }
            
//            NavigationStack{ ProfileView(details: game) }
//            .tabItem{ Label("Profile", systemImage: "person.fill") }
            
            NavigationStack{ SettingView(details: game) }
            .tabItem{ Label("Settings", systemImage: "gearshape.fill") }
            
            NavigationStack{
                
            }
            .tabItem{ Label("Honors", systemImage: "trophy.fill") }
        }
    }
}

#Preview {
    @Previewable @State var game = Details()
    MainTabView(game: game)
}

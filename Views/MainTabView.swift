//
//  MainTabView.swift
//  Solo Leveling App
//
//  Created by Jashnoor Singh on 03/07/26.
//

import SwiftUI

struct MainTabView: View {
    var game: Details
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab){
            NavigationStack{ HomeScreen(details: game) }
            .tag(0)
            
            NavigationStack{ ProfileView() }
            .tag(1)
            
            NavigationStack{ SettingView(details: game) }
            .tag(2)
            
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .ignoresSafeArea(edges: .bottom) // let content extend fully
    }
}

#Preview {
    @Previewable @State var game = Details()
    MainTabView(game: game)
}

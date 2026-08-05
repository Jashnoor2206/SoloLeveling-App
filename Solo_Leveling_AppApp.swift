//
//  Solo_Leveling_AppApp.swift
//  Solo Leveling App
//
//  Created by Jashnoor Singh on 26/06/26.
//

import SwiftUI
import SwiftData

@main
struct Solo_Leveling_AppApp: App {
    @AppStorage("loginDone") private var loginDone: Bool = false // this makes the login done store on the disc , making it persistable , false is the default value set only one time
    var body: some Scene {
        WindowGroup {
            RootView(loginDone: $loginDone)
        }
        .modelContainer(for: Details.self)
    }
}

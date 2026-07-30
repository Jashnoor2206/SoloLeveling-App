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
    @Query private var allDetails: [Details] // this returns a full details array from database we only need one record
    @Environment(\.modelContext) private var modelContext // used to insert or delete into our game array
    
    var game: Details {
        if let existing  = allDetails.first{ // if there already exits some game return that
            return existing
        } else{
            let newDetails = Details()
            modelContext.insert(newDetails)
            return newDetails
        }
    }
    
    var body: some Scene {
        WindowGroup {
            if (loginDone){
                MainTabView(game: game)
            }else{
                LoginView(loginDone: $loginDone, details: game)
            }
        }.modelContainer(for: Details.self)
    }
}

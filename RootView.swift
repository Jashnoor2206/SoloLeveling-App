//
//  RootView.swift
//  Solo Leveling App
//
//  Created by Jashnoor Singh on 06/08/26.
//

import SwiftUI
import SwiftData

struct RootView: View {
    @Binding var loginDone: Bool
    @Query private var allDetails: [Details]
    @Environment(\.modelContext) private var modelContext
    @State private var game: Details?   // starts empty, filled in once

    var body: some View {
        Group {
            if let game {
                if loginDone {
                    MainTabView(game: game)
                } else {
                    LoginView(loginDone: $loginDone, details: game)
                }
            } else {
                ProgressView()   // shown briefly while game is being set up
            }
        }
        .task {
            guard game == nil else { return }   // extra safety: don't redo this if it already ran
            if let existing = allDetails.first {
                game = existing
            } else {
                let newDetails = Details()
                modelContext.insert(newDetails)
                game = newDetails
            }
        }
    }
}

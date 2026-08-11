//
//  UserDetails.swift
//  Solo Leveling App
//
//  Created by Jashnoor Singh on 02/07/26.
//

import SwiftUI

struct ProfileView: View {
    let name: String
    let level: Level
    var todayText: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM"
        return "Today \(formatter.string(from: Date()))"
    }
    var body: some View {
        ZStack {
            // Layer 1: profile pic, pinned to the left
            HStack {
                Image("profile")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                Spacer()
                
                LevelView(level_details: level)
                    .padding(.top, 15)
            }.padding()
            
            // Layer 2: text, centered regardless of the image
            VStack {
                Text("Hello \(name)")
                    .font(.custom("AvenirNext-Medium", size: 19))
                Text(todayText)
                    .font(.custom("AvenirNext-Medium", size: 17))
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    @State @Previewable var level = Level()
    ProfileView(name: "Jashnoor", level: level)
}

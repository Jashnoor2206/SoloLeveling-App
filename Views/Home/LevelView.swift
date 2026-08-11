//
//  LevelDetails.swift
//  Solo Leveling App
//
//  Created by Jashnoor Singh on 08/07/26.
// here in this view we will look at level and rank

import SwiftUI

struct LevelView: View {
    var level_details: Level
    
    init(level_details: Level) {
        self.level_details = level_details
    }
    private var xp_forNextLvl : Int {
        level_details.max_xp - level_details.current_xp
    }
    private var progress: Double {
        Double(level_details.current_xp) / Double(xp_forNextLvl)
    }
    
    var body: some View {
        xpIndicator
    }
    
    var xpIndicator : some View{
        VStack(spacing: 8) {
            ZStack {
                // Background track
                Circle()
                    .stroke( lineWidth: 10)
                    .foregroundStyle(Color(hex: "132B23").opacity(0.3))
                
                // Progress ring
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(
                        Color.teal,
                        style: StrokeStyle(lineWidth: 10, lineCap: .round)
                    )
                    .rotationEffect(.degrees(-90)) // start from top
                    .animation(.easeOut(duration: 0.6), value: progress)
                
                // Center content
                VStack(spacing: 2) {
                    Text("\(level_details.level)")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundStyle(Color(hex: "132B23"))
                }
            }
            .frame(width: 40, height: 40)
            
            Text("\(Int(level_details.current_xp)) / \(Int(xp_forNextLvl)) XP ")
                .font(.footnote)
                .foregroundColor(Color(hex: "132B23"))
        }
    }
}

#Preview {
    @Previewable @State var lev = Level()
    LevelView(level_details: lev)
}

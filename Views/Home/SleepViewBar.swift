//
//  SleepViewBar.swift
//  Solo Leveling App
//
//  Created by Jashnoor Singh on 13/07/26.
//

import SwiftUI

struct SleepViewBar: View {
    var sleep: Int = 2
    var maxSleep: Int = 8
    var progress: Double{
        Double(sleep) / Double(maxSleep)
    }
    var body: some View {
        ZStack {
            // Background track
            Circle()
                .stroke( lineWidth: 14)
                .foregroundStyle(Color(hex: "132B23").opacity(0.3))
                .frame(width: 70, height: 70)
            
            // Progress ring
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color.teal,
                    style: StrokeStyle(lineWidth: 14, lineCap: .round)
                )
                .rotationEffect(.degrees(-90)) // start from top
                .animation(.easeOut(duration: 0.6), value: progress)
                .frame(width: 70, height: 70)
            
            Image(systemName: "bed.double.fill")
        }
    }
}

#Preview {
    SleepViewBar()
}

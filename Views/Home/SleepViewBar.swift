//
//  SleepViewBar.swift
//  Solo Leveling App
//
//  Created by Jashnoor Singh on 13/07/26.
//

import SwiftUI

struct SleepViewBar: View {
    var sleepVariable: Details
    var progress: Double{
        Double(sleepVariable.sleepHours) / Double(sleepVariable.targetHours)
    }
    var body: some View {
        ZStack {
            // Background track
            Circle()
                .stroke( lineWidth: 7)
                .foregroundStyle(Color(hex: "132B23").opacity(0.3))
                .frame(width: 35, height: 35)
            
            // Progress ring
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color.teal,
                    style: StrokeStyle(lineWidth: 7, lineCap: .round)
                )
                .rotationEffect(.degrees(-90)) // start from top
                .animation(.easeOut(duration: 0.6), value: progress)
                .frame(width: 35, height: 35)
            
            Image(systemName: "bed.double.fill")
                .frame(width: 10, height: 10)
        }
    }
}

#Preview {
    @State @Previewable var sleep = Details()
    SleepViewBar(sleepVariable: sleep)
}

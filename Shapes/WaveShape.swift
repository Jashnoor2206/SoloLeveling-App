//
//  WaveShape.swift
//  Solo Leveling App
//
//  Created by Jashnoor Singh on 13/07/26.
//
import SwiftUI

struct WaveShape: Shape {
    var progress: Double     // 0...1, how full
    var waveHeight: CGFloat = 2
    var phase: Double        // shifts the wave horizontally over time

    // lets SwiftUI animate progress AND phase smoothly
    var animatableData: AnimatablePair<Double, Double> {
        get { AnimatablePair(progress, phase) }
        set {
            progress = newValue.first
            phase = newValue.second
        }
    }

    func path(in rect: CGRect) -> Path {
        let waterLevel = rect.height * (1 - progress)
        var path = Path()

        path.move(to: CGPoint(x: 0, y: waterLevel))

        // draw the wavy top edge
        for x in stride(from: 0, through: rect.width, by: 1) {
            let relativeX = x / rect.width
            let sine = sin(relativeX * .pi * 4 + phase) // 4 = number of ripples
            let y = waterLevel + sine * waveHeight
            path.addLine(to: CGPoint(x: x, y: y))
        }

        // close the shape down to the bottom
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()

        return path
    }
}

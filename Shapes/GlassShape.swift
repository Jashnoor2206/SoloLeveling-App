//
//  GlassShape.swift
//  Solo Leveling App
//
//  Created by Jashnoor Singh on 13/07/26.
//

import SwiftUI


struct GlassShape: Shape {
    var topWidthRatio: CGFloat = 1.0     // top is full width
    var bottomWidthRatio: CGFloat = 0.6  // bottom is narrower
    
    func path(in rect: CGRect) -> Path {
        let topInset = rect.width * (1 - topWidthRatio) / 2
        let bottomInset = rect.width * (1 - bottomWidthRatio) / 2
        
        var path = Path()
        path.move(to: CGPoint(x: rect.minX + topInset, y: rect.minY))               // top-left
        path.addLine(to: CGPoint(x: rect.maxX - topInset, y: rect.minY))            // top-right
        path.addLine(to: CGPoint(x: rect.maxX - bottomInset, y: rect.maxY))         // bottom-right
        path.addLine(to: CGPoint(x: rect.minX + bottomInset, y: rect.maxY))         // bottom-left
        path.closeSubpath()
        return path
    }
}


#Preview {
    GlassShape()
}

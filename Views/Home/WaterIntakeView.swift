//
//  WaterIntakeView.swift
//  Solo Leveling App
//
//  Created by Jashnoor Singh on 13/07/26.
//

import SwiftUI

struct WaterIntakeView: View {
    var waterVariable: Details
    @State var showAlert: Bool = false
    @State private var phase: Double = 0

    var progress: Double {
        min(Double(waterVariable.waterIntake) / Double(waterVariable.targetIntake), 1.0)
    }

    var body: some View {
        HStack{
            VStack(spacing: 8) {
                ZStack(alignment: .bottom) {
                    GlassShape()
                        .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                    
                    WaveShape(progress: progress, phase: phase)
                        .foregroundStyle(Color.teal)
                        .clipShape(GlassShape())
                        .animation(.easeOut(duration: 0.6), value: progress)
                    
                    GlassShape()
                        .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                }
                .frame(width: 31.25, height: 42)
                .onAppear {
                    withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                        phase = .pi * 2
                    }
                }
                
                Text("\(waterVariable.waterIntake) / \(waterVariable.targetIntake) L")
                    .font(.footnote)
                    .foregroundColor(Color(hex: "132B23"))
            }
            
            VStack(spacing: 20){
                Button{
                    increaseWater()
                }label: {
                    Image(systemName: "plus")
                }.alert("Goal Reached", isPresented: $showAlert){
                    Button("Ok"){
                        showAlert = false
                    }
                }message: {
                    Text("Well Done")
                }
                Button{
                    decreaseWater()
                }label: {
                    Image(systemName: "minus")
                }.disabled(waterVariable.waterIntake == 0 || waterVariable.waterIntake == 8)
            }.padding(.bottom, 20)
        }
    }
    
    func increaseWater() {
        guard waterVariable.waterIntake < waterVariable.targetIntake else {
            showAlert = true
            return }
        waterVariable.waterIntake += 1
    }
    
    func decreaseWater() {
        waterVariable.waterIntake -= 1
    }
}

#Preview {
    @Previewable @State var waterVar = Details()
    WaterIntakeView(waterVariable: waterVar)
}

//
//  ContentView.swift
//  Solo Leveling App
//
//  Created by Jashnoor Singh on 26/06/26.
//

import SwiftUI

struct HomeScreen: View {
    var details: Details
    
    var body: some View {
        ZStack{
            Color(hex: "CCE2CB") // light green
                .ignoresSafeArea()
            ScrollView{
                VStack(spacing: 20){
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundStyle(Color(hex: "5c6652")) // olive green
                        .frame(width: 380, height: 70)
                        .overlay{
                            HStack{
                                Text(details.name)
                                    .font(.custom("Futura-Medium", size: 20, relativeTo: .body))
                                    .foregroundStyle(.white)
                                Spacer()
                                Image(systemName: "flame.fill")
                                    .foregroundStyle(.red)
                                    .font(.title2)
                                Text("\(details.streak_count)")
                                    .foregroundStyle(.white)
                                    .font(.title3)
                            }.padding()
                        }
                    LevelView(level_details: details.level)
                    TasksView(details: details)
                    HStack{
                        WaterIntakeView(waterVariable: details)
                        Spacer()
                        SleepViewBar(sleepVariable: details)
                    }.padding()
                        .frame(height: 200)
                        
                    Spacer()
                }.padding()
            }
        }
    }
}

#Preview {
    @Previewable @State var details = Details(name: "Jashnoor Singh")
    HomeScreen(details: details)
}

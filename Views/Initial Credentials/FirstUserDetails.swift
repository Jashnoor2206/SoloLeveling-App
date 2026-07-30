//
//  UserDetails.swift
//  Solo Leveling App
//
//  Created by Jashnoor Singh on 02/07/26.
//

import SwiftUI

struct FirstUserDetails: View {
    @Bindable var details: Details
    
    let genders =  ["Male", "Female", "Prefer not to Say"]
    let fitness_lvl = ["Beginner", "Intermediate", "Advanced"]
    let goals = ["Weight Loss", "Muscle Gain", "General Fitness"]
    let preferredWorkout = ["HIIT", "Strength Training", "Yoga", "Dance", "Pilates"]
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Personal Info"){
                    TextField("Name", text: $details.name).autocorrectionDisabled()
                    Stepper("Age: \(details.age)", value: $details.age, in : 18...70)
                    menuBar(value: $details.gender, label: "Gender", str_array: genders)
                }
                
                Section("Fitness Info"){
                    TextField("Height (cm)", value: $details.height, format: .number)
                        .keyboardType(.decimalPad)
                    
                    TextField("Weight (kg)", value: $details.weight, format: .number)
                        .keyboardType(.decimalPad)
                    menuBar(value: $details.fitness_level, label: "Fitness Level", str_array: fitness_lvl)
                    menuBar(value: $details.goal, label: "Goals", str_array: goals)
                    menuBar(value: $details.preferred_workout, label: "Preferred Workout", str_array: preferredWorkout)
                }
                Section{
                    NavigationLink(destination: MainTabView(game: details)){
                        RoundedRectangle(cornerRadius: 25)
                            .frame(maxWidth: 150)
                            .foregroundStyle(Color(hex: "97C1A9"))
                            .overlay{
                                Text("Continue").foregroundStyle(.white)
                            }
                    }
                }.listRowInsets(EdgeInsets()) // removes default padding
                    .listRowBackground(Color.clear) // removes default color
            }.scrollContentBackground(.hidden)
                .background(Color(hex: "CCE2CB"))
        }
    }
    
    @ViewBuilder
    func menuBar(value: Binding<String>, label: String, str_array: [String]) -> some View{
        HStack{
            Menu{
                ForEach(str_array, id: \.self){index in
                    Button{
                        value.wrappedValue = index
                    }label: {
                        Text(index)
                    }
                }
            }label: {
                HStack{
                    if value.wrappedValue.isEmpty{
                        Text(label)
                            .foregroundStyle(.gray.opacity(0.5))
                    }
                    else{
                        Text(value.wrappedValue)
                            .foregroundStyle(.black)
                    }
                    Image(systemName: "chevron.up.chevron.down")
                        .foregroundStyle(.gray.opacity(0.5))
                }
            }
        }

    }
}

#Preview {
    @Previewable @State var details = Details()
    FirstUserDetails(details: details)
}

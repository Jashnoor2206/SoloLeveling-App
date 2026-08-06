//
//  DaysView.swift
//  Solo Leveling App
//
//  Created by Jashnoor Singh on 03/08/26.
//

import SwiftUI

struct HomeScreen: View{
    var details: Details
    let weekday = Calendar.current.component(.weekday, from: Date())
    var todayText: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM"
        return "Today \(formatter.string(from: Date()))"
    }
    
    let days: [String] = [
        "Sun","Mon","Tue",
        "Wed","Thu","Fri","Sat" ]
    var body: some View{
        VStack{
            ZStack {
                // Layer 1: profile pic, pinned to the left
                HStack {
                    Image("profile")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .padding(.trailing, 300)
                }
                
                // Layer 2: text, centered regardless of the image
                VStack {
                    Text("Hello Jashnoor")
                        .font(.custom("AvenirNext-Medium", size: 19))
                    Text(todayText)
                        .font(.custom("AvenirNext-Medium", size: 17))
                        .foregroundStyle(.gray)
                }
            }
            VStack(spacing: 20){
                RoundedRectangle(cornerRadius: 40.45)
                    .frame(height: 183.25)
                    .foregroundStyle(Color(hex: "B388FF"))
                    .overlay{
                        VStack{
                            Text("Daily \nQuests")
                                .font(.custom("FONTSPRINGDEMO-RocGroteskBlackRegular", size: 50))
                            Text("     Click to view the quests")
                                .font(.custom("AvenirNext-Medium", size: 19.09))
                        }.padding(.trailing, 100)
                    }
                
                HStack{
                    ForEach(days.indices, id: \.self){ index in
                        if let date = Calendar.current.date(
                            byAdding: .day,
                            value: index + 1 - weekday,
                            to: Date()
                        ){
                            let dayNumber = Calendar.current.component(.day, from: date)
                            daysRect(
                                day: days[index],
                                variable: weekday == index + 1,
                                currDate: dayNumber
                            )
                        }
                    }
                }
            }.padding()
            VStack{
                HStack{
                    Text("Summary")
                        .font(.custom("AvenirNext-Medium", size: 30.88))
                    Spacer()
                }.padding(.leading, 20)
                HStack{
                    RoundedRectangle(cornerRadius: 40.45)
                        .frame(width: 183.25, height: 296.49)
                        .foregroundStyle(Color(hex: "CCE2CB"))
                    
                    VStack(spacing: 5){
                        RoundedRectangle(cornerRadius: 40.45)
                            .frame(width: 183.25, height: 191.5)
                            .foregroundStyle(Color(hex: "ADD8E6"))
                        
                        RoundedRectangle(cornerRadius: 40.45)
                            .frame(width: 183.25, height: 100)
                            .foregroundStyle(Color(hex: "FFC5D3"))

                    }
                }
            }
        }
        
    }
    
    func daysRect(day: String, variable: Bool, currDate: Int) -> some View{
        RoundedRectangle(cornerRadius: 25)
            .stroke(.gray)
            .fill(variable ? .black : .clear)
            .frame(width: 46.35, height: 70)
            .overlay{
                VStack{
                    Text(day)
                        .foregroundStyle(variable ? .white : .gray)
                    Text("\(currDate)")
                        .foregroundStyle(variable ? .white : .black)
                }
            }
    }
}
// Golden ratio value = 1.618

#Preview {
    @State @Previewable var details = Details()
    HomeScreen(details: details)
}

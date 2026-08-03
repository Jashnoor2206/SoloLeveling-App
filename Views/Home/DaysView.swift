//
//  DaysView.swift
//  Solo Leveling App
//
//  Created by Jashnoor Singh on 03/08/26.
//

import SwiftUI

struct DaysView: View{
    let weekday = Calendar.current.component(.weekday, from: Date())
    
    let days: [String] = [
        "Sun","Mon","Tue",
        "Wed","Thu","Fri","Sat" ]
    var body: some View{
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
        }.padding()
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
    DaysView()
}

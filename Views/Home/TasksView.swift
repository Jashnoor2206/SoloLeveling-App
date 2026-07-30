//
//  TasksFile.swift
//  Solo Leveling App
//
//  Created by Jashnoor Singh on 26/06/26.
//

import SwiftUI

struct TasksView: View{
    var details: Details
    
    var body: some View{
        VStack{
            ForEach(details.tasks.indices, id: \.self){ index in
                HStack{
                    Text("\(details.tasks[index].name)")
                    Spacer()
                    Button{
                        details.toogleTask(at: index)
                    }label: {
                        Image(systemName: "checkmark.square.fill")
                            .foregroundStyle(details.tasks[index].isCompleted
                                             ?.green : .gray)
                    }.disabled(details.tasks[index].isCompleted)
                }.font(.title3)
                if (index != details.tasks.indices.last){
                    Divider() // adds a small horizontal lines between each row
                }
            }.frame(width: 360)
        }
    }
}

#Preview {
    @Previewable @State var viewModel = Details()
    TasksView(details: viewModel)
}

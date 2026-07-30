//
//  Task.swift
//  Solo Leveling App
//
//  Created by Jashnoor Singh on 29/06/26.
//

// this will create the logic of tasks in the game
import SwiftData

struct Task: Codable{
    let name: String
    let xp: Int
    var isCompleted: Bool = false
}

struct Credentials{ // we will only store creds here
    var email: String = ""
    var password: String = ""
    
}

struct Level: Codable{
    var rank: String = "E"
    var max_xp: Int = 100 // inital xp required to level up
    var current_xp: Int = 0
    var level: Int = 1 { // on increase of level by 1 didset increases max_xp by 100
        didSet{
            max_xp += 100
        }
    }
    
    mutating func levelUP(){
        if current_xp >= max_xp{
            level += 1
            current_xp = current_xp % max_xp // why mod because if current xp is more than max xp after completing a task then current xp is carried on to new level
        }
    }
    
    mutating func increaseRank(){ // used to set up ranks 
        switch level{
            case _ where level >= 150:
                rank = "Monarch"
            case _ where level >= 100:
                rank = "National Level"
            case _ where level >= 70:
                rank = "S"
            case _ where level >= 50:
                rank = "A"
            case _ where level >= 35:
                rank = "B"
            case _ where level >= 20:
                rank = "C"
            case _ where level >= 10:
                rank = "D"
            default :
                rank = "E"
        }
    }
    
}

@Model class Details{ // here we will store all the info
    // Personal Info
    var name: String = ""
    var age: Int = 18
    var gender: String = ""
    
    // Fitness info
    var height: Double? = nil
    var weight: Double? = nil
    var fitness_level: String = ""
    var goal: String = ""
    var preferred_workout: String = ""
    var waterIntake: Int = 0
    var targetIntake: Int = 8 // 8 glasses of 250ml each
    var sleepHours: Int = 2
    var targetHours: Int = 8
    
    // game info
    var streak_count: Int = 0
    
    // level
    var level = Level()
    
    // tasks
    var tasks: [Task] = [
        Task(name: "Run 5k", xp: 10),
        Task(name: "100 pushups", xp: 20),
        Task(name: "10 pullups", xp: 30),
        Task(name: "10 squats", xp: 40),
        Task(name: "100m sprint", xp: 50)
    ]
    
    init(name: String = "Jashnoor"){
        self.name = name
    }
    
    // funcs
    func toogleTask(at index: Int){
        tasks[index].isCompleted.toggle()
        
        if allTasksDone(){ // if all tasks are done then increase the streak by one
            streak_count += 1
        }
    }
    
    
    func allTasksDone()-> Bool{
        tasks.allSatisfy{ task in
            task.isCompleted
        }
    }
    
}

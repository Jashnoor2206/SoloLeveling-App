//
//  RankImageView.swift
//  Solo Leveling App
//
//  Created by Jashnoor Singh on 11/07/26.
//

import SwiftUI

struct RankImageView{
    let rank : String
    var rankImage: String {
        switch rank{
            case "Monarch" : "Monarch rank Image"
            case "National Level": "National rank Image"
            case "S" : "S rank Image"
            case "A" : "A rank Image"
            case "B" : "B rank Image"
            case "C" : "C rank Image"
            case "D" : "D rank Image"
            default: "E rank Image"
        }
    }
}


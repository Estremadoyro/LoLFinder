//
//  Player.swift
//  LoLFinder
//
//  Created by Leonardo  on 30/09/22.
//

import Foundation

// TODO: Coding keys & transform into enums
struct Player {
    var id: String
    var summonerName: String
    var name: String
    var level: Int
    var league: String
    var region: String // Should be of type region

    // Default player
    init() {
        self.id = "100"
        self.summonerName = "Summoner"
        self.name = "Name"
        self.level = 0
        self.league = "Iron"
        self.region = "NA"
    }
}

enum Region: String {
    case lan = "la2"
    case las = "la1"
    case na  = "na1"
}

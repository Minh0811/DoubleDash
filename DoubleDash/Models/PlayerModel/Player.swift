//
//  Player.swift
//  DoubleDash
//
//  Created by Minh Vo on 30/08/2023.
//

import SwiftUI

struct Player: Codable, Hashable {
    var id: UUID = UUID()
    var gameMode: Int
    var username: String
    var score: Int
    var achievementNames: String = "No Achievement"
}

// Purpose of Player.swift:
// This file defines the data structure for a player in the DoubleDash game.
// It captures essential player attributes such as ID, game mode, username, score, and achievements.
// The structure is Codable, allowing for easy serialization and deserialization for data storage and retrieval.

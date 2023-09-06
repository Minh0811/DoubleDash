/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Minh Vo
 ID: S3879953
 Created  date: 20/08/2023 (e.g. 31/07/2023)
 Last modified: 6/09/2023 (e.g. 05/08/2023)
 Acknowledgement:
 */
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

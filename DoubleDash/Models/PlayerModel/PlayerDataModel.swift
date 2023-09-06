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

// Function to save an array of players to a JSON file.
func save(players: [Player]) {
    let encoder = JSONEncoder()
    // Attempt to encode the players array to JSON data.
    if let encodedData = try? encoder.encode(players) {
        // Construct the file URL for saving the data.
        if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("players8.json") {
            // Attempt to write the encoded data to the file.
            try? encodedData.write(to: url)
            print("Data saved to \(url.path)")
        } else {
            print("Failed to encode player data")
        }
    }
}

// Function to load an array of players from a JSON file.
func load() -> [Player]? {
    // Construct the file URL for loading the data.
    if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("players8.json") {
        // Attempt to read the data from the file.
        if let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            // Attempt to decode the data into an array of players.
            if let decodedPlayers = try? decoder.decode([Player].self, from: data) {
                print("Loaded \(decodedPlayers.count) players from \(url.path)")
                return decodedPlayers
            }
        } else {
            print("Failed to load data from \(url.path)")
        }
    }
    return nil
}

// Function to update the score of a player with a specific ID.
func updatePlayerScoreWithId(id: UUID, newScore: Int) {
    var players = load() ?? []
    
    // Loop through all players to find the one with the specified ID.
    for (index, player) in players.enumerated() {
        if player.id == id {
            // Update the score of the found player.
            players[index].score = newScore
            break // Exit the loop once the player is found and updated.
        }
    }
    // Save the updated players array back to the file.
    save(players: players)
}

// Purpose of PlayerDataModel.swift:
// This file manages the saving, loading, and updating of player data.
// It provides functionalities to serialize player data to a JSON format and store it locally.
// The data includes player scores, IDs, and other relevant game statistics.
// This ensures that player progress and scores are persisted across game sessions.


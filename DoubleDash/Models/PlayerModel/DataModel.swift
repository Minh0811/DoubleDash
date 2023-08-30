//
//  DataModel.swift
//  DoubleDash
//
//  Created by Minh Vo on 30/08/2023.
//

import SwiftUI

func save(players: [Player]) {
    let encoder = JSONEncoder()
    if let encodedData = try? encoder.encode(players) {
        if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("players1.json") {
            try? encodedData.write(to: url)
            print("Data saved to \(url.path)")
        }else {
            print("Failed to encode player data")
        }
    }
}

func load() -> [Player]? {
    if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("players1.json") {
        if let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
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


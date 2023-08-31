//
//  Player.swift
//  DoubleDash
//
//  Created by Minh Vo on 30/08/2023.
//

import SwiftUI

struct Player: Codable, Hashable {
    var id: UUID = UUID() 
    var username: String
    var score: Int
}

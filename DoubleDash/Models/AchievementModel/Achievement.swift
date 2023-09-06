//
//  Achievement.swift
//  DoubleDash
//
//  Created by Minh Vo on 01/09/2023.
//

import SwiftUI

struct Achievement: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var imageName: String
    var milestone: Int
}
    
// Purpose of Achievement.swift:
// This file defines the data structure for game achievements in DoubleDash.
// Each achievement has an ID, name, associated image, and a milestone indicating the criteria for earning it.
// The structure is used to track and display player achievements as they progress in the game.

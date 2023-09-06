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

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

import Foundation

struct IdentifiedBlock: Block {
    let id: Int
    var number: Int
}

// Purpose of IdentifiedBlock.swift:
// This file defines the data structure for a block that has a unique identifier in the DoubleNumbers game.
// The IdentifiedBlock structure extends the Block protocol and adds an 'id' property to uniquely identify each block.
// This is particularly useful for tracking individual blocks during gameplay and ensuring distinct operations on them.

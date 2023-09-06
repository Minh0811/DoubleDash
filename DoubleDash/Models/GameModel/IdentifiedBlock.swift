//
//  IdentifiedBlock.swift
//  DoubleNumbers
//
//  Created by Minh Vo on 16/08/2023.
//

import Foundation

struct IdentifiedBlock: Block {
    let id: Int
    var number: Int
}

// Purpose of IdentifiedBlock.swift:
// This file defines the data structure for a block that has a unique identifier in the DoubleNumbers game.
// The IdentifiedBlock structure extends the Block protocol and adds an 'id' property to uniquely identify each block.
// This is particularly useful for tracking individual blocks during gameplay and ensuring distinct operations on them.

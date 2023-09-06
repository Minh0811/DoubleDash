//
//  BlockView.swift
//  my-2048
//
//  Created by Minh Vo on 22/08/2023.
//

import SwiftUI

/// Represents a block in the 2048 game.
struct BlockView: View {
    
    // The number displayed on the block.
    fileprivate let blockNumber: Int?
    
    // A unique identifier for the block.
    fileprivate let uniqueTextIdentifier: String?
    
    // A factor to scale the block size.
    fileprivate let scalingFactor: CGFloat
    
    // MARK: - Initializers
    
    /// Initializes a block with a given number, identifier, and scaling factor.
    init(block: IdentifiedBlock, scalingFactor: CGFloat) {
        self.blockNumber = block.number
        self.uniqueTextIdentifier = "\(block.id):\(block.number)"
        self.scalingFactor = scalingFactor
    }
    
    /// Initializes an empty block with a default scaling factor.
    fileprivate init(scalingFactor: CGFloat = 1.0) {
        self.blockNumber = nil
        self.uniqueTextIdentifier = ""
        self.scalingFactor = scalingFactor
    }
    
    
    // MARK: - Computed Properties
    /// Returns the formatted number to be displayed on the block.
    fileprivate var formattedNumber: String {
        guard let number = blockNumber else {
            return ""
        }
        return String(number)
    }
    
    
    /// Returns the appropriate font size based on the length of the number.
    fileprivate var fontSize: CGFloat {
        let textLength = formattedNumber.count
        switch textLength {
        case 0...2:
            return 32 * scalingFactor
        case 3:
            return 18 * scalingFactor
        case 4...6:
            return 12 * scalingFactor
        default:
            return 10 * scalingFactor
        }
    }
    
    
    /// Returns the appropriate colors for the block based on its number.
    fileprivate var blockColors: (Color, Color) {
        // Return default color for blocks without a number.
        guard let number = blockNumber else {
            return DefaultBlockColorScheme
        }
        
        // Calculate the index based on the number of the block.
        let index = Int(log2(Double(number))) - 1
        
        // Ensure the index is within bounds.
        guard index >= 0, index < BlockColorScheme.count else {
            fatalError("No color for number \(number)")
        }
        
        return BlockColorScheme[index]
    }
    
    // MARK: - Body
    var body: some View {
        ZStack{
            // Background color of the block.
            Rectangle()
                .fill(blockColors.0)
            
            // Number displayed on the block.
            Text(formattedNumber)
                .font(Font.system(size: fontSize).bold())
                .foregroundColor(blockColors.1)
            
        }
    }
    
    // MARK: - Static Methods
    /// Returns an empty block view.
    static func emptyBlockView() -> Self {
        return self.init()
    }
}

// MARK: - Previews
struct BlockView_Previews: PreviewProvider {
    static var previews: some View {
        BlockView(block: IdentifiedBlock(id: 3, number: 2), scalingFactor: 1)
    }
}

// Purpose of BlockView.swift:
// This file defines the visual representation of a block in the 2048 game using SwiftUI.
// The BlockView struct provides a customizable view for each block, including its number, color, and size.
// It also provides utility functions for formatting and styling based on the block's attributes.
// The view is designed to be scalable and adaptive to different game states and configurations.

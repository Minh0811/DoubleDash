/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Minh Vo
  ID: S3879953
  Created  date: 20/08/2023 (e.g. 31/07/2023)
  Last modified: 6/09/2023 (e.g. 05/08/2023)
  Acknowledgement: https://github.com/unixzii/SwiftUI-2048.git
*/

import SwiftUI

/// A view modifier that scales a view based on a given anchor point.
struct ScaledAnchorModifier: ViewModifier {
    let scaleValue: CGFloat
    let anchorPoint: UnitPoint
    
    func body(content: Content) -> some View {
        content.scaleEffect(scaleValue, anchor: anchorPoint)
    }
}

/// A view modifier that applies a blur effect to a view.
struct BlurModifier: ViewModifier {
    let blurValue: CGFloat
    
    func body(content: Content) -> some View {
        content.blur(radius: blurValue)
    }
}

/// A view modifier that combines two other view modifiers.
struct CombinedModifiers<M1: ViewModifier, M2: ViewModifier>: ViewModifier {
    let modifier1: M1
    let modifier2: M2
    
    init(_ m1: M1, _ m2: M2) {
        self.modifier1 = m1
        self.modifier2 = m2
    }
    
    func body(content: Content) -> some View {
        content.modifier(modifier1).modifier(modifier2)
    }
}

// MARK: - extension
extension AnyTransition {
    /// A custom transition for blocks.
    static func blockTransition(from edge: Edge, at position: CGPoint, within rect: CGRect) -> AnyTransition {
        let calculatedAnchor = UnitPoint(x: position.x / rect.width, y: position.y / rect.height)
        
        return .asymmetric(
            insertion: AnyTransition.opacity.combined(with: .move(edge: edge)),
            removal: AnyTransition.opacity.combined(with: .modifier(
                active: CombinedModifiers(
                    ScaledAnchorModifier(scaleValue: 0.8, anchorPoint: calculatedAnchor),
                    BlurModifier(blurValue: 20)
                ),
                identity: CombinedModifiers(
                    ScaledAnchorModifier(scaleValue: 1, anchorPoint: calculatedAnchor),
                    BlurModifier(blurValue: 0)
                )
            ))
        )
    }
}

struct BlockGridView : View {
    // MARK: - Property Declarations
    //  an instance of the `GameLogic` class.
    @EnvironmentObject var gameLogic: GameLogic
    // iphone 14 width size fetched from the shared `GlobalStates` object
    let iphone14BaseWidth = GlobalStates.shared.iphone14BaseWidth
    
    typealias MatrixType = BlockMatrix<IdentifiedBlock>
    
    // Represents the matrix of blocks in the game.
    let matrix: Self.MatrixType
    
    // The edge from which the block enters the grid.
    let blockEnterEdge: Edge
    
    // The size of the device screen.
    let deviceSize: CGFloat
    
    // Computed property to get the current level of the game.
    var currentLevel: Int {
        return gameLogic.currentLevel
    }
    
    // Computed property to get the scaling factor based on the device size.
    var scalingFactor: CGFloat {
        return deviceSize / iphone14BaseWidth
    }
    
    // Computed property to get the block settings (dimension and gap) based on the current level.
    var blockSettings: (dimension: CGFloat, gap: CGFloat) {
        switch currentLevel {
        case 1:
            // Settings for level 1.
            return (60 * scalingFactor, 12 * scalingFactor)
        case 2:
            // Settings for level 2.
            return (55 * scalingFactor, 12 * scalingFactor)
        case 3:
            // Settings for level 3.
            return (50 * scalingFactor, 7 * scalingFactor)
        default:
            // Default settings for other levels.
            return (40 * scalingFactor, 12 * scalingFactor)
        }
    }
    
    // Computed property to get the block dimension based on the current level.
    var blockDimension: CGFloat {
        return blockSettings.dimension
    }

    // Computed property to get the gap between blocks based on the current level.
    var gap: CGFloat {
        return blockSettings.gap
    }

    // Computed property to get the width of the grid based on the block dimension, gap, and board size.
    var gridWidth: CGFloat {
        return CGFloat(gameLogic.boardSize) * (blockDimension + gap) + gap
    }

    // Computed property to get the height of the grid. It's the same as the width since the grid is a square.
    var gridHeight: CGFloat {
        return gridWidth
    }
    
    /// Generates a block view for a given block at a specific index.
    func generateBlock(_ block: IdentifiedBlock?,
                       at index: (Int, Int)) -> some View {
        let position = CGPoint(
            x: CGFloat(index.0) * (blockDimension + gap) + blockDimension / 2 + gap,
            y: CGFloat(index.1) * (blockDimension + gap) + blockDimension / 2 + gap
        )
        
        // Play sound effect when a block is generated
        if block != nil {
            playSoundEffect(named: "Merge.mp3")
        }
        
        let blockView = block.map { BlockView(block: $0, scalingFactor: scalingFactor) } ?? BlockView.emptyBlockView()
        
        
        return blockView
            .frame(width: blockDimension, height: blockDimension, alignment: .center)
            .position(x: position.x, y: position.y)
            .transition(.blockTransition(
                from: self.blockEnterEdge,
                at: CGPoint(x: position.x, y: position.y),
                within: CGRect(x: 0, y: 0, width: gridWidth, height: gridHeight)
            ))
    }
    
    func zIndex(_ block: IdentifiedBlock?) -> Double {
        return block == nil ? 1 : 1000
    }
    
    
    // MARK: - Body
    var body: some View {
        ZStack {
            // Background grid blocks:
            ForEach(0..<gameLogic.boardSize) { x in
                ForEach(0..<gameLogic.boardSize) { y in
                    self.generateBlock(nil, at: (x, y))
                }
            }
            .zIndex(1)
            
            // Number blocks:
            ForEach(self.matrix.flatten, id: \.item.id) {
                self.generateBlock($0.item, at: $0.index)
            }
            .zIndex(1000)
            .animation(.interactiveSpring(response: 0.4, dampingFraction: 0.8))
        }
        .frame(width: gridWidth, height: gridHeight, alignment: .center)
        .background(
            Rectangle()
                .fill(Color(red:0.72, green:0.66, blue:0.63, opacity:1.00))
        )
        .clipped()
        .cornerRadius(6)
        .drawingGroup(opaque: false, colorMode: .linear)
    }
    
}

#if DEBUG
struct BlockGridView_Previews : PreviewProvider {
    static var gameLogic = GameLogic()
        
    static var matrix: BlockGridView.MatrixType {
        var _matrix = BlockGridView.MatrixType(size: gameLogic.boardSize)
        _matrix.place(IdentifiedBlock(id: 1, number: 2), to: (0, 0))
        _matrix.place(IdentifiedBlock(id: 2, number: 4), to: (1, 0))
        _matrix.place(IdentifiedBlock(id: 3, number: 8), to: (2, 0))
        _matrix.place(IdentifiedBlock(id: 4, number: 16), to: (3, 0))
        _matrix.place(IdentifiedBlock(id: 5, number: 32), to: (0, 1))
        _matrix.place(IdentifiedBlock(id: 6, number: 64), to: (1, 1))
        _matrix.place(IdentifiedBlock(id: 7, number: 128), to: (2, 1))
        _matrix.place(IdentifiedBlock(id: 8, number: 2097152), to: (3, 1))
        
        return _matrix
    }
    
    static var previews: some View {
        //ipad = 834
        //ip14 = 390
        let deviceSize: CGFloat = 390
        BlockGridView(matrix: matrix, blockEnterEdge: .top, deviceSize: deviceSize)
            .environmentObject(GameLogic())
            .previewLayout(.sizeThatFits)
    }
}
#endif

// Purpose of BlockGridView.swift:
// This file defines the visual representation of the entire grid of blocks in the DoubleNumbers game using SwiftUI.
// The BlockGridView struct provides a customizable view for the game grid, including individual blocks, their positions, and animations.
// It also contains several view modifiers to enhance the appearance and behavior of blocks, such as scaling, blurring, and custom transitions.
// The grid view is designed to be dynamic, adapting to different game states, block configurations, and device sizes.

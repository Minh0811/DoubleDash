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

import Foundation

// Protocol for a block with an associated type for its value.
protocol Block {
    associatedtype Value
    var number: Value { get set }
}

// Struct representing a block with an index.
struct IndexedBlock<T> where T: Block {
    typealias Index = BlockMatrix<T>.Index
    let index: Self.Index
    let item: T
    
}

// Struct representing a matrix of blocks.
struct BlockMatrix<T> : CustomDebugStringConvertible where T: Block {
    
    typealias Index = (Int, Int)
    fileprivate var matrix: [[T?]]
    
    // Initializer for the block matrix with a given size.
    init(size: Int) {
        matrix = [[T?]]()
        for _ in 0..<size {
            var row = [T?]()
            for _ in 0..<size {
                row.append(nil)
            }
            matrix.append(row)
        }
    }
    
    // Debug description for the block matrix.
    var debugDescription: String {
        matrix.map { row -> String in
            row.map {
                if $0 == nil {
                    return " "
                } else {
                    return String(describing: $0!.number)
                }
            }.joined(separator: "\t")
        }.joined(separator: "\n")
    }
    
    // Flatten the matrix into an array of indexed blocks.
    var flatten: [IndexedBlock<T>] {
        return self.matrix.enumerated().flatMap { (y: Int, element: [T?]) in
            element.enumerated().compactMap { (x: Int, element: T?) in
                guard let element = element else {
                    return nil
                }
                return IndexedBlock(index: (x, y), item: element)
            }
        }
    }
    
    // Subscript to get a block at a specific index.
    subscript(index: Self.Index) -> T? {
        guard isIndexValid(index) else {
            return nil
        }
        
        return matrix[index.1][index.0]
    }
    
    // Move a block from one location to another.
    /// Move the block to specific location and leave the original location blank.
    /// - Parameter from: Source location
    /// - Parameter to: Destination location
    mutating func move(from: Self.Index, to: Self.Index) {
        guard isIndexValid(from) && isIndexValid(to) else {
            // TODO: Throw an error?
            return
        }
        
        guard let source = self[from] else {
            return
        }
        
        matrix[to.1][to.0] = source
        matrix[from.1][from.0] = nil
    }
    
    
    // Move a block from one location to another and change its value.
    /// Move the block to specific location, change its value and leave the original location blank.
    /// - Parameter from: Source location
    /// - Parameter to: Destination location
    /// - Parameter newValue: The new value
    mutating func move(from: Self.Index, to: Self.Index, with newValue: T.Value) {
        guard isIndexValid(from) && isIndexValid(to) else {
            // TODO: Throw an error?
            return
        }
        
        guard var source = self[from] else {
            return
        }
        
        source.number = newValue
        
        matrix[to.1][to.0] = source
        matrix[from.1][from.0] = nil
    }
    
    
    /// Place a block to specific location.
    /// - Parameter block: The block to place
    /// - Parameter to: Destination location
    mutating func place(_ block: T?, to: Self.Index) {
        matrix[to.1][to.0] = block
    }
    
    // Check if an index is valid.
    fileprivate func isIndexValid(_ index: Self.Index) -> Bool {
        guard index.0 >= 0 && index.0 < 6 else {
            return false
        }
        
        guard index.1 >= 0 && index.1 < 6 else {
            return false
        }
        
        return true
    }
    
}

// Purpose of BlockMatrix.swift:
// This file defines the structure and operations for a matrix of blocks used in the game.
// It provides functionalities like moving blocks, merging them, and checking their positions.
// The matrix is central to the game's logic, representing the game board where players interact with blocks.

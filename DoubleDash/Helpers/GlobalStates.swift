//
//  GlobalStates.swift
//  DoubleDash
//
//  Created by Minh Vo on 31/08/2023.
//

import SwiftUI

// GlobalState is a singleton class that holds global properties and data
// that can be accessed from anywhere in the app.
class GlobalStates: ObservableObject {
    
    // MARK: - Singleton Instance
    
    // The shared singleton instance of GlobalState.
    static let shared = GlobalStates()

    // MARK: - Properties
    
    // The base width for iPhone 14. This is use to calculate the scale ratio for a responsive UI.
    @Published var iphone14BaseWidth: CGFloat = 390


    // MARK: - Initializer
    
    // Private initializer to ensure only one instance of GlobalState is created.
    private init() {}
}

// Purpose of GlobalStates.swift:
// This file defines the `GlobalStates` class, which serves as a centralized location for managing global properties and data for the "DoubleDash" game using SwiftUI.
// The main functionalities and features include:
// 1. Singleton Pattern: The `GlobalStates` class follows the Singleton design pattern, ensuring that only one instance of the class is created and shared throughout the app.
// 2. Responsive UI: The `iphone14BaseWidth` property is used as a reference width to calculate scaling factors for creating a responsive UI across different device sizes.
// By centralizing these global properties in this class, it ensures that the game maintains consistent UI scaling and provides a single point of truth for global states.

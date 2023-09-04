//
//  GlobalStates.swift
//  DoubleDash
//
//  Created by Minh Vo on 31/08/2023.
//

import SwiftUI

/// `GlobalState` is a singleton class that holds global properties and data
/// that can be accessed from anywhere in the app.
class GlobalStates: ObservableObject {
    
    // MARK: - Singleton Instance
    
    /// The shared singleton instance of `GlobalState`.
    static let shared = GlobalStates()

    // MARK: - Properties
    
    /// The base width for iPhone 14. This can be used for layout calculations.
    @Published var iphone14BaseWidth: CGFloat = 390


    // MARK: - Initializer
    
    /// Private initializer to ensure only one instance of `GlobalState` is created.
    private init() {}
}

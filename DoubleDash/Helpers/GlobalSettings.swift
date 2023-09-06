//
//  GlobalSettings.swift
//  DoubleDash
//
//  Created by Minh Vo on 04/09/2023.
//

import SwiftUI

class GlobalSettings: ObservableObject {
    
    // MARK: - Singleton Instance
    
    /// The shared singleton instance of `GlobalState`.
    static let shared = GlobalSettings()

    // MARK: - Properties
    

    @Published var isDark: Bool = false
    
    @Published var isEnglish: Bool = true

    // MARK: - Initializer
    
    /// Private initializer to ensure only one instance of `GlobalState` is created.
    private init() {}
}

// Purpose of GlobalSettings.swift:
// This file defines a centralized location for managing global settings in the "DoubleDash" game using SwiftUI.
// The GlobalSettings class provides a mechanism to observe and react to changes in global settings, ensuring a consistent experience throughout the app.
// The main functionalities and features include:
// 1. Singleton Pattern: The GlobalSettings class follows the Singleton design pattern, ensuring that only one instance of the class is created and shared throughout the app.
// 2. Dark Mode Setting: The `isDark` property determines whether the app is in dark mode or light mode.
// 3. Language Setting: The `isEnglish` property determines the language setting of the app, with `true` indicating English and `false` indicating another language.
// By centralizing the global settings in this class, it ensures that changes to settings are reflected consistently across the app and provides a single point of truth for these settings.

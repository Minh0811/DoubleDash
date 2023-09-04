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

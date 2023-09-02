//
//  GlobalData.swift
//  DoubleDash
//
//  Created by Minh Vo on 02/09/2023.
//

import SwiftUI

class GlobalData: ObservableObject {
    
    // MARK: - Singleton Instance
    
    /// The shared singleton instance of `GlobalState`.
    static let shared = GlobalData()

    // MARK: - Properties

    /// A list of achievements that players can achieve.
    let achievements: [Achievement] = [
        Achievement(id: 1, name: "Beginner", imageName: "achievement_1024", milestone: 1024),
        Achievement(id: 2, name: "Intermediate", imageName: "achievement_2048", milestone: 2048),
        Achievement(id: 3, name: "Advanced", imageName: "achievement_8192", milestone: 8192),
        // ... add other achievements as needed
    ]

    // MARK: - Initializer
    
    /// Private initializer to ensure only one instance of `GlobalState` is created.
    private init() {}
}

/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Minh Vo
  ID: S3879953
  Created  date: 31/08/2023 (e.g. 31/07/2023)
  Last modified: 6/09/2023 (e.g. 05/08/2023)
  Acknowledgement:
*/

import SwiftUI

class GlobalDatas: ObservableObject {
    
    // MARK: - Singleton Instance
    
    // The shared singleton instance of GlobalState.
    static let shared = GlobalDatas()

    // MARK: - Properties
    
    // A list of achievements that players can achieve.
    let achievements: [Achievement] = [
        Achievement(id: 1, name: "1K", imageName: "silver_1", milestone: 1000),
        Achievement(id: 2, name: "3K", imageName: "silver_2", milestone: 3000),
        Achievement(id: 3, name: "5K", imageName: "silver_3", milestone: 5000),
        Achievement(id: 4, name: "10K", imageName: "silver_4", milestone: 10000),
        Achievement(id: 5, name: "15K", imageName: "silver_elite", milestone: 15000),
        Achievement(id: 6, name: "20K", imageName: "silver_elite_master", milestone: 20000),
        Achievement(id: 7, name: "50K", imageName: "gold_nova_1", milestone: 50000),
        Achievement(id: 8, name: "100K", imageName: "gold_nova_2", milestone: 100000),
        Achievement(id: 9, name: "200K", imageName: "gold_nova_3", milestone: 200000),
        Achievement(id: 10, name: "400K", imageName: "gold_nova_4", milestone: 400000),
        Achievement(id: 11, name: "600K", imageName: "master_guardian_1", milestone: 600000),
        Achievement(id: 12, name: "800K", imageName: "master_guardian_2", milestone: 800000),
        Achievement(id: 13, name: "1M", imageName: "master_guardian_elite", milestone: 1000000),
        Achievement(id: 14, name: "1M2", imageName: "distinguished_master_guardian", milestone: 1200000),
        Achievement(id: 15, name: "1M4", imageName: "legendary_eagle", milestone: 1400000),
        Achievement(id: 16, name: "1M6", imageName: "legendary_eagle_master", milestone: 1600000),
        Achievement(id: 17, name: "1M8", imageName: "supreme_master_first_class", milestone: 1800000),
        Achievement(id: 18, name: "2M", imageName: "global_elite", milestone: 2000000),
        Achievement(id: 19, name: "...", imageName: "none", milestone: 0),

    ]

    // MARK: - Initializer
    
    // Private initializer to ensure only one instance of GlobalState is created.
    private init() {}
}

// Purpose of GlobalDatas.swift:
// This file defines a centralized location for managing global data related to player achievements in the "DoubleDash" game using SwiftUI.
// The GlobalDatas class provides a mechanism to store and access various achievements that players can achieve during gameplay.
// The main functionalities and features include:
// 1. Singleton Pattern: The GlobalDatas class follows the Singleton design pattern, ensuring that only one instance of the class is created and shared throughout the app.
// 2. Achievements Data: The `achievements` property contains a list of achievements, each with a unique ID, name, image representation, and milestone score required to achieve it.
// 3. Achievement Tiers: The achievements are categorized into different tiers, such as Silver, Gold, Master Guardian, etc., each representing a different level of accomplishment.
// By centralizing the achievements data in this class, it ensures that the game has a consistent set of milestones for players to strive for, and provides a single point of truth for these achievements.

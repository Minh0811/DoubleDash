//
//  GlobalDatas.swift
//  DoubleDash
//
//  Created by Minh Vo on 02/09/2023.
//

import SwiftUI

class GlobalDatas: ObservableObject {
    
    // MARK: - Singleton Instance
    
    /// The shared singleton instance of `GlobalState`.
    static let shared = GlobalDatas()

    // MARK: - Properties

    
//    Silver I (S1)
//    Silver 2 CSGO (S2)
//    Silver III (S3)
//    Silver IV (S4)
//    Silver Elite (SE)
//    Silver Elite Master (SEM)
//    Gold Nova I (GN1)
//    Gold Nova II (GN2)
//    Gold Nova III (GN3)
//    Gold Nova Master (GNM)
//    Master Guardian I (MG1)
//    Master Guardian II (MG2)
//    Master Guardian Elite (MGE)
//    Distinguished Master Guardian CSGO (DMG)
//    Legendary Eagle (LE)
//    Legendary Eagle Master (LEM CSGO)
//    Supreme Master First Class (SMFC)
//    Global Elite CSGO (GE)
    
    
    
    /// A list of achievements that players can achieve.
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
        // ... add other achievements as needed
    ]

    // MARK: - Initializer
    
    /// Private initializer to ensure only one instance of `GlobalState` is created.
    private init() {}
}

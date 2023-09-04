//
//  DoubleDashApp.swift
//  DoubleDash
//
//  Created by Minh Vo on 29/08/2023.
//

import SwiftUI


@main
struct DoubleDashApp: App {
    let gameLogic = GameLogic()
    
    var body: some Scene {
        WindowGroup {
            MenuView()
                .environmentObject(gameLogic)
                .environmentObject(GlobalStates.shared)
                .environmentObject(GlobalDatas.shared)
                .environmentObject(GlobalSettings.shared)
        }
    }
}

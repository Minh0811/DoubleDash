/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Minh Vo
  ID: S3879953
  Created  date: 20/08/2023 (e.g. 31/07/2023)
  Last modified: 6/09/2023 (e.g. 05/08/2023)
  Acknowledgement: 
*/

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

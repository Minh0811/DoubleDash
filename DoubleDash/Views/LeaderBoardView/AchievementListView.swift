/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Minh Vo
  ID: S3879953
  Created  date: 30/08/2023 (e.g. 31/07/2023)
  Last modified: 6/09/2023 (e.g. 05/08/2023)
  Acknowledgement:
*/

import SwiftUI

struct AchievementListView: View {
    //  An instance of the `GlobalSettings` class.
    @EnvironmentObject var globalSettings: GlobalSettings
    //  Provide how the View should be presented for the custom back button
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    // iphone 14 width size fetched from the shared `GlobalStates` object
    let iphone14BaseWidth = GlobalStates.shared.iphone14BaseWidth
    var player: Player
    let achievements = GlobalDatas.shared.achievements

    var body: some View {
        ZStack{
            // Set the background color based on the current theme (dark/light mode).
            globalSettings.isDark ? DarkBackgroundColorScheme.ignoresSafeArea() : BackgroundColorScheme.ignoresSafeArea()
            //  Use GeometryReader to find current device width
            GeometryReader { geometry in
                //  Calculate the ratio between current device and iphone 14
                var scalingFactor: CGFloat {
                    return geometry.size.width / iphone14BaseWidth
                }
                ScrollView {
                    VStack {
                        Text(LocalizedStrings.listOfAchievements)
                            .font(Font.system(size: 35 * scalingFactor).weight(.black))
                            .foregroundColor(globalSettings.isDark ? DarkTitleColorScheme : TitleColorScheme)
                            .padding()
                        // Display the player's name
                        Text(player.username)
                            .font(Font.system(size: 25 * scalingFactor).weight(.black))
                            .foregroundColor(globalSettings.isDark ? DarkTitleColorScheme : TitleColorScheme)
                            .padding()
                        
                        
                        // Display the list of achievements
                        ForEach(achievements.filter { $0.milestone <= player.score }) { achievement in
                            HStack {
                                Spacer()
                                Image(achievement.imageName)
                                    .resizable()
                                    .frame(width: 110 * scalingFactor,height: 50 * scalingFactor)
                                
                                Text(achievement.name)
                                    .font(Font.system(size: 30 * scalingFactor).bold())
                                    .frame(width: 80 * scalingFactor,height: 70 * scalingFactor)
                                
                                Spacer()
                            }
                        }
                    }
                } .onAppear {
                    startBackgroundMusic()
                }
            }
        }
        .customBackButton(presentationMode: presentationMode)
    }
}


struct AchievementListView_Previews: PreviewProvider {
    static var mockPlayer = Player(gameMode: 1, username: "TestUser", score: 10000)

    static var previews: some View {
        AchievementListView(player: mockPlayer)
            .environmentObject(GlobalSettings.shared)
    }
}

// Purpose of AchievementListView.swift:
// This file defines the interface for the achievement list section of the "DoubleDash" game using SwiftUI.
// The AchievementListView struct provides a user interface for players to view the list of achievements they have unlocked based on their scores.
// It displays the player's name at the top, followed by a list of achievements that the player has unlocked.
// Each achievement is represented by an image and its name.
// The view is designed to be responsive, adapting to different device sizes and orientations.
// It also integrates with the global settings to adjust its appearance based on the user's theme preferences (dark/light mode).
// The view provides a custom back button for navigation and plays background music when it appears.

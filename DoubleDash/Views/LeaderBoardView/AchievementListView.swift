//
//  AchievementListView.swift
//  DoubleDash
//
//  Created by Minh Vo on 06/09/2023.
//

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

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

struct HowToPlayView: View {
    
    //  An instance of the `GlobalSettings` class.
    @EnvironmentObject var globalSettings: GlobalSettings
    //  Provide how the View should be presented for the custom back button
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    // iphone 14 width size fetched from the shared `GlobalStates` object
    let iphone14BaseWidth = GlobalStates.shared.iphone14BaseWidth
    
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
                    VStack(alignment: .center){
                        Group {
                            Text(LocalizedStrings.objective)
                                .font(Font.system(size: 25 * scalingFactor).weight(.black))
                                .foregroundColor(globalSettings.isDark ? DarkTitleColorScheme : TitleColorScheme)
                                .padding()
                            Text(LocalizedStrings.objectiveContent1)
                        }
                        .font(Font.system(size: 18 * scalingFactor))
                        .foregroundColor(globalSettings.isDark ? DarkLetterColorScheme : LetterColorScheme)
                        .frame(width: 350 * scalingFactor)

                        Group {
                            Text(LocalizedStrings.theGame)
                                .font(Font.system(size: 25 * scalingFactor).weight(.black))
                                .foregroundColor(globalSettings.isDark ? DarkTitleColorScheme : TitleColorScheme)
                                .padding()
                            Text(LocalizedStrings.theGameContent1)
                        }
                        .font(Font.system(size: 18 * scalingFactor))
                        .foregroundColor(globalSettings.isDark ? DarkLetterColorScheme : LetterColorScheme)
                        .frame(width: 350 * scalingFactor)
                        
                        Group {
                            Text(LocalizedStrings.movingTiles)
                                .font(Font.system(size: 25 * scalingFactor).weight(.black))
                                .foregroundColor(globalSettings.isDark ? DarkTitleColorScheme : TitleColorScheme)
                                .padding()
                            Text(LocalizedStrings.movingTilesContent1)
                            Text(LocalizedStrings.movingTilesContent2)
                            Text(LocalizedStrings.movingTilesContent3)
                        }
                        .font(Font.system(size: 18 * scalingFactor))
                        .foregroundColor(globalSettings.isDark ? DarkLetterColorScheme : LetterColorScheme)
                        .frame(width: 350 * scalingFactor)
                        
                        Group {
                            Text(LocalizedStrings.gameProgression)
                                .font(Font.system(size: 25 * scalingFactor).weight(.black))
                                .foregroundColor(globalSettings.isDark ? DarkTitleColorScheme : TitleColorScheme)
                                .padding()
                            Text(LocalizedStrings.gameProgressionContent1)
                            Text(LocalizedStrings.gameProgressionContent2)
                            Text(LocalizedStrings.gameProgressionContent3)
                            
                        }
                        .font(Font.system(size: 18 * scalingFactor))
                        .foregroundColor(globalSettings.isDark ? DarkLetterColorScheme : LetterColorScheme)
                        .frame(width: 350 * scalingFactor)
                        Group {
                            Text(LocalizedStrings.endOfGame)
                                .font(Font.system(size: 25 * scalingFactor).weight(.black))
                                .foregroundColor(globalSettings.isDark ? DarkTitleColorScheme : TitleColorScheme)
                                .padding()
                            Text(LocalizedStrings.endOfGameContent1)
                        }
                        .font(Font.system(size: 18 * scalingFactor))
                        .foregroundColor(globalSettings.isDark ? DarkLetterColorScheme : LetterColorScheme)
                        .frame(width: 350 * scalingFactor)
                        
                        Group {
                            Text(LocalizedStrings.scoring)
                                .font(Font.system(size: 25 * scalingFactor).weight(.black))
                                .foregroundColor(globalSettings.isDark ? DarkTitleColorScheme : TitleColorScheme)
                                .padding()
                            Text(LocalizedStrings.scoringContent1)
                            
                        }
                        .font(Font.system(size: 18 * scalingFactor))
                        .foregroundColor(globalSettings.isDark ? DarkLetterColorScheme : LetterColorScheme)
                        .frame(width: 350 * scalingFactor)
                        Group {
                            Text(LocalizedStrings.leaderBoard)
                                .font(Font.system(size: 25 * scalingFactor).weight(.black))
                                .foregroundColor(globalSettings.isDark ? DarkTitleColorScheme : TitleColorScheme)
                                .padding()
                            Text(LocalizedStrings.LeaderboardConten1)
                            Text(LocalizedStrings.LeaderboardConten2)
                            Text(LocalizedStrings.LeaderboardConten3)
                            
                        }
                        .font(Font.system(size: 18 * scalingFactor))
                        .foregroundColor(globalSettings.isDark ? DarkLetterColorScheme : LetterColorScheme)
                        .frame(width: 350 * scalingFactor)
                        Group {
                            Text(LocalizedStrings.achievements)
                                .font(Font.system(size: 25 * scalingFactor).weight(.black))
                                .foregroundColor(globalSettings.isDark ? DarkTitleColorScheme : TitleColorScheme)
                                .padding()
                            Text(LocalizedStrings.achievementsContent1)
                            Text(LocalizedStrings.achievementsContent2)
                            Text(LocalizedStrings.achievementsContent3)
                            
                        }
                        .font(Font.system(size: 18 * scalingFactor))
                        .foregroundColor(globalSettings.isDark ? DarkLetterColorScheme : LetterColorScheme)
                        .frame(width: 350 * scalingFactor)
                        
                    }
                    .frame(maxWidth: .infinity)
                }
                .onAppear {
                   // startBackgroundMusic()
                }
            }
        }
        .customBackButton(presentationMode: presentationMode)
    }
}

struct HowToPlayView_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlayView()
            .environmentObject(GlobalSettings.shared)
    }
}

// Purpose of HowToPlayView.swift:
// This file defines the interface for the "How to Play" section of the DoubleDash game using SwiftUI.
// The HowToPlayView struct provides a detailed guide on how to play the game, including objectives, game mechanics, scoring, and more.
// It uses localized strings to present the instructions, ensuring adaptability for multiple languages.
// The view is designed to be responsive, adapting to different device sizes and orientations.
// It also integrates with the global settings to adjust its appearance based on the user's theme preferences (dark/light mode).

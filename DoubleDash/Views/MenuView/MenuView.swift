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

struct MenuView: View {
    
    // MARK: - Property Declarations
    
    //  an instance of the `GameLogic` class.
    @EnvironmentObject var gameLogic: GameLogic
    //  an instance of the `GlobalSettings` class.
    @EnvironmentObject var globalSettings: GlobalSettings
    
    // iphone 14 width size fetched from the shared `GlobalStates` object
    let iphone14BaseWidth = GlobalStates.shared.iphone14BaseWidth
    
    
    // MARK: - Body
    var body: some View {
        
        
        NavigationView {
            ZStack{
                // Set the background color based on the current theme (dark/light mode).
                globalSettings.isDark ? DarkBackgroundColorScheme.ignoresSafeArea() : BackgroundColorScheme.ignoresSafeArea()
                //  Use GeometryReader to find current device width
                GeometryReader { geometry in
                    //  Calculate the ratio between current device and iphone 14
                    var scalingFactor: CGFloat {
                        return geometry.size.width / iphone14BaseWidth
                    }
                    HStack{
                        Spacer()
                        VStack{
                            Spacer()
                            // Display the menu buttons.
                            menuButtons(scalingFactor: scalingFactor)
                                .padding()
                            Spacer()
                        }
                        Spacer()
                    }
                }
                .onAppear {
                    startBackgroundMusic()
                }
               
            }
            
            
        }  .navigationViewStyle(.stack)
        
    }
    
}

// MARK: - Extension
extension MenuView {
    
    /// Creates and returns the menu buttons, including "Play Game", "Leaderboard", "How To Play", and "Game Setting".
    ///
    /// - Parameter scalingFactor: A factor to scale the UI elements based on the screen width.
    /// - Returns: A `VStack` containing the menu buttons.
    func menuButtons(scalingFactor: CGFloat) -> some View {
        VStack(spacing: 10) {
            Image("logo")
                .resizable()
                .frame(width: 100 * scalingFactor, height: 100 * scalingFactor)
                .cornerRadius(10 * scalingFactor)
            // Welcome text.
            Text(LocalizedStrings.welcome)
                .font(Font.system(size: 45 * scalingFactor).weight(.black))
                .foregroundColor(globalSettings.isDark ? DarkTitleColorScheme : TitleColorScheme)
               
            Text("DoubleDash")
                .font(Font.system(size: 35 * scalingFactor).weight(.black))
                .foregroundColor(globalSettings.isDark ? DarkTitleColorScheme : TitleColorScheme)
        
            
            // Play Game button.
            NavigationLink(
                destination: RegistrationView().environmentObject(gameLogic),
                label: {
                    Text(LocalizedStrings.playGame)
                        .font(Font.system(size: 28 * scalingFactor))
                        .padding()
                        .frame(width: 230 * scalingFactor, height: 70 * scalingFactor)
                        .background(globalSettings.isDark ? ButtonColorScheme: DarkButtonColorScheme)
                        .foregroundColor(globalSettings.isDark ? DarkButtonLetterColorScheme : ButtonLetterColorScheme)
                        .cornerRadius(10 * scalingFactor)
                    
                }
            ).onTapGesture {
                gameLogic.newGame()
            }
            
            // Leaderboard button.
            NavigationLink(
                destination: LeaderBoardView(),
                label: {
                    Text(LocalizedStrings.leaderBoard)
                        .font(Font.system(size: 28 * scalingFactor))
                        .padding()
                        .frame(width: 230 * scalingFactor, height: 70 * scalingFactor)
                        .background(globalSettings.isDark ? ButtonColorScheme: DarkButtonColorScheme)
                        .foregroundColor(globalSettings.isDark ? DarkButtonLetterColorScheme : ButtonLetterColorScheme)
                        .cornerRadius(10 * scalingFactor)
                    
                }
            )
            
            // How to play button.
            NavigationLink(
                destination: HowToPlayView(), // Use the same gameLogic instance
                label: {
                    Text(LocalizedStrings.howToPlay)
                        .font(Font.system(size: 28 * scalingFactor))
                        .padding()
                        .frame(width: 230 * scalingFactor, height: 70 * scalingFactor)
                        .background(globalSettings.isDark ? ButtonColorScheme: DarkButtonColorScheme)
                        .foregroundColor(globalSettings.isDark ? DarkButtonLetterColorScheme : ButtonLetterColorScheme)
                        .cornerRadius(10 * scalingFactor)
                }
            )
            
            // Game Setting button.
            NavigationLink(
                destination: DifficultySelectionView().environmentObject(gameLogic), // Use the same gameLogic instance
                label: {
                    Text(LocalizedStrings.gameSetting)
                        .font(Font.system(size: 28 * scalingFactor))
                        .padding()
                        .frame(width: 230 * scalingFactor, height: 70 * scalingFactor)
                        .background(globalSettings.isDark ? ButtonColorScheme: DarkButtonColorScheme)
                        .foregroundColor(globalSettings.isDark ? DarkButtonLetterColorScheme : ButtonLetterColorScheme)
                        .cornerRadius(10 * scalingFactor)
                }
            )
        }
    }
}

// MARK: - Previews
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .environmentObject(GameLogic())
            .environmentObject(GlobalSettings.shared)
            .previewLayout(.sizeThatFits)
    }
}

// Purpose of MenuView.swift:
// This file defines the main menu interface for the "my-2048" game using SwiftUI.
// The MenuView struct provides a user interface that acts as the entry point for the game, offering several options to the user.
// The main functionalities include:
// 1. Displaying a welcome message to the user.
// 2. Providing navigation buttons for the following:
//    - Starting a new game (Play Game).
//    - Viewing the leaderboard (Leaderboard).
//    - Learning how to play the game (How To Play).
//    - Adjusting game settings, including difficulty (Game Setting).
// The view is designed to be responsive, adapting to different device sizes and orientations.
// It also integrates with the global settings to adjust its appearance based on the user's theme preferences (dark/light mode).
// The view plays background music when it appears.
// The menu buttons are designed with a consistent look and feel, and they navigate to their respective views when tapped.

//
//  MenuView.swift
//  my-2048
//
//  Created by Minh Vo on 24/08/2023.
//

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
        VStack(spacing: 20) {
            // Welcome text.
            Text(LocalizedStrings.welcome)
                .font(Font.system(size: 65 * scalingFactor).weight(.black))
                .foregroundColor(globalSettings.isDark ? DarkTitleColorScheme : TitleColorScheme)
                .padding(.vertical, 50 * scalingFactor)
            
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

//
//  RegistrationView.swift
//  DoubleDash
//
//  Created by Minh Vo on 30/08/2023.
//

import SwiftUI

struct RegistrationView: View {
    @EnvironmentObject var gameLogic: GameLogic
    @EnvironmentObject var globalSettings: GlobalSettings
    let iphone14BaseWidth = GlobalStates.shared.iphone14BaseWidth
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
   
    @State private var players: [Player] = []
    @State private var newPlayer: Player?
    
    @State private var shouldNavigateToGame: Bool = false
    @State private var localUsername: String = ""
    let newPlayerAchievement: String = ""
    
    
    
    var body: some View {
        ZStack{
            //Background
            globalSettings.isDark ? DarkBackgroundColorScheme.ignoresSafeArea() : BackgroundColorScheme.ignoresSafeArea()
            GeometryReader { geometry in
                var scalingFactor: CGFloat {
                    return geometry.size.width / iphone14BaseWidth
                }
                // * scalingFactor
                VStack(spacing: 20) {
                    Spacer() // Push the content to the center vertically
                    Text(LocalizedStrings.registerYourName)
                        .font(Font.system(size: 30 * scalingFactor).weight(.black))
                        .foregroundColor(globalSettings.isDark ? DarkTitleColorScheme : TitleColorScheme)
                        .padding()
                    
                    TextField(LocalizedStrings.enterYourUserName, text: $localUsername)
                        .frame(width: 300 * scalingFactor, height: 20 * scalingFactor)
                        .font(Font.system(size: 18 * scalingFactor))
                        .padding()
                        .background(globalSettings.isDark ?Color.white.opacity(0.8) : Color.gray.opacity(0.2))
                        .cornerRadius(10 * scalingFactor)
                    
                    
                    //if let player = newPlayer {
                    Button(action: {
                        print("Entered username: \(localUsername)")
                        print("Existing players: \(players)")
                        newPlayer = Player(gameMode: gameLogic.currentLevel, username: localUsername, score: 0, achievementNames: newPlayerAchievement)
                        players.append(newPlayer!)
                        save(players: players)
                        gameLogic.newGame() // Start a new game
                        //navigateToGame = true
                        print("Player saved and game started")
                        shouldNavigateToGame = true
                    }) {
                        Text(LocalizedStrings.startGame)
                            .font(Font.system(size: 28 * scalingFactor))
                            .padding()
                            .frame(width: 230 * scalingFactor, height: 70 * scalingFactor)
                            .background(globalSettings.isDark ? ButtonColorScheme: DarkButtonColorScheme)
                            .foregroundColor(globalSettings.isDark ? DarkButtonLetterColorScheme : ButtonLetterColorScheme)
                            .cornerRadius(10 * scalingFactor)
                    }.frame(maxWidth: .infinity)
                    
                    NavigationLink(
                        destination: GameView(currentPlayer: $newPlayer).environmentObject(gameLogic),
                        isActive: $shouldNavigateToGame,
                        label: { EmptyView() }
                    )
                    
                    Spacer() // Push the content to the center vertically
                }
                .padding()
                .onAppear {
                    players = load() ?? []
                }
            }
        }
        .customBackButton(presentationMode: presentationMode)
    }
    func isUsernameUnique() -> Bool {
        return !players.contains { $0.username == localUsername }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
            .environmentObject(GameLogic())
            .environmentObject(GlobalSettings.shared)
    }
}

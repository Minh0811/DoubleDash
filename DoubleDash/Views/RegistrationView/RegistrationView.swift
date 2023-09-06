//
//  RegistrationView.swift
//  DoubleDash
//
//  Created by Minh Vo on 30/08/2023.
//

import SwiftUI

struct RegistrationView: View {
    // MARK: - Property Declarations
    //  an instance of the `GameLogic` class.
    @EnvironmentObject var gameLogic: GameLogic
    //  an instance of the `GlobalSettings` class.
    @EnvironmentObject var globalSettings: GlobalSettings
    // iphone 14 width size fetched from the shared `GlobalStates` object
    let iphone14BaseWidth = GlobalStates.shared.iphone14BaseWidth
    //  Provide how the View should be presented for the custom back button
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    // State properties to manage player data and navigation.
    @State private var players: [Player] = []
    @State private var newPlayer: Player?
    @State private var shouldNavigateToGame: Bool = false
    @State private var showingAlert = false
    @State private var localUsername: String = ""
    let newPlayerAchievement: String = ""
    
    
    // MARK: - Body
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
                VStack(spacing: 20) {
                    // Display registration UI components.
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
                        .disableAutocorrection(true)
                    
                
                    Button(action: {
                        print("Entered username: \(localUsername)")
                        print("Existing players: \(players)")
                        if isUsernameUnique() {
                            newPlayer = Player(gameMode: gameLogic.currentLevel, username: localUsername, score: 0, achievementNames: newPlayerAchievement)
                            players.append(newPlayer!)
                            save(players: players)
                            gameLogic.newGame() // Start a new game
                            print("Player saved and game started")
                            shouldNavigateToGame = true
                        } else {
                            newPlayer = Player(gameMode: gameLogic.currentLevel, username: localUsername, score: 0, achievementNames: newPlayerAchievement)
                            players.append(newPlayer!)
                            save(players: players)
                            gameLogic.newGame() // Start a new game
                            print("Player saved and game started")
                            showingAlert = true
                        }
                    }) {
                        Text(LocalizedStrings.startGame)
                            .font(Font.system(size: 28 * scalingFactor))
                            .padding()
                            .frame(width: 230 * scalingFactor, height: 70 * scalingFactor)
                            .background(globalSettings.isDark ? ButtonColorScheme: DarkButtonColorScheme)
                            .foregroundColor(globalSettings.isDark ? DarkButtonLetterColorScheme : ButtonLetterColorScheme)
                            .cornerRadius(10 * scalingFactor)
                    }
                    .frame(maxWidth: .infinity)
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text(LocalizedStrings.alertTitleRegistrationView),
                              message: Text(LocalizedStrings.alertContentRegistrationView),
                              primaryButton: .default(Text(LocalizedStrings.alertDefaultButtonRegistrationView), action: {
                                shouldNavigateToGame = true
                                  }),
                              secondaryButton: .cancel(Text(LocalizedStrings.alertCancelButtonContentRegistrationView))
                            )
                        }
                    
                    NavigationLink(
                        destination: GameView(currentPlayer: $newPlayer).environmentObject(gameLogic),
                        isActive: $shouldNavigateToGame,
                        label: { EmptyView() }
                    )
                    
                    Spacer() // Push the content to the center vertically
                }
                .padding()
                .onAppear {
                    // Load existing players when the view appears.
                    players = load() ?? []
                }
            } .onAppear {
                startBackgroundMusic()
            }
        }
        // Add a custom back button to the view.
        .customBackButton(presentationMode: presentationMode)
    }
    // MARK: - Function
    
    // Checks if the entered username is unique among registered players.
    func isUsernameUnique() -> Bool {
        return !players.contains { $0.username == localUsername }
    }
}

// MARK: - Previews
struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
            .environmentObject(GameLogic())
            .environmentObject(GlobalSettings.shared)
    }
}

//
//  RegistrationView.swift
//  DoubleDash
//
//  Created by Minh Vo on 30/08/2023.
//

import SwiftUI

struct RegistrationView: View {
    @State private var localUsername: String = ""
    @State private var players: [Player] = []
    @State private var showErrorAlert: Bool = false
    @EnvironmentObject var gameLogic: GameLogic
    @State private var navigateToGame: Bool = false
    @State private var newPlayer: Player?
    @State private var shouldNavigateToGame: Bool = false
    @StateObject var globalState = GlobalState()
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    let newPlayerAchievement: [String] = []
    
    var body: some View {
        ZStack{
            //Background
            BackgroundColorScheme.ignoresSafeArea()
            GeometryReader { geometry in
                var scalingFactor: CGFloat {
                    return geometry.size.width / globalState.iphone14BaseWidth
                }
                // * scalingFactor
                VStack(spacing: 20) {
                    Spacer() // Push the content to the center vertically
                    Text("Register Your Name")
                        .font(Font.system(size: 30 * scalingFactor).weight(.black))
                        .foregroundColor(Color(red:0.47, green:0.43, blue:0.40, opacity:1.00))
                        .padding()
                    
                    TextField("Enter your username", text: $localUsername)
                        .frame(width: 300 * scalingFactor, height: 20 * scalingFactor)
                        .font(Font.system(size: 18 * scalingFactor))
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10 * scalingFactor)
                    
                    
                    //if let player = newPlayer {
                    Button(action: {
                        print("Entered username: \(localUsername)")
                        print("Existing players: \(players)")
                        newPlayer = Player(gameMode: gameLogic.currentLevel, username: localUsername, score: 0, achievementNames: newPlayerAchievement)
                        players.append(newPlayer!)
                        save(players: players)
                        gameLogic.newGame() // Start a new game
                        navigateToGame = true
                        print("Player saved and game started")
                        shouldNavigateToGame = true
                    }) {
                        Text("Start Game")
                            .font(Font.system(size: 18 * scalingFactor))
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
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
        RegistrationView().environmentObject(GameLogic())
    }
}

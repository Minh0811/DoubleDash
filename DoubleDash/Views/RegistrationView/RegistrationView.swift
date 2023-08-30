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



    
    var body: some View {
        ZStack{
            //Background
            BackgroundColorScheme.ignoresSafeArea()
            VStack(spacing: 20) {
                Text("Register Your Name")
                    .font(.largeTitle)
                    .padding()
                
                TextField("Enter your username", text: $localUsername)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
                NavigationLink(
                    destination: GameView().environmentObject(gameLogic),
                    
                    label: {
                        Text("Start Game")
                            .font(.title)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                ).onDisappear {
                    print("Entered username: \(localUsername)")
                    print("Existing players: \(players)")
                    if isUsernameUnique() {
                        let newPlayer = Player(username: localUsername, score: 0)
                        players.append(newPlayer)
                        save(players: players)
                        gameLogic.newGame() // Start a new game
                        navigateToGame = true
                        print("isUsernameUnique ran")
                    } else {
                        
                        showErrorAlert = true
                    }
                }
                
                //            NavigationLink(
                //                destination: GameView().environmentObject(gameLogic),
                //                label: {
                //                    Text("Game")
                //                        .font(.title)
                //                        .padding()
                //                        .background(Color.green)
                //                        .foregroundColor(.white)
                //                        .cornerRadius(10)
                //
                //                }
                //            ).onTapGesture {
                //                gameLogic.newGame()
                //            }
                
                
            }
            .padding()
            .onAppear {
                players = load() ?? []
            }
        }
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

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
                
          
               //if let player = newPlayer {
                    NavigationLink(
                        destination: GameView(currentPlayer: $newPlayer).environmentObject(gameLogic),
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
                      //  if isUsernameUnique() {
                            newPlayer = Player(username: localUsername, score: 0)
                            players.append(newPlayer!)
                            save(players: players)
                            gameLogic.newGame() // Start a new game
                            navigateToGame = true
                            print("isUsernameUnique ran")
                     //   } else {
                     //       showErrorAlert = true
                     //   }
                    }
           //     }
                
                
                
                
                
                
//                Button(action: {
//                    if isUsernameUnique() {
//                        newPlayer = Player(username: localUsername, score: 0)
//                        players.append(newPlayer!)
//                        save(players: players)
//                        gameLogic.newGame() // Start a new game
//                        navigateToGame = true
//                        print("isUsernameUnique ran")
//                    } else {
//                        showErrorAlert = true
//                    }
//                }) {
//                    Text("Start Game")
//                        .font(.title)
//                        .padding()
//                        .background(Color.green)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//
//                NavigationLink("", destination: GameView(currentPlayer: $newPlayer).environmentObject(gameLogic)).opacity(0)
//                    .frame(width: 0, height: 0)
//                    .disabled(!navigateToGame)
                
                
                
                
                
                
                
                
                
                
                
                
                
                
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

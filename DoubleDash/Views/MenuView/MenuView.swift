//
//  MenuView.swift
//  my-2048
//
//  Created by Minh Vo on 24/08/2023.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var gameLogic: GameLogic
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            menuButtons
                .padding()
        }
        .navigationViewStyle(.stack)
    }
}

extension MenuView {
    
    private var menuButtons: some View {
        VStack(spacing: 20) {
            Text("Select Difficulty")
                .font(.largeTitle)
                .padding()

            NavigationLink(
                destination: GameView().environmentObject(gameLogic),
                label: {
                    Text("Game")
                        .font(.title)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                }
            ).onTapGesture {
                gameLogic.newGame()
            }
//                .onDisappear {
//                    gameLogic.newGame()
//                }
            
            Button(action: {
                
            }) {
                Text("Leader Board")
                    .font(.title)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Button(action: {
                
            }) {
                Text("How to Play")
                    .font(.title)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            NavigationLink(
                destination: DifficultySelectionView().environmentObject(gameLogic), // Use the same gameLogic instance
                label: {
                    Text("Setting")
                        .font(.title)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            )
        }
    }
}


struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .environmentObject(GameLogic())
            .previewLayout(.sizeThatFits)
    }
}

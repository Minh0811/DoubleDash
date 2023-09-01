//
//  LeaderBoardView.swift
//  DoubleDash
//
//  Created by Minh Vo on 30/08/2023.
//

import SwiftUI

struct LeaderBoardView: View {
    @State private var players: [Player] = []
    @StateObject var globalState = GlobalState()
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    var hardPlayers: [Player] {
        highestScoringPlayers(from: players.filter { $0.gameMode == 1 })
    }
    
    var mediumPlayers: [Player] {
        highestScoringPlayers(from: players.filter { $0.gameMode == 2 })
    }
    
    var easyPlayers: [Player] {
        highestScoringPlayers(from: players.filter { $0.gameMode == 3 })
    }
    
    var body: some View {
        ZStack{
            //Background
            BackgroundColorScheme.ignoresSafeArea()
            GeometryReader { geometry in
                var scalingFactor: CGFloat {
                    return geometry.size.width / globalState.iphone14BaseWidth
                }
                ScrollView {
                    Text("Leader Board")
                        .font(Font.system(size: 48 * scalingFactor).weight(.black))
                        .foregroundColor(Color(red:0.47, green:0.43, blue:0.40, opacity:1.00))
                        .padding()
                    VStack(spacing: 20) {
                        leaderboardSection(title: "Hard", players: hardPlayers, scalingFactor: scalingFactor)
                        leaderboardSection(title: "Medium", players: mediumPlayers, scalingFactor: scalingFactor)
                        leaderboardSection(title: "Easy", players: easyPlayers, scalingFactor: scalingFactor)
                    }
                    .padding()
                }
                .onAppear {
                    players = load() ?? []
                }
            }
        }
        .customBackButton(presentationMode: presentationMode)
    }
    
    func leaderboardSection(title: String, players: [Player], scalingFactor: CGFloat) -> some View {
        VStack{
            Text(title)
                .font(Font.system(size: 24 * scalingFactor).weight(.black))
                .padding(.leading)
            
            VStack(spacing: 10 * scalingFactor) {
                // Table headers
                tableHeader(scalingFactor: scalingFactor)
                    .padding(.top, 7 * scalingFactor)
                    .frame(maxWidth: 300 * scalingFactor)
                
                Divider()
                
                ForEach(players, id: \.id) { player in
                    HStack {
                        
                        // Limit the username to 10 characters and append "..." if truncated
                        Text(player.username.count > 8 ? String(player.username.prefix(10)) + "..." : player.username)
                        .padding(.leading, 10 * scalingFactor)
                            .font(Font.system(size: 17 * scalingFactor))
                        Spacer()
                        Text("\(player.score)")
                          //  .font(.subheadline)
                        // .padding(.trailing, 60 * scalingFactor)
                            .font(Font.system(size: 17 * scalingFactor))
                            .padding(.trailing, 20 * scalingFactor)
                        Text("Achievement")
                          //  .font(.subheadline)
                        // .padding(.trailing, 60 * scalingFactor)
                            .font(Font.system(size: 17 * scalingFactor))
                            .padding(.trailing, 20 * scalingFactor)
                        
                    }
                    //  .padding(10 * scalingFactor)
                    .frame(maxWidth: 320 * scalingFactor)
                    Divider()
                }
            }
            .background(Color.white)
            .cornerRadius(10 * scalingFactor)
            .padding(.top, 2 * scalingFactor)
        }
    }
    
    func highestScoringPlayers(from players: [Player]) -> [Player] {
        let groupedPlayers = Dictionary(grouping: players, by: { $0.username })
        return groupedPlayers.compactMap { (username, players) -> Player? in
            players.max(by: { $0.score < $1.score })
        }.sorted(by: { $0.score > $1.score })
    }
    
    private func tableHeader(scalingFactor: CGFloat) -> some View {
        HStack{
            Text("Name")
            //   .padding(.leading, 60 * scalingFactor) // Match the padding of the player's name below
                .font(Font.system(size: 17 * scalingFactor))
            Spacer()
            Text("High Score")
            // .padding(.trailing, 60 * scalingFactor) // Match the padding of the player's score below
                .font(Font.system(size: 17 * scalingFactor))
            Spacer()
            Text("Achievement")
            // .padding(.trailing, 60 * scalingFactor) // Match the padding of the player's score below
                .font(Font.system(size: 17 * scalingFactor))
        }
    }
    
    
}

struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()
    }
}

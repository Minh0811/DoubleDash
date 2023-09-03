//
//  LeaderBoardView.swift
//  DoubleDash
//
//  Created by Minh Vo on 30/08/2023.
//

import SwiftUI

struct LeaderBoardView: View {
    @State private var players: [Player] = []
    let iphone14BaseWidth = GlobalState.shared.iphone14BaseWidth
    let achievements = GlobalData.shared.achievements
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    let collumnWidthSize: CGFloat = 110
    let tableHeaderFontSize: CGFloat = 18
    let tableContentFontSize: CGFloat = 17
    
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
                    return geometry.size.width / iphone14BaseWidth
                }
                ScrollView {
                    Text("Leader Board")
                        .font(Font.system(size: 48 * scalingFactor).weight(.black))
                        .foregroundColor(Color.black)
                        .padding()
                    VStack(spacing: 20) {
                        leaderboardSection(title: "Hard", players: hardPlayers, scalingFactor: scalingFactor)
                        leaderboardSection(title: "Medium", players: mediumPlayers, scalingFactor: scalingFactor)
                        leaderboardSection(title: "Easy", players: easyPlayers, scalingFactor: scalingFactor)
                    }
                    .padding()
                    NavigationLink(
                        destination: PlayerStatisticsView(), // Use the same gameLogic instance
                        label: {
                            Text("Player Statistics")
                                .font(.title)
                                .padding()
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }
                    )
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
                .foregroundColor(Color(red:0.47, green:0.43, blue:0.40, opacity:1.00))
                .padding(.leading)
            
            VStack(spacing: 10 * scalingFactor) {
                // Table headers
                tableHeader(scalingFactor: scalingFactor, tableHeaderFontSize: tableHeaderFontSize)
                    .padding(.top, 10 * scalingFactor)
                    .frame(maxWidth: 300 * scalingFactor)
                
                Divider()
                
                ForEach(players, id: \.id) { player in
                    HStack {
                        
                        // Limit the username to 10 characters and append "..." if truncated
                        Text(player.username.count > 8 ? String(player.username.prefix(10)) + "..." : player.username)
                            .frame(width: collumnWidthSize * scalingFactor)
                            .font(Font.system(size: tableContentFontSize * scalingFactor))
                      
                        Spacer()
                        
                        Text("\(player.score)")
                            .font(Font.system(size: tableContentFontSize * scalingFactor))
                            .frame(width: collumnWidthSize * scalingFactor)

                        Spacer()
                        
                        displayAchievement(for: player, tableContentFontSize: tableContentFontSize, scalingFactor: scalingFactor)
                            .font(Font.system(size: tableContentFontSize * scalingFactor))
                            .frame(width: collumnWidthSize * scalingFactor)
                    }
                    .frame(maxWidth: 320 * scalingFactor)
                    Divider()
                }
            }
            .background(Color.white)
            .cornerRadius(10 * scalingFactor)
            .padding(.top, 2 * scalingFactor)
        }
    }
    
    func updateAchievement(for player: inout Player) {
        let achieved = achievements.filter { $0.milestone <= player.score }
        if let highestAchievement = achieved.sorted(by: { $0.milestone > $1.milestone }).first {
            player.achievementNames = highestAchievement.name
        } else {
            player.achievementNames = "No Achievement"
        }
    }
    
    
    func highestScoringPlayers(from players: [Player]) -> [Player] {
        let groupedPlayers = Dictionary(grouping: players, by: { $0.username })
        return groupedPlayers.compactMap { (username, players) -> Player? in
            if var highestScorePlayer = players.max(by: { $0.score < $1.score }) {
                updateAchievement(for: &highestScorePlayer) // Assuming you have a globalState.achievements containing all achievements
                return highestScorePlayer
            }
            return nil
        }.sorted(by: { $0.score > $1.score })
    }
    
    
    private func tableHeader(scalingFactor: CGFloat, tableHeaderFontSize: CGFloat) -> some View {
        HStack{
            Text("Name")
                .frame(width: collumnWidthSize * scalingFactor)
                .font(Font.system(size: tableHeaderFontSize * scalingFactor).bold())
            
            Spacer()
            
            Text("High Score")
                .frame(width: collumnWidthSize * scalingFactor)
                .font(Font.system(size: tableHeaderFontSize * scalingFactor).bold())
            
            Spacer()
            
            Text("Medal")
                .frame(width: collumnWidthSize * scalingFactor)
                .font(Font.system(size: tableHeaderFontSize * scalingFactor).bold())
        }
    }

    
    private func displayAchievement(for player: Player, tableContentFontSize: CGFloat, scalingFactor: CGFloat) -> some View {
        VStack{
            if let achievement = achievements.first(where: { $0.name == player.achievementNames }) {
                Image(achievement.imageName) // Display the achievement image
                    .resizable()
                        .frame(width: 90 * scalingFactor, height: 40 * scalingFactor)
                Text(achievement.name)      // Display the achievement name
                    .font(Font.system(size: tableContentFontSize * scalingFactor))
            } else {
                Text("No Achievement")
            }
        }
    }
}


struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()
    }
}

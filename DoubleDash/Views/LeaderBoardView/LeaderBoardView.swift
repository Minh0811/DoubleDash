//
//  LeaderBoardView.swift
//  DoubleDash
//
//  Created by Minh Vo on 30/08/2023.
//

import SwiftUI

struct LeaderBoardView: View {
    // MARK: - Property Declarations
    //  an instance of the `GlobalSettings` class.
    @EnvironmentObject var globalSettings: GlobalSettings
    // iphone 14 width size fetched from the shared `GlobalStates` object
    let iphone14BaseWidth = GlobalStates.shared.iphone14BaseWidth
    // Achivements data fetched from the shared `GlobalDatas` object
    let achievements = GlobalDatas.shared.achievements
    //  Provide how the View should be presented for the custom back button
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    // State properties to manage player data.
    @State private var players: [Player] = []
    
    // UI constants for table layout.
    let collumnWidthSize: CGFloat = 100
    let tableHeaderFontSize: CGFloat = 18
    let tableContentFontSize: CGFloat = 17
    
    // Filtered lists of players based on their difficulty level.
    var hardPlayers: [Player] {
        highestScoringPlayers(from: players.filter { $0.gameMode == 1 })
    }
    
    var mediumPlayers: [Player] {
        highestScoringPlayers(from: players.filter { $0.gameMode == 2 })
    }
    
    var easyPlayers: [Player] {
        highestScoringPlayers(from: players.filter { $0.gameMode == 3 })
    }
    
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
                ScrollView {
                    // Display leaderboard UI components.
                    Text(LocalizedStrings.leaderBoard)
                        .font(Font.system(size: 48 * scalingFactor).weight(.black))
                        .foregroundColor(globalSettings.isDark ? DarkTitleColorScheme : TitleColorScheme)
                        .padding()
                    VStack(spacing: 20) {
                        leaderboardSection(title: LocalizedStrings.hard, players: hardPlayers, scalingFactor: scalingFactor)
                        leaderboardSection(title: LocalizedStrings.medium, players: mediumPlayers, scalingFactor: scalingFactor)
                        leaderboardSection(title: LocalizedStrings.easy, players: easyPlayers, scalingFactor: scalingFactor)
                    }
                    .padding()
                    NavigationLink(
                        destination: PlayerStatisticsView(), // Use the same gameLogic instance
                        label: {
                            Text(LocalizedStrings.playerStatistic)
                                .font(Font.system(size: 30 * scalingFactor))
                                .padding()
                                .background(globalSettings.isDark ? ButtonColorScheme: DarkButtonColorScheme)
                                .foregroundColor(globalSettings.isDark ? DarkButtonLetterColorScheme : ButtonLetterColorScheme)
                                .cornerRadius(10)
                        }
                    )
                }
                .onAppear {
                    // Load existing players when the view appears.
                    players = load() ?? []
                    
                            startBackgroundMusic()
                        
                }
            }
        }
        .customBackButton(presentationMode: presentationMode)
    }
    
    // MARK: - Helper Functions
    /// Creates a section of the leaderboard for a specific difficulty level.
    func leaderboardSection(title: String, players: [Player], scalingFactor: CGFloat) -> some View {
        VStack{
            Text(title)
                .font(Font.system(size: 24 * scalingFactor).weight(.black))
                .foregroundColor(globalSettings.isDark ? DarkTitleColorScheme : TitleColorScheme)
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
                            .foregroundColor(globalSettings.isDark ? DarkLetterColorScheme : LetterColorScheme)
                      
                        Spacer()
                        
                        Text("\(player.score)")
                            .font(Font.system(size: tableContentFontSize * scalingFactor))
                            .frame(width: collumnWidthSize * scalingFactor)
                            .foregroundColor(globalSettings.isDark ? DarkLetterColorScheme : LetterColorScheme)

                        Spacer()
                        
                        displayAchievement(for: player, tableContentFontSize: tableContentFontSize, scalingFactor: scalingFactor)
                            .font(Font.system(size: tableContentFontSize * scalingFactor))
                            .frame(width: collumnWidthSize * scalingFactor)
                            .foregroundColor(globalSettings.isDark ? DarkLetterColorScheme : LetterColorScheme)
                    }
                    .frame(maxWidth: 320 * scalingFactor)
                    Divider()
                }
            }
            .background(globalSettings.isDark ? Color.gray : Color.white)
            .cornerRadius(10 * scalingFactor)
            .padding(.top, 2 * scalingFactor)
        }
    }
    
    /// Displays the table header for the leaderboard.
    private func tableHeader(scalingFactor: CGFloat, tableHeaderFontSize: CGFloat) -> some View {
        HStack{
            Text(LocalizedStrings.name)
                .frame(width: collumnWidthSize * scalingFactor)
                .font(Font.system(size: tableHeaderFontSize * scalingFactor).bold())
                .foregroundColor(globalSettings.isDark ? DarkLetterColorScheme : LetterColorScheme)
            Spacer()
            
            Text(LocalizedStrings.highScore)
                .frame(width: collumnWidthSize * scalingFactor)
                .font(Font.system(size: tableHeaderFontSize * scalingFactor).bold())
                .foregroundColor(globalSettings.isDark ? DarkLetterColorScheme : LetterColorScheme)
            Spacer()
            
            Text(LocalizedStrings.medal)
                .frame(width: collumnWidthSize * scalingFactor)
                .font(Font.system(size: tableHeaderFontSize * scalingFactor).bold())
                .foregroundColor(globalSettings.isDark ? DarkLetterColorScheme : LetterColorScheme)
        }
    }
    
    /// Updates the achievement for a player based on their score.
    func updateAchievement(for player: inout Player) {
        let achieved = achievements.filter { $0.milestone <= player.score }
        if let highestAchievement = achieved.sorted(by: { $0.milestone > $1.milestone }).first {
            player.achievementNames = highestAchievement.name
        } else {
            player.achievementNames = "No Achievement"
        }
    }
    
    /// Returns a list of players with the highest scores.
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
    
    /// Displays the achievement for a player.
    private func displayAchievement(for player: Player, tableContentFontSize: CGFloat, scalingFactor: CGFloat) -> some View {
        HStack{
            NavigationLink(destination: AchievementListView(player: player)) {
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
                Image(systemName: "arrowtriangle.forward.fill") // System icon
                    .foregroundColor(globalSettings.isDark ? DarkLetterColorScheme : LetterColorScheme)
            }
        }
    }

}

// MARK: - Previews
struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()
            .environmentObject(GlobalSettings.shared)
    }
}

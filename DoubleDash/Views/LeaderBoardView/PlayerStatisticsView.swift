//
//  PlayerStatistics.swift
//  DoubleDash
//
//  Created by Minh Vo on 02/09/2023.
//

import SwiftUI
import SwiftUICharts

/// Represents the view where the user can see statistics for each player.
struct PlayerStatisticsView: View {
    
    // MARK: - Property Declarations
    //  an instance of the `GlobalSettings` class.
    @EnvironmentObject var globalSettings: GlobalSettings
    //  Provide how the View should be presented for the custom back button
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    // State property to manage player data.
    @State private var players: [Player] = []
    // iphone 14 width size fetched from the shared `GlobalStates` object
    let iphone14BaseWidth = GlobalStates.shared.iphone14BaseWidth
    
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
                
                ScrollView{
                    // Display player statistics UI components.
                    Text(LocalizedStrings.playerStatistic)
                        .font(Font.system(size: 44 * scalingFactor).weight(.black))
                        .foregroundColor(globalSettings.isDark ? DarkTitleColorScheme : TitleColorScheme)
                        .padding()
                    ForEach(players.map { $0.username }.removingDuplicates(), id: \.self) { playerName in
                        VStack{
                            ZStack{
                                Rectangle()
                                    .frame(width: 350 * scalingFactor, height: 400)
                                    .cornerRadius(12 * scalingFactor)
                                    .foregroundColor(globalSettings.isDark ? Color.gray : Color.white)
                                // Player's last 6 match scores
                                LineView(data: getLastSixScores(for: playerName).map { Double($0) }, title: playerName, legend: LocalizedStrings.lastSixMatchs)
                                        .frame(width: 280 * scalingFactor)
                            }
                            ZStack{
                                //  Player's average score
                                Rectangle()
                                    .frame(width: 350 * scalingFactor, height: 70 * scalingFactor)
                                    .cornerRadius(12 * scalingFactor)
                                    .foregroundColor(globalSettings.isDark ? Color.gray: Color.white)
                                Text(LocalizedStrings.averageScore + ": \(String(format: "%.1f", getAverageScore(for: playerName)))")
                                    .font(Font.system(size: 24 * scalingFactor).weight(.black))
                                    .foregroundColor(globalSettings.isDark ? DarkTitleColorScheme : TitleColorScheme)
                                
                            }
                        }
                        .padding(.vertical,16 * scalingFactor)
                    }
                    
                }
                
                .frame(width: geometry.size.width, alignment: .center)
                .onAppear {
                    // Load existing players when the view appears.
                    players = load() ?? []
                   
                            startBackgroundMusic()
            
                }
            }
        }
        // Add a custom back button to the view.
        .customBackButton(presentationMode: presentationMode)
        .preferredColorScheme(globalSettings.isDark ? .dark : .light)
    }
    
    // MARK: - Function
    /// Returns the last six scores for a given player.
    func getLastSixScores(for playerName: String) -> [Int] {
        let playerScores = players.filter { $0.username == playerName }.suffix(6).map { $0.score }
        return playerScores
    }
    
    /// Calculates the average score for a given player.
    func getAverageScore(for playerName: String) -> Double {
        let playerScores = players.filter { $0.username == playerName }.map { $0.score }
        let totalScore = playerScores.reduce(0, +)
        return Double(totalScore) / Double(playerScores.count)
    }
}

// MARK: - Extension
// Extension to remove duplicates from an array.
extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        
        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
}

// MARK: - Previews
struct PlayerStatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerStatisticsView()
            .environmentObject(GlobalSettings.shared)
    }
}


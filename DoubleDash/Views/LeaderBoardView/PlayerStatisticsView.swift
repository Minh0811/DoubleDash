//
//  PlayerStatistics.swift
//  DoubleDash
//
//  Created by Minh Vo on 02/09/2023.
//

import SwiftUI
import SwiftUICharts

struct PlayerStatisticsView: View {
    @State private var players: [Player] = []
    @EnvironmentObject var globalSettings: GlobalSettings
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    let iphone14BaseWidth = GlobalStates.shared.iphone14BaseWidth
    var body: some View {
        ZStack{
            //Background
            globalSettings.isDark ? DarkBackgroundColorScheme.ignoresSafeArea() : BackgroundColorScheme.ignoresSafeArea()
            
            GeometryReader { geometry in
                
                var scalingFactor: CGFloat {
                    return geometry.size.width / iphone14BaseWidth
                }
                
                ScrollView{
                    Text("Player Statistic")
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
                                
//                                Rectangle()
//                                    .frame(width: 320 * scalingFactor, height: 270 )
//                                    .cornerRadius(12 * scalingFactor)
//                                    .foregroundColor(globalSettings.isDark ? Color.black : Color.black)
                                  
                         
                                    LineView(data: getLastSixScores(for: playerName).map { Double($0) }, title: playerName, legend: "Last 6 Matches")
                                        .frame(width: 280 * scalingFactor)
                           
                                //.padding()
                                
                                
                            }
                            ZStack{
                                Rectangle()
                                    .frame(width: 350 * scalingFactor, height: 70 * scalingFactor)
                                    .cornerRadius(12 * scalingFactor)
                                    .foregroundColor(globalSettings.isDark ? Color.gray: Color.white)
                                Text("Average Score: \(String(format: "%.1f", getAverageScore(for: playerName)))")
                                    .font(Font.system(size: 24 * scalingFactor).weight(.black))
                                    .foregroundColor(globalSettings.isDark ? DarkTitleColorScheme : TitleColorScheme)
                                
                            }
                        }
                        .padding(.vertical,16 * scalingFactor)
                    }
                    
                }
                
                .frame(width: geometry.size.width, alignment: .center)
                .onAppear {
                    players = load() ?? []
                }
            }
        }
        .customBackButton(presentationMode: presentationMode)
        .preferredColorScheme(globalSettings.isDark ? .dark : .light)
    }
    
    
    func getLastSixScores(for playerName: String) -> [Int] {
        let playerScores = players.filter { $0.username == playerName }.suffix(6).map { $0.score }
        return playerScores
    }
    
    func getAverageScore(for playerName: String) -> Double {
        let playerScores = players.filter { $0.username == playerName }.map { $0.score }
        let totalScore = playerScores.reduce(0, +)
        return Double(totalScore) / Double(playerScores.count)
    }
}

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        
        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
}


struct PlayerStatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerStatisticsView()
            .environmentObject(GlobalSettings.shared)
    }
}


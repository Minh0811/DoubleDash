//
//  PlayerStatistics.swift
//  DoubleDash
//
//  Created by Minh Vo on 02/09/2023.
//

import SwiftUI
import SwiftUICharts

struct PlayerStatistics: View {
    @State private var players: [Player] = []
    let iphone14BaseWidth = GlobalState.shared.iphone14BaseWidth
    var body: some View {
        ZStack{
            //Background
            DarkBackgroundColorScheme.ignoresSafeArea()
            ScrollView{
                ZStack{
                    Rectangle()
                        .frame(width: 350, height: 400)
                        .cornerRadius(12)
                        .foregroundColor(Color.white)
                    LineView(data: [12,12,4,2,51,42,23], title: "LineChart", legend: "Full screen")
                        .frame(width: 300)
                        .padding()
                }
            }
            .onAppear {
                players = load() ?? []
            }
        }
    }
}

struct PlayerStatistics_Previews: PreviewProvider {
    static var previews: some View {
        PlayerStatistics()
    }
}


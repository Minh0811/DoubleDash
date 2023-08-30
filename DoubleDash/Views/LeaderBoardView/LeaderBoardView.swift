//
//  LeaderBoardView.swift
//  DoubleDash
//
//  Created by Minh Vo on 30/08/2023.
//

import SwiftUI

struct LeaderBoardView: View {
    @State private var players: [Player] = []
    
    var body: some View {
        List(players, id: \.username) { player in
            HStack{
                Text(player.username)
                Spacer()
                Text("\(player.score)")
                    .font(.subheadline)
            }
        }
        .onAppear {
            players = load() ?? []
        }
    }
}


struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()
    }
}

//
//  Achievement.swift
//  DoubleDash
//
//  Created by Minh Vo on 01/09/2023.
//

import SwiftUI

struct Achievement: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var imageName: String
    var milestone: Int
}
    

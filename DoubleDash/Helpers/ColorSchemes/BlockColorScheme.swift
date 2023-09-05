//
//  BlockColorScheme.swift
//  my-2048
//
//  Created by Minh Vo on 22/08/2023.
//

//  BlockColorScheme.swift defines the color scheme for different block values up to more than 2 million
// Each Tuple represent the background color and the number color for each block

import SwiftUI

public let BlockColorScheme: [(Color, Color)] = [
    // 2
    (Color(red:0.91, green:0.87, blue:0.83, opacity:1.00), Color(red:0.42, green:0.39, blue:0.35, opacity:1.00)),
    // 4
    (Color(red:0.90, green:0.86, blue:0.76, opacity:1.00), Color(red:0.42, green:0.39, blue:0.35, opacity:1.00)),
    // 8
    (Color(red:0.93, green:0.67, blue:0.46, opacity:1.00), Color.white),
    // 16
    (Color(red:0.94, green:0.57, blue:0.38, opacity:1.00), Color.white),
    // 32
    (Color(red:0.95, green:0.46, blue:0.33, opacity:1.00), Color.white),
    // 64
    (Color(red:0.94, green:0.35, blue:0.23, opacity:1.00), Color.white),
    // 128
    (Color(red:0.91, green:0.78, blue:0.43, opacity:1.00), Color.white),
    // 256
    (Color(red:0.91, green:0.78, blue:0.37, opacity:1.00), Color.white),
    // 512
    (Color(red:0.90, green:0.77, blue:0.31, opacity:1.00), Color.white),
    // 1024
    (Color(red:0.91, green:0.75, blue:0.24, opacity:1.00), Color.white),
    // 2048
    (Color(red:0.91, green:0.74, blue:0.18, opacity:1.00), Color.white),
    //4096
    (Color(red:0.47, green:0.51, blue:0.55, opacity:1.00), Color.white),
    //8192
    (Color(red:0.25, green:0.87, blue:0.81, opacity:1.00), Color.white),
    //16384
    (Color(red:0.58, green:0.29, blue:0, opacity:1.00), Color.white),
    //32768
    (Color(red:1, green:0, blue:1, opacity:1.00), Color.white),
    //65536
    (Color(red:0, green:1, blue:1, opacity:1.00), Color.black),
    //131072
    (Color(red:0, green:0.51, blue:0, opacity:1.00), Color.white),
    //262144
    (Color(red:1, green:0.64, blue:0, opacity:1.00), Color.white),
    //524288
    (Color(red:0.6, green:0.79, blue:0.05, opacity:1.00), Color.white),
    //1048576
    (Color(red:0.15, green:0.15, blue:0.36, opacity:1.00), Color.white),
    //2097152
    (Color(red:1, green:0.75, blue:0.79, opacity:1.00), Color.white),
]

//  the default color a block that have no pre-define values
public let DefaultBlockColorScheme: (Color, Color) =
(Color(red:0.78, green:0.73, blue:0.68, opacity:1.00), Color.black)

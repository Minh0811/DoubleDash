/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Minh Vo
  ID: S3879953
  Created  date: 22/08/2023 (e.g. 31/07/2023)
  Last modified: 6/09/2023 (e.g. 05/08/2023)
  Acknowledgement:
*/
// Purpose of ThemeColorScheme.swift:
// This file defines the color themes for the "DoubleDash" game using SwiftUI.
// The ThemeColorScheme provides a centralized location for defining and managing the color schemes used throughout the application.
// The main functionalities and features include:
// 1. Background Colors: Defines the background colors for both dark and light modes.
// 2. Title Colors: Specifies the colors for titles in both dark and light themes.
// 3. Button Colors: Sets the colors for buttons in both the dark and light modes.
// 4. Button's Content Colors: Determines the colors for the content (text/icons) inside buttons for both themes.
// 5. Normal Content Colors: Defines the standard text colors for content in both dark and light modes.
// By centralizing the color definitions in this file, it ensures consistency across the application and makes it easier to make theme-related changes in the future.

import SwiftUI

//  Background color for both darkmode and lightmode.
public let BackgroundColorScheme: (Color) =
(Color(red:0.96, green:0.94, blue:0.90, opacity:1.00))
public let DarkBackgroundColorScheme: (Color) =
(Color(red:0.33, green:0.33, blue:0.33, opacity:1.00))

//  Title color for both darkmode and lightmode.
public let TitleColorScheme: (Color) =
(Color(red:0.47, green:0.43, blue:0.40, opacity:1.00))
public let DarkTitleColorScheme: (Color) =
(Color(red:0.96, green:0.94, blue:0.90, opacity:1.00))

//  Button color for both darkmode and lightmode.
public let ButtonColorScheme: (Color) =
(Color(red:0.96, green:0.94, blue:0.90, opacity:1.00))
public let DarkButtonColorScheme: (Color) =
(Color(red:0.33, green:0.33, blue:0.33, opacity:1.00))

//  Button's content color for both darkmode and lightmode.
public let ButtonLetterColorScheme: (Color) =
(Color(red:0.96, green:0.94, blue:0.90, opacity:1.00))
public let DarkButtonLetterColorScheme: (Color) =
(Color(red:0.47, green:0.43, blue:0.40, opacity:1.00))

//  Normal content color for both darkmode and lightmode.
public let LetterColorScheme: (Color) = (Color.black)
public let DarkLetterColorScheme: (Color) = (Color.white)

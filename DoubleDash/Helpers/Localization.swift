//
//  Localization.swift
//  DoubleDash
//
//  Created by Minh Vo on 04/09/2023.
//

import SwiftUI

struct LocalizedStrings {
    
    
    // MARK: - MenuView
    /// Localized string for the welcome message.
    static var welcome: String {
        return GlobalSettings.shared.isEnglish ? "Welcome" : "Chào Mừng"
    }
    
    /// Localized string for the play game option.
    static var playGame: String {
        return GlobalSettings.shared.isEnglish ? "Play Game" : "Chơi Game"
    }
    
    /// Localized string for the leaderboard option.
    static var leaderBoard: String {
        return GlobalSettings.shared.isEnglish ? "Leaderboard" : "Bảng Xếp Hạng"
    }
    
    /// Localized string for the how to play option.
    static var howToPlay: String {
        return GlobalSettings.shared.isEnglish ? "How To Play" : "Cách Chơi"
    }
    
    /// Localized string for the game settings option.
    static var gameSetting: String {
        return GlobalSettings.shared.isEnglish ? "Game Setting" : "Cài Đặt Game"
    }
    
    // MARK: - DifficultySelectionView
    /// Localized string for selecting game difficulty.
    static var selectDifficulty: String {
        return GlobalSettings.shared.isEnglish ? "Select Difficulty" : "Chọn Độ Khó"
    }
    
    /// Localized string for the easy difficulty level.
    static var easy: String {
        return GlobalSettings.shared.isEnglish ? "Easy (6x6)" : "Dễ (6x6)"
    }
    
    /// Localized string for the medium difficulty level.
    static var medium: String {
        return GlobalSettings.shared.isEnglish ? "Medium (5x5)" : "Trung Bình (5x5)"
    }
    
    /// Localized string for the hard difficulty level.
    static var hard: String {
        return GlobalSettings.shared.isEnglish ? "Hard (4x4)" : "Khó (4x4)"
    }
    
    /// Localized string for selecting game mode.
    static var selectMode: String {
        return GlobalSettings.shared.isEnglish ? "Select Mode" : "Chọn Màu"
    }
    
    /// Localized string for the light mode option.
    static var lightMode: String {
        return GlobalSettings.shared.isEnglish ? "Light Mode" : "Chế Độ Sáng"
    }
    
    /// Localized string for the dark mode option.
    static var darkMode: String {
        return GlobalSettings.shared.isEnglish ? "Dark Mode" : "Chế Độ Tối"
    }
    
    /// Localized string for selecting language.
    static var selectLanguage: String {
        return GlobalSettings.shared.isEnglish ? "Select Language" : "Chọn Ngôn Ngữ"
    }
    
    /// Localized string for the English language option.
    static var english: String {
        return GlobalSettings.shared.isEnglish ? "English" : "Tiếng Anh"
    }
    
    /// Localized string for the Vietnamese language option.
    static var vietnamese: String {
        return GlobalSettings.shared.isEnglish ? "Vietnamese" : "Tiếng Việt"
    }
    
    // MARK: - LeaderBoardView
    /// Localized string for the name label.
    static var name: String {
        return GlobalSettings.shared.isEnglish ? "Name" : "Tên"
    }
    
    /// Localized string for the high score label.
    static var highScore: String {
        return GlobalSettings.shared.isEnglish ? "High Score" : "Điểm Số"
    }
    
    /// Localized string for the medal label.
    static var medal: String {
        return GlobalSettings.shared.isEnglish ? "Medal" : "Huy Chương"
    }
    
    /// Localized string for the player statistics label.
    static var playerStatistic: String {
        return GlobalSettings.shared.isEnglish ? "Player Statistic" : "Thống Kê"
    }
    
    // MARK: - RegistrationView
    /// Localized string for the register your name label.
    static var registerYourName: String {
        return GlobalSettings.shared.isEnglish ? "Register Your Name" : "Đăng Kí Tên"
    }
    
    /// Localized string for the enter your username placeholder.
    static var enterYourUserName: String {
        return GlobalSettings.shared.isEnglish ? "Enter your username" : "Nhập Tên"
    }
    
    /// Localized string for the start game button.
    static var startGame: String {
        return GlobalSettings.shared.isEnglish ? "Start Game" : "Bắt Đầu"
    }
    
    // MARK: - PlayerStatisticsView
    /// Localized string for the statistic label.
    static var lastSixMatchs: String {
        return GlobalSettings.shared.isEnglish ? "Last 6 Matches" : "6 Trận Vừa Rồi"
    }
    
    /// Localized string for the average score label.
    static var averageScore: String {
        return GlobalSettings.shared.isEnglish ? "Average Score" : "Điểm Trung Bình"
    }
    
    // MARK: - GameView
    /// Localized string for the game score.
    static var score: String {
        return GlobalSettings.shared.isEnglish ? "Score:" : "Điểm Số"
    }
    
    /// Localized string for the game level.
    static var level: String {
        return GlobalSettings.shared.isEnglish ? "Level:" : "Độ Khó"
    }
    
    // MARK: - AchievementListView
    /// Localized string for the list of achievements
    static var listOfAchievements: String {
        return GlobalSettings.shared.isEnglish ? "List of Achievements:" : "Danh Sách Huy Chương"
    }
    
    // MARK: - Alerts - Registration View
    static var alertTitleRegistrationView: String {
        return GlobalSettings.shared.isEnglish ? "Username Already Exists:" : "Tên Đã Tồn Tại"
    }
    static var alertContentRegistrationView: String {
        return GlobalSettings.shared.isEnglish ? "Do you want to continue with this name or change to a different name?" : "Bạn có muốn tiếp tục với tên này hay đổi tên khác"
    }
    static var alertDefaultButtonRegistrationView: String {
        return GlobalSettings.shared.isEnglish ? "Continue" : "Tiếp Tục"
    }
    static var alertCancelButtonContentRegistrationView: String {
        return GlobalSettings.shared.isEnglish ? "Change Name" : "Đổi Tên"
    }
}


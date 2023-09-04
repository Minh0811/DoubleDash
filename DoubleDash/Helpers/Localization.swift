//
//  Localization.swift
//  DoubleDash
//
//  Created by Minh Vo on 04/09/2023.
//

import SwiftUI

struct LocalizedStrings {
    
    
    // MARK: - MenuView
    static var welcome: String {
        return GlobalSettings.shared.isEnglish ? "Welcome" : "Chào Mừng"
    }
    static var playGame: String {
        return GlobalSettings.shared.isEnglish ? "Play Game" : "Chơi Game"
    }
    static var leaderBoard: String {
        return GlobalSettings.shared.isEnglish ? "Leaderboard" : "Bảng Xếp Hạng"
    }
    static var howToPlay: String {
        return GlobalSettings.shared.isEnglish ? "How To Play" : "Cách Chơi"
    }
    static var gameSetting: String {
        return GlobalSettings.shared.isEnglish ? "Game Setting" : "Cài Đặt Game"
    }
    
    // MARK: - DifficultySelectionView
    static var selectDifficulty: String {
        return GlobalSettings.shared.isEnglish ? "Select Difficulty" : "Chọn Độ Khó"
    }
    static var easy: String {
        return GlobalSettings.shared.isEnglish ? "Easy (6x6)" : "Dễ (6x6)"
    }
    static var medium: String {
        return GlobalSettings.shared.isEnglish ? "Medium (5x5)" : "Trung Bình (5x5)"
    }
    static var hard: String {
        return GlobalSettings.shared.isEnglish ? "Hard (4x4)" : "Khó (4x4)"
    }
    static var selectMode: String {
        return GlobalSettings.shared.isEnglish ? "Select Mode" : "Chọn Màu"
    }
    static var lightMode: String {
        return GlobalSettings.shared.isEnglish ? "Light Mode" : "Chế Độ Sáng"
    }
    static var darkMode: String {
        return GlobalSettings.shared.isEnglish ? "Dark Mode" : "Chế Độ Tối"
    }
    static var selectLanguage: String {
        return GlobalSettings.shared.isEnglish ? "Select Language" : "Chọn Ngôn Ngữ"
    }
    static var english: String {
        return GlobalSettings.shared.isEnglish ? "English" : "Tiếng Anh"
    }
    static var vietnamese: String {
        return GlobalSettings.shared.isEnglish ? "Vietnamese" : "Tiếng Việt"
    }
    
    // MARK: - LeaderBoardView
    static var name: String {
        return GlobalSettings.shared.isEnglish ? "Name" : "Tên"
    }
    static var highScore: String {
        return GlobalSettings.shared.isEnglish ? "High Score" : "Điểm Số"
    }
    static var medal: String {
        return GlobalSettings.shared.isEnglish ? "Medal" : "Huy Chương"
    }
    static var playerStatistic: String {
        return GlobalSettings.shared.isEnglish ? "Player Statistic" : "Thống Kê"
    }
    
    // MARK: - RegistrationView
    static var registerYourName: String {
        return GlobalSettings.shared.isEnglish ? "Register Your Name" : "Đăng Kí Tên"
    }
    static var enterYourUserName: String {
        return GlobalSettings.shared.isEnglish ? "Enter your username" : "Nhập Tên"
    }
    static var startGame: String {
        return GlobalSettings.shared.isEnglish ? "Start Game" : "Bắt Đầu"
    }
    
    // MARK: - PlayerStatisticsView
    
    static var lastSixMatchs: String {
        return GlobalSettings.shared.isEnglish ? "Last 6 Matches" : "6 Trận Vừa Rồi"
    }
    static var averageScore: String {
        return GlobalSettings.shared.isEnglish ? "Average Score" : "Điểm Trung Bình"
    }
    
    // MARK: - GameView
    static var score: String {
        return GlobalSettings.shared.isEnglish ? "Score:" : "Điểm Số"
    }
    static var level: String {
        return GlobalSettings.shared.isEnglish ? "Level:" : "Độ Khó"
    }
}


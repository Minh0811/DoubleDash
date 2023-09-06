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
    
    // MARK: - HowToPlayView
    
    static var objective: String {
        return GlobalSettings.shared.isEnglish ? "1. Objective:" : "1. Mục tiêu:"
    }
    static var objectiveContent1: String {
        return GlobalSettings.shared.isEnglish ? "The main goal of DoubleDash is to combine tiles of the same number to create a tile with a higher value. Try to achieve the highest score possible before the board fills up and no more moves are available." : "Mục tiêu chính của DoubleDash là kết hợp các ô có cùng số để tạo ra ô có giá trị cao hơn. Cố gắng đạt được số điểm cao nhất có thể trước khi bảng đầy và không còn nước đi nào nữa."
    }
    static var theGame: String {
        return GlobalSettings.shared.isEnglish ? "2.The Game:" : "2.Trò chơi:n"
    }
    static var theGameContent1: String {
        return GlobalSettings.shared.isEnglish ? "When you start a new game, you'll be presented with a grid (or board). Initially, there will be two tiles with numbers on the board." : "Khi bạn bắt đầu một trò chơi mới, bạn sẽ thấy một lưới (hoặc bảng). Ban đầu, sẽ có hai ô có số trên bảng."
    }
    static var movingTiles: String {
        return GlobalSettings.shared.isEnglish ? "3. Moving Tiles:" : "3. Di chuyển gạch:"
    }
    static var movingTilesContent1: String {
        return GlobalSettings.shared.isEnglish ? "Swipe in any of the four directions: up, down, left, or right." : "Vuốt theo bất kỳ hướng nào trong bốn hướng: lên, xuống, trái hoặc phải."
    }
    static var movingTilesContent2: String {
        return GlobalSettings.shared.isEnglish ? "All tiles on the board will move in the direction of your swipe." : "Tất cả các ô trên bảng sẽ di chuyển theo hướng vuốt của bạn."
    }
    static var movingTilesContent3: String {
        return GlobalSettings.shared.isEnglish ? "If two tiles with the same number collide during this movement, they will merge into a single tile. The number on the merged tile will be the sum of the two original tiles." : "Nếu hai ô có cùng số va chạm trong quá trình di chuyển này, chúng sẽ hợp nhất thành một ô duy nhất. Số trên ô được hợp nhất sẽ là tổng của hai ô ban đầu."
    }
    static var gameProgression: String {
        return GlobalSettings.shared.isEnglish ? "4. Game Progression:" : "4. Tiến trình trò chơi:"
    }
    static var gameProgressionContent1: String {
        return GlobalSettings.shared.isEnglish ? "After every swipe, a new tile will appear on the board in a random empty spot." : "Sau mỗi lần vuốt, một ô mới sẽ xuất hiện trên bảng ở một vị trí trống ngẫu nhiên."
    }
    static var gameProgressionContent2: String {
        return GlobalSettings.shared.isEnglish ? "Continue swiping and merging tiles to increase your score." : "Tiếp tục vuốt và hợp nhất các ô để tăng điểm của bạn."
    }
    static var gameProgressionContent3: String {
        return GlobalSettings.shared.isEnglish ? "The game becomes more challenging as the board fills up, so plan your moves carefully!" : "Trò chơi trở nên khó khăn hơn khi bàn cờ đầy lên, vì vậy hãy lên kế hoạch di chuyển cẩn thận!"
    }
    static var endOfGame: String {
        return GlobalSettings.shared.isEnglish ? "5. End of Game:" : "5. Kết thúc game:"
    }
    static var endOfGameContent1: String {
        return GlobalSettings.shared.isEnglish ? "The game concludes when there are no empty spots left on the board and no adjacent tiles have the same number (meaning no merges are possible)." : "Trò chơi kết thúc khi không còn ô trống nào trên bảng và không có ô liền kề nào có cùng số (có nghĩa là không thể hợp nhất)."
    }
    static var scoring: String {
        return GlobalSettings.shared.isEnglish ? "6. Scoring:" : "6. Tính điểm:"
    }
    static var scoringContent1: String {
        return GlobalSettings.shared.isEnglish ? "Your score is the sum of all merged tile values. Aim to merge higher value tiles to boost your score!" : "Điểm của bạn là tổng của tất cả các giá trị ô được hợp nhất. Nhằm mục đích hợp nhất các ô có giá trị cao hơn để tăng điểm số của bạn!"
    }

    static var LeaderboardConten1: String {
        return GlobalSettings.shared.isEnglish ? "After each game, your score is saved under your username." : "Sau mỗi trận đấu, điểm của bạn sẽ được lưu dưới tên người dùng của bạn."
    }
    static var LeaderboardConten2: String {
        return GlobalSettings.shared.isEnglish ? "The leaderboard will display the highest score associated with each username." : "Bảng xếp hạng sẽ hiển thị số điểm cao nhất liên quan đến mỗi tên người dùng."
    }
    static var LeaderboardConten3: String {
        return GlobalSettings.shared.isEnglish ? "You can also view your game history and average score in the Player Statistics section." : "Bạn cũng có thể xem lịch sử trò chơi và điểm trung bình của mình trong phần Thống kê người chơi."
    }
    static var achievements: String {
        return GlobalSettings.shared.isEnglish ? "8. Achievements:" : "8. Thành tích:"
    }
    static var achievementsContent1: String {
        return GlobalSettings.shared.isEnglish ? "After every swipe, a new tile will appear on the board in a random empty spot." : "Sau mỗi lần vuốt, một ô mới sẽ xuất hiện trên bảng ở một vị trí trống ngẫu nhiên."
    }
    static var achievementsContent2: String {
        return GlobalSettings.shared.isEnglish ? "Continue swiping and merging tiles to increase your score." : "Tiếp tục vuốt và hợp nhất các ô để tăng điểm của bạn."
    }
    static var achievementsContent3: String {
        return GlobalSettings.shared.isEnglish ? "As you play, you can unlock various achievements based on your performance. Check the Achievements section to see the milestones you can aim for and the ones you've already achieved." : "Khi chơi, bạn có thể mở khóa nhiều thành tích khác nhau dựa trên thành tích của mình. Kiểm tra phần Thành tích để xem các cột mốc bạn có thể hướng tới và những cột mốc bạn đã đạt được."
    }
}


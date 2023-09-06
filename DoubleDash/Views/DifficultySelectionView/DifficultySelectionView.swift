//
//  DifficultySelectionView.swift
//  my-2048
//
//  Created by Minh Vo on 24/08/2023.
//


import SwiftUI

struct DifficultySelectionView: View {
    
    // MARK: - Property Declarations
    
    //  An instance of the `GameLogic` class.
    @EnvironmentObject var gameLogic: GameLogic
    //  An instance of the `GlobalSettings` class.
    @EnvironmentObject var globalSettings: GlobalSettings
    //  Provide how the View should be presented for the custom back button
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    // iphone 14 width size fetched from the shared `GlobalStates` object
    let iphone14BaseWidth = GlobalStates.shared.iphone14BaseWidth
    
    // Property for storing user selection
    @State private var selectedDifficulty: Int = 0
    @State private var selectedMode: Int = 0
    @State private var selectedLanguage: Int = 0

    // Initializer to customize the appearance of UISegmentedControl.
    init() {
        // Change the text color for a non-selected option in the Segment Control
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
        // Change the text color for a selected option in the Segment Control
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        // Change the background color in the Segment Control
        UISegmentedControl.appearance().backgroundColor = UIColor.white
    }
    
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
                    VStack{
                        // Display the difficulty, mode, and language selection buttons.
                        difficultyButtons(scalingFactor: scalingFactor).padding()
                        darkModeButtons(scalingFactor: scalingFactor).padding()
                        LanguageButtons(scalingFactor: scalingFactor).padding()
                    }
                }
            }
        }
        // Add a custom back button to the view.
        .customBackButton(presentationMode: presentationMode)
        .onAppear {
            // Initialize the selection states based on the current game and global settings.
               switch gameLogic.currentLevel {
               case 3:
                   selectedDifficulty = 0
               case 2:
                   selectedDifficulty = 1
               case 1:
                   selectedDifficulty = 2
               default:
                   break
               }
            selectedMode = globalSettings.isDark ? 1 : 0
            selectedLanguage = globalSettings.isEnglish ? 0 : 1
           }
    }
}

// MARK: - Extension
extension DifficultySelectionView {
    
    // Returns a VStack containing difficulty selection controls.
    func difficultyButtons(scalingFactor: CGFloat) -> some View {
        VStack(spacing: 20) {
            Text(LocalizedStrings.selectDifficulty)
                .font(Font.system(size: 35 * scalingFactor).weight(.black))
                .foregroundColor(globalSettings.isDark ? DarkTitleColorScheme : TitleColorScheme)
            selectedDifficultyImage(scalingFactor: scalingFactor)
                        .frame(width: 300 * scalingFactor, height: 300 * scalingFactor)
                        .padding(.top, 20 * scalingFactor)
            
            Picker(selection: $selectedDifficulty, label: Text("Difficulty")) {

                    Text(LocalizedStrings.easy).tag(0)
                    Text(LocalizedStrings.medium).tag(1)
                    Text(LocalizedStrings.hard).tag(2)

            }
            .pickerStyle(SegmentedPickerStyle())
            // in the moment of when the selectedDifficult is changed, set the game difficulty base on the changes
            .onChange(of: selectedDifficulty) { newValue in
                switch newValue {
                case 0:
                    gameLogic.setLevelValue(level: 3)
                case 1:
                    gameLogic.setLevelValue(level: 2)
                case 2:
                    gameLogic.setLevelValue(level: 1)
                default:
                    break
                }
                gameLogic.newGame()
            }
            
        }
    }
    
    // Returns an image view based on the selected difficulty.
    func selectedDifficultyImage(scalingFactor: CGFloat) -> some View {
        switch selectedDifficulty {
        case 0:
            return AnyView(Image("easy").resizable().scaledToFit())
        case 1:
            return AnyView(Image("mid").resizable().scaledToFit())
        case 2:
            return AnyView(Image("hard").resizable().scaledToFit())
        default:
            return AnyView(EmptyView())
        }
    }
    
    // Returns a VStack containing dark mode selection controls.
    func darkModeButtons(scalingFactor: CGFloat) -> some View {
        VStack(spacing: 20) {
            Text(LocalizedStrings.selectMode)
                .font(Font.system(size: 35 * scalingFactor).weight(.black))
                .foregroundColor(globalSettings.isDark ? DarkTitleColorScheme : TitleColorScheme)
            
            Picker(selection: $selectedMode, label: Text("Difficulty")) {
                Text(LocalizedStrings.lightMode).tag(0)
                
                Text(LocalizedStrings.darkMode).tag(1)
            }
            
            .pickerStyle(SegmentedPickerStyle())
            .onChange(of: selectedMode) { newValue in
                switch newValue {
                case 1:
                    globalSettings.isDark = true
                case 0:
                    globalSettings.isDark = false
                default:
                    break
                }
            }
            
        }
    }
    
    // Returns a VStack containing language selection controls.
    func LanguageButtons(scalingFactor: CGFloat) -> some View {
        VStack(spacing: 20) {
            Text(LocalizedStrings.selectLanguage)
                .font(Font.system(size: 35 * scalingFactor).weight(.black))
                .foregroundColor(globalSettings.isDark ? DarkTitleColorScheme : TitleColorScheme)
            
            Picker(selection: $selectedLanguage, label: Text("Difficulty")) {
                Text(LocalizedStrings.english).tag(0)
                
                Text(LocalizedStrings.vietnamese).tag(1)
            }
            
            .pickerStyle(SegmentedPickerStyle())
            .onChange(of: selectedLanguage) { newValue in
                switch newValue {
                case 0:
                    globalSettings.isEnglish = true
                case 1:
                    globalSettings.isEnglish = false
                default:
                    break
                }
            }
            
        }
    }
}

// MARK: - Previews
struct DifficultySelectionView_Previews: PreviewProvider {
    static var previews: some View {
           DifficultySelectionView() // Provide an empty closure for the preview
               .environmentObject(GameLogic())
               .environmentObject(GlobalSettings.shared)
        
       }
}
    

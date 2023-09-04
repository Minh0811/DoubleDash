//
//  DifficultySelectionView.swift
//  my-2048
//
//  Created by Minh Vo on 24/08/2023.
//


import SwiftUI

struct DifficultySelectionView: View {
    @EnvironmentObject var gameLogic: GameLogic
    @EnvironmentObject var globalSettings: GlobalSettings
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State private var refreshView: Bool = false
    
    let iphone14BaseWidth = GlobalStates.shared.iphone14BaseWidth
    @State private var selectedDifficulty: Int = 0
    @State private var selectedMode: Int = 0



    
    
    init() {
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal) // Change UIColor.red to your desired color
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        
        UISegmentedControl.appearance().backgroundColor = UIColor.white // Change to your desired background color
        //UISegmentedControl.appearance().tintColor = UIColor.blue
    }
    
  

    // MARK: - Body
    var body: some View {
        ZStack{
            //Background
            globalSettings.isDark ? DarkBackgroundColorScheme.ignoresSafeArea() : BackgroundColorScheme.ignoresSafeArea()
            GeometryReader { geometry in
                var scalingFactor: CGFloat {
                    return geometry.size.width / iphone14BaseWidth
                }
                VStack{
                    //Content
                    difficultyButtons(scalingFactor: scalingFactor)
                        .padding()
                    darkModeButtons(scalingFactor: scalingFactor)
                        .padding()
                    LanguageButtons(scalingFactor: scalingFactor)
                        .padding()
                }
            }
        }
        .customBackButton(presentationMode: presentationMode)
        .onAppear {
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
           }
       // .preferredColorScheme(isDark ? .dark : .light)
        
    }
}

extension DifficultySelectionView {
    
    func difficultyButtons(scalingFactor: CGFloat) -> some View {
        VStack(spacing: 20) {
            Text("Select Difficulty")
                .font(Font.system(size: 35 * scalingFactor).weight(.black))
                .foregroundColor(globalSettings.isDark ? DarkTitleColorScheme : TitleColorScheme)
            
//            Text("Current Level: \(gameLogic.currentLevel)")
//                .font(.title2)
//                .padding()
            
            selectedDifficultyImage(scalingFactor: scalingFactor)
                        .frame(width: 300 * scalingFactor, height: 300 * scalingFactor)
                        .padding(.top, 20 * scalingFactor)
            
            Picker(selection: $selectedDifficulty, label: Text("Difficulty")) {
                Text("Easy (6x6)").tag(0)
                Text("Medium (5x5)").tag(1)
                Text("Hard (4x4)").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
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
    func darkModeButtons(scalingFactor: CGFloat) -> some View {
        VStack(spacing: 20) {
            Text("Select Mode")
                .font(Font.system(size: 35 * scalingFactor).weight(.black))
                .foregroundColor(globalSettings.isDark ? DarkTitleColorScheme : TitleColorScheme)
            
            Picker(selection: $selectedMode, label: Text("Difficulty")) {
                Text("Light Mode").tag(0)
                
                Text("Dark Mode").tag(1)
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
    
    func LanguageButtons(scalingFactor: CGFloat) -> some View {
        VStack(spacing: 20) {
            Text("Select Language")
                .font(Font.system(size: 35 * scalingFactor).weight(.black))
                .foregroundColor(globalSettings.isDark ? DarkTitleColorScheme : TitleColorScheme)
            
            Picker(selection: $selectedMode, label: Text("Difficulty")) {
                Text("English").tag(0)
                
                Text("Tiếng Việt").tag(1)
            }
            
            .pickerStyle(SegmentedPickerStyle())
//            .onChange(of: selectedMode) { newValue in
//                switch newValue {
//                case 1:
//                    globalSettings.isDark = true
//                case 0:
//                    globalSettings.isDark = false
//                default:
//                    break
//                }
//            }
            
        }
    }
}
struct DifficultySelectionView_Previews: PreviewProvider {

    static var previews: some View {
           DifficultySelectionView() // Provide an empty closure for the preview
               .environmentObject(GameLogic())
               .environmentObject(GlobalSettings.shared)
        
       }
}
    

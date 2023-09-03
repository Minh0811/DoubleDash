//
//  DifficultySelectionView.swift
//  my-2048
//
//  Created by Minh Vo on 24/08/2023.
//


import SwiftUI

struct DifficultySelectionView: View {
    @EnvironmentObject var gameLogic: GameLogic
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State private var refreshView: Bool = false
    
    let iphone14BaseWidth = GlobalState.shared.iphone14BaseWidth
    @State private var selectedDifficulty: Int = 0
    @State private var selectedMode: Int = 0

    // MARK: - Body
    var body: some View {
        ZStack{
            //Background
            BackgroundColorScheme.ignoresSafeArea()
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
           }
        
    }
}

extension DifficultySelectionView {
    
    func difficultyButtons(scalingFactor: CGFloat) -> some View {
        VStack(spacing: 20) {
            Text("Select Difficulty")
                .font(Font.system(size: 35 * scalingFactor).weight(.black))
                .foregroundColor(Color(red:0.47, green:0.43, blue:0.40, opacity:1.00))
            
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
            Picker(selection: $selectedMode, label: Text("Difficulty")) {
                Text("Dark Mode").tag(0)
                Text("Light Mode").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
}
struct DifficultySelectionView_Previews: PreviewProvider {
    @State static var dummyCurrentLevel: Int = 1
        static var dummyGameLogic = GameLogic()

    static var previews: some View {
           DifficultySelectionView() // Provide an empty closure for the preview
               .environmentObject(GameLogic())
        
       }
}
    

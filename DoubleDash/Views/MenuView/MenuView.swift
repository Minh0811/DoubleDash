//
//  MenuView.swift
//  my-2048
//
//  Created by Minh Vo on 24/08/2023.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var gameLogic: GameLogic
    @EnvironmentObject var globalSettings: GlobalSettings
    
    let iphone14BaseWidth = GlobalStates.shared.iphone14BaseWidth
    // MARK: - Body
    var body: some View {
       
            
        NavigationView {
            ZStack{
                //Background
                globalSettings.isDark ? DarkBackgroundColorScheme.ignoresSafeArea() : BackgroundColorScheme.ignoresSafeArea()
                //Buttons
                GeometryReader { geometry in
                    var scalingFactor: CGFloat {
                        return geometry.size.width / iphone14BaseWidth
                    }
                    HStack{
                        Spacer()
                        VStack{
                            Spacer()
                            menuButtons(scalingFactor: scalingFactor)
                                .padding()
                            Spacer()
                        }
                        Spacer()
                    }
                }
            }
        }  .navigationViewStyle(.stack)

       
        
    }
}

extension MenuView {
    
    func menuButtons(scalingFactor: CGFloat) -> some View {
        VStack(spacing: 20) {
            Text("Welcome")
                .font(Font.system(size: 65 * scalingFactor).weight(.black))
                .foregroundColor(globalSettings.isDark ? DarkTitleColorScheme : TitleColorScheme)
                .padding(.vertical, 50 * scalingFactor)

            NavigationLink(
                destination: RegistrationView().environmentObject(gameLogic),
                label: {
                    Text("Game")
                        .font(Font.system(size: 28 * scalingFactor))
                        .padding()
                        .frame(width: 230 * scalingFactor, height: 70 * scalingFactor)
                        .background(globalSettings.isDark ? ButtonColorScheme: DarkButtonColorScheme)
                        .foregroundColor(globalSettings.isDark ? DarkButtonLetterColorScheme : ButtonLetterColorScheme)
                        .cornerRadius(10 * scalingFactor)
                    
                }
            ).onTapGesture {
                gameLogic.newGame()
            }
            
            NavigationLink(
                destination: LeaderBoardView(),
                label: {
                    Text("Leader Board")
                        .font(Font.system(size: 28 * scalingFactor))
                        .padding()
                        .frame(width: 230 * scalingFactor, height: 70 * scalingFactor)
                        .background(globalSettings.isDark ? ButtonColorScheme: DarkButtonColorScheme)
                        .foregroundColor(globalSettings.isDark ? DarkButtonLetterColorScheme : ButtonLetterColorScheme)
                        .cornerRadius(10 * scalingFactor)
                    
                }
            )
            
            Button(action: {
                
            }) {
                Text("How to Play")
                    .font(Font.system(size: 28 * scalingFactor))
                    .padding()
                    .frame(width: 230 * scalingFactor, height: 70 * scalingFactor)
                    .background(globalSettings.isDark ? ButtonColorScheme: DarkButtonColorScheme)
                    .foregroundColor(globalSettings.isDark ? DarkButtonLetterColorScheme : ButtonLetterColorScheme)
                    .cornerRadius(10 * scalingFactor)
            }
            
            NavigationLink(
                destination: DifficultySelectionView().environmentObject(gameLogic), // Use the same gameLogic instance
                label: {
                    Text("Game Setting")
                        .font(Font.system(size: 28 * scalingFactor))
                        .padding()
                        .frame(width: 230 * scalingFactor, height: 70 * scalingFactor)
                        .background(globalSettings.isDark ? ButtonColorScheme: DarkButtonColorScheme)
                        .foregroundColor(globalSettings.isDark ? DarkButtonLetterColorScheme : ButtonLetterColorScheme)
                        .cornerRadius(10 * scalingFactor)
                }
            )
        }
    }
}


struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .environmentObject(GameLogic())
            .environmentObject(GlobalSettings.shared)
            .previewLayout(.sizeThatFits)
    }
}

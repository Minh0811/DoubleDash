//
//  GameView.swift
//  DoubleNumbers
//
//  Created by Minh Vo on 16/08/2023.
//

import SwiftUI

extension Edge {
    
    // Extension for Edge to convert from GameLogic.Direction
    static func from(_ from: GameLogic.Direction) -> Self {
        switch from {
        case .down:
            return .top
        case .up:
            return .bottom
        case .left:
            return .trailing
        case .right:
            return .leading
        }
    }
    
}

// Main GameView struct conforming to View
struct GameView : View {
    // MARK: - Property Declarations
    //  An instance of the `GlobalSettings` class.
    @EnvironmentObject var globalSettings: GlobalSettings
    // iphone 14 width size fetched from the shared `GlobalStates` object
    let iphone14BaseWidth = GlobalStates.shared.iphone14BaseWidth
    
    @Binding var currentPlayer: Player?

    //  Provide how the View should be presented for the custom back button
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    @State var ignoreGesture = false
    
    @State private var isGameOver = false
    
    @EnvironmentObject var gameLogic: GameLogic
    
    // Description for the current difficulty level
    var difficultyDescription: String {
        switch gameLogic.currentLevel {
        case 1:
            return LocalizedStrings.hard
        case 2:
            return LocalizedStrings.medium
        case 3:
            return LocalizedStrings.easy
        default:
            return "Unknown"
        }
    }
    
    // Layout traits for the game view
    fileprivate struct LayoutTraits {
        let bannerOffset: CGSize
        let showsBanner: Bool
        let containerAlignment: Alignment
    }
    
    // Function to determine layout traits based on device orientation
    fileprivate func layoutTraits(`for` proxy: GeometryProxy) -> LayoutTraits {
#if os(macOS)
        let landscape = false
#else
        let landscape = proxy.size.width > proxy.size.height
#endif
        
        return LayoutTraits(
            bannerOffset: landscape
            ? .init(width: 32, height: 0)
            : .init(width: 0, height: 32),
            showsBanner: landscape ? proxy.size.width > 720 : proxy.size.height > 550,
            containerAlignment: landscape ? .leading : .top
        )
    }
    
    // Gesture properties and logic
    var gestureEnabled: Bool {
        // Existed for future usage.
#if os(macOS) || targetEnvironment(macCatalyst)
        return false
#else
        return true
#endif
    }
    
    var gesture: some Gesture {
        let threshold: CGFloat = 44
        let drag = DragGesture()
            .onChanged { v in
                guard !self.ignoreGesture else { return }
                
                guard abs(v.translation.width) > threshold ||
                        abs(v.translation.height) > threshold else {
                    return
                }
                
                withTransaction(Transaction(animation: .spring())) {
                    self.ignoreGesture = true
                    
                    if v.translation.width > threshold {
                        // Move right
                        self.gameLogic.move(.right)
                    } else if v.translation.width < -threshold {
                        // Move left
                        self.gameLogic.move(.left)
                    } else if v.translation.height > threshold {
                        // Move down
                        self.gameLogic.move(.down)
                    } else if v.translation.height < -threshold {
                        // Move up
                        self.gameLogic.move(.up)
                    }
                    if !self.gameLogic.hasPossibleMoves() {
                        self.isGameOver = true
                    }
                }
            }
            .onEnded { _ in
                self.ignoreGesture = false
            }
        return drag
    }
    
    var content: some View {
        
        GeometryReader { proxy in
            
            var scalingFactor: CGFloat {
                return proxy.size.width / iphone14BaseWidth
            }
            
            bind(self.layoutTraits(for: proxy)) { layoutTraits in
                ZStack(alignment: layoutTraits.containerAlignment) {
                    VStack{
                        if layoutTraits.showsBanner {
                            Text("2048")
                                .font(Font.system(size: 40 ).weight(.black))
                                .foregroundColor(globalSettings.isDark ? DarkTitleColorScheme : TitleColorScheme)
                                .offset(layoutTraits.bannerOffset)
                                .padding()
                        }
                        Text("Score: \(self.gameLogic.score)")
                            .font(Font.system(size: 30 ))
                            .foregroundColor(globalSettings.isDark ? DarkTitleColorScheme : TitleColorScheme)
                        
                        Text("Level: \(difficultyDescription)")
                            .font(Font.system(size: 30 ))
                                  .foregroundColor(globalSettings.isDark ? DarkTitleColorScheme : TitleColorScheme)
                                  //.padding()
                    }
                    ZStack(alignment: .center) {
                        BlockGridView(matrix: self.gameLogic.blockMatrix,
                                      blockEnterEdge: .from(self.gameLogic.lastGestureDirection), deviceSize: proxy.size.width)
                    }
                    .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
                }
                .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
                .background(
                    Rectangle()
                        .fill( globalSettings.isDark ? DarkBackgroundColorScheme : BackgroundColorScheme)
                        .edgesIgnoringSafeArea(.all)
                    
                )
            }
        }
        
    }
    // MARK: - Body
    var body: some View {
        if gestureEnabled {
            
            return AnyView(
                
                ZStack{
                    //Custom Back Button
                    Spacer()
                        .navigationBarBackButtonHidden(true)
                        .toolbar(content: {
                            ToolbarItem (placement: .navigationBarLeading)  {
                                
                                Button(action: {
                               
                                    if let player = currentPlayer {
                                        updatePlayerScoreWithId(id: player.id, newScore: gameLogic.score)
                                        presentationMode.wrappedValue.dismiss()
                                    }
                                }, label: {
                                    ZStack{
                                        Rectangle()
                                            .fill(Color.black)
                                            .frame(width: 40, height: 40)
                                        Image(systemName: "multiply.square.fill")
                                            .foregroundColor(.white)
                                            .font(.system(size: 40))
                                    }
                                    //.padding(.top, 10)
                                    
                                })
                            }
                        })
                    
                    //The Game
                    content
                        .gesture(gesture, including: .all)
                        .alert(isPresented: $isGameOver) {
                            Alert(title: Text("Game Over"), message: Text("No possible moves left!"), dismissButton: .default(Text("New Game")) {
                                gameLogic.newGame()
                                isGameOver = false
                                self.gameLogic.score = 0
                               
                            })
                        }
                }
               
            )
        } else {
            return AnyView(content)
        }
    }
    
    
}

// MARK: - Previews
#if DEBUG
struct GameView_Previews : PreviewProvider {
    static var previews: some View {
        let mockStringArray: String = ""
        GameView(currentPlayer: .constant(Player(gameMode: 1, username: "MockUser", score: 0,achievementNames: mockStringArray)))
              .environmentObject(GameLogic())
              .environmentObject(GlobalSettings.shared)
      }
    
}
#endif


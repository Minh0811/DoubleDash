//
//  GameView.swift
//  DoubleNumbers
//
//  Created by Minh Vo on 16/08/2023.
//

import SwiftUI

extension Edge {
    
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

struct GameView : View {
    @Binding var currentPlayer: Player?

    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    @State var ignoreGesture = false
    
    @State private var isGameOver = false
    
    @EnvironmentObject var gameLogic: GameLogic
    
    
    fileprivate struct LayoutTraits {
        let bannerOffset: CGSize
        let showsBanner: Bool
        let containerAlignment: Alignment
    }
    
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
            bind(self.layoutTraits(for: proxy)) { layoutTraits in
                ZStack(alignment: layoutTraits.containerAlignment) {
                    VStack{
                        if layoutTraits.showsBanner {
                            Text("2048")
                                .font(Font.system(size: 48).weight(.black))
                                .foregroundColor(Color(red:0.47, green:0.43, blue:0.40, opacity:1.00))
                                .offset(layoutTraits.bannerOffset)
                            
                        }
                        Text("Score: \(self.gameLogic.score)")
                            .font(.title)
                            .padding()
                        Text("Width: \(proxy.size.width)")
                        Text("Current Level: \(gameLogic.currentLevel)")
                                  .font(.title2)
                                  .padding()
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
                        .fill(BackgroundColorScheme)
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
                    Spacer()
                        .navigationBarBackButtonHidden(true)
                        .toolbar(content: {
                            ToolbarItem (placement: .navigationBarLeading)  {
                                
                                Button(action: {
                                    currentPlayer?.score = gameLogic.score
                                               var updatedPlayers = load() ?? []
                                               if let player = currentPlayer, let index = updatedPlayers.firstIndex(where: { $0.username == player.username }) {
                                                   updatedPlayers[index] = player
                                               } else if let player = currentPlayer {
                                                   updatedPlayers.append(player)
                                               }
                                               save(players: updatedPlayers)
                                               presentationMode.wrappedValue.dismiss()
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

extension GameView{
    private var customBackButton: some View {
        Spacer()
            .navigationBarBackButtonHidden(true)
            .toolbar(content: {
                ToolbarItem (placement: .navigationBarLeading)  {
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
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
    }
}
#if DEBUG
struct GameView_Previews : PreviewProvider {
    
    static var previews: some View {
          GameView(currentPlayer: .constant(Player(username: "MockUser", score: 0)))
              .environmentObject(GameLogic())
      }
    
}
#endif


//
//  AlphabetFlashCardView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-02.
//

import SwiftUI

struct AlphabetFlashCardView: View {
  // MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    // isAlphabetQuiz = true -> Alphabet
    // isAlphabetQuiz = false -> Vowel
    @State var isAlphabetQuiz: Bool = true
  
  @State var showAlert: Bool = false
  @State var showGuide: Bool = false
  @State var showInfo: Bool = false
  @GestureState private var dragState = DragState.inactive
  private var dragAreaThreshold: CGFloat = 65.0
  @State private var lastCardIndex: Int = 1
  @State private var cardRemovalTransition = AnyTransition.trailingBottom
  
  // MARK: - CARD VIEWS
  @State var cardViews: [AlphabetCardView] = {
    var views = [AlphabetCardView]()
    for index in 0..<2 {
      views.append(AlphabetCardView(alphabet: kAlphabets[index]))
    }
    return views
  }()
  
  // MARK: - MOVE THE CARD
  
  private func moveCards() {
    cardViews.removeFirst()
    
    self.lastCardIndex += 1
    
    let alphabet = kAlphabets[lastCardIndex % kAlphabets.count]
    
    let newCardView = AlphabetCardView(alphabet: alphabet)
    
    cardViews.append(newCardView)
    
  }
  
  // MARK: TOP CARD
  
  private func isTopCard(cardView: AlphabetCardView) -> Bool {
    guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {
      return false
    }
    return index == 0
  }
  
  // MARK: - DRAG STATES
  
  enum DragState {
    case inactive
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize {
      switch self {
      case .inactive, .pressing:
        return .zero
      case .dragging(let translation):
        return translation
      }
    }
    
    var isDragging: Bool {
      switch self {
      case .dragging:
        return true
      case .pressing, .inactive:
        return false
      }
    }
    
    var isPressing: Bool {
      switch self {
      case .pressing, .dragging:
        return true
      case .inactive:
        return false
      }
    }
  }
  
  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .center) {
            // MARK: - CARDS
            ZStack {
              ForEach(cardViews) { cardView in
                cardView
                  .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                  .overlay(
                    ZStack {
                      // X-MARK SYMBOL
                      Image(systemName: "hand.thumbsdown")
                        .modifier(SymbolModifier())
                        .opacity(self.dragState.translation.width < -self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                      
                      // HEART SYMBOL
                      Image(systemName: "hand.thumbsup")
                        .modifier(SymbolModifier())
                        .opacity(self.dragState.translation.width > self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                    }
                )
                  .offset(x: self.isTopCard(cardView: cardView) ?  self.dragState.translation.width : 0, y: self.isTopCard(cardView: cardView) ?  self.dragState.translation.height : 0)
                  .scaleEffect(self.dragState.isDragging && self.isTopCard(cardView: cardView) ? 0.85 : 1.0)
                  .rotationEffect(Angle(degrees: self.isTopCard(cardView: cardView) ? Double(self.dragState.translation.width / 12) : 0))
                  .animation(.interpolatingSpring(stiffness: 120, damping: 120))
                  .gesture(LongPressGesture(minimumDuration: 0.01)
                    .sequenced(before: DragGesture())
                    .updating(self.$dragState, body: { (value, state, transaction) in
                      switch value {
                      case .first(true):
                        state = .pressing
                      case .second(true, let drag):
                        state = .dragging(translation: drag?.translation ?? .zero)
                      default:
                        break
                      }
                    })
                    .onChanged({ (value) in
                      guard case .second(true, let drag?) = value else {
                        return
                      }
                      
                      if drag.translation.width < -self.dragAreaThreshold {
                          self.cardRemovalTransition = .leadingBottom
                      }
                      
                      if drag.translation.width > self.dragAreaThreshold {
                        self.cardRemovalTransition = .trailingBottom
                      }
                    })
                    .onEnded({ (value) in
                      guard case .second(true, let drag?) = value else {
                        return
                      }
                    
                      if drag.translation.width < -self.dragAreaThreshold {
                            playSound(sound: kAlphabets[self.lastCardIndex].sound, type: "mp3")
                            self.moveCards()
                      }
                      
                      if drag.translation.width > self.dragAreaThreshold {
                            playSound(sound: kAlphabets[self.lastCardIndex].sound, type: "mp3")
                            self.moveCards()
                      }
                      
                    })
                ).transition(self.cardRemovalTransition)
              }
            }
            .onAppear(){
                playSound(sound: kAlphabets[0].sound, type: "mp3")
            }
            //: ZSTACK
        }
           
        //: VSTACK
        .padding(.top)
        .modifier(NavigationBarTitleModifier(titleBar: text._menuAlphabet))
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                  Image(systemName: "arrow.backward")
                    .modifier(NavigationBarIconModifier())
                }
            }
        }
        
      } //: SCROLL
      .modifier(ScreenModifier())
    } //: NAVIGATION
    
    .navigationViewStyle(StackNavigationViewStyle())
  }
}

struct AlphabetFlashCardView_Previews: PreviewProvider {
  static var previews: some View {
    AlphabetFlashCardView()
      .previewDevice("iPhone 12 Pro")
  }
}

//
//  ChapterListView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-11.
//

import SwiftUI

struct SentenceListView: View {
  // MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    var chapter: ChapterModel?
    var section: SectionModel? 
    @State var sentences: [SentenceModel]
    
    
     // MARK: - CARD PROPERITES
     @State var showAlert: Bool = false
     @State var showGuide: Bool = false
     @State var showInfo: Bool = false
     @GestureState private var dragState = DragState.inactive
     var dragAreaThreshold: CGFloat = 65.0
     @State private var lastCardIndex: Int = 1
     @State private var cardRemovalTransition = AnyTransition.trailingBottom
     
     // MARK: - CARD VIEWS
     @State var cardViews: [SentenceCardView] = []
     
     // MARK: - MOVE THE CARD
    private func moveCards() {
       cardViews.removeFirst()
        
        self.lastCardIndex += 1
        
        if (self.lastCardIndex >= 0 && sentences.count > self.lastCardIndex) {
            // This line will not throw index out of range:
        }else {
            self.lastCardIndex = 0
        }
       
       let sentence = sentences[lastCardIndex % sentences.count]
       
       let newCardView = SentenceCardView(sentence: sentence)
       
       cardViews.append(newCardView)
       
     }
     // MARK: TOP CARD
     
     private func isTopCard(cardView: SentenceCardView) -> Bool {
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
    
  // MARK: - BODY
  var body: some View {
    NavigationView {
       /* VStack {
            //if let sentences = sentences {
            ForEach (sentences) { row in
                    Text(row.sentence_text)
            }
            //}
        }*/
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
                            //self.cardRemovalTransition = .leadingBottom
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
                            //SpeechService().speak(text: "\(sentences[self.lastCardIndex].sentence_text)") {}
                            //self.moveCards()
                        }
                        
                        if drag.translation.width > self.dragAreaThreshold {
                            SpeechService().speak(text: "\(sentences[self.lastCardIndex].sentence_text)") {}
                            self.moveCards()
                        }
                        
                      })
                  ).transition(self.cardRemovalTransition)
                }
              }
              .onAppear(){
                    SpeechService().speak(text: "\(sentences[0].sentence_text)") {}
              }
              //: ZSTACK
          }
          // MARK: - CLOSE VIEW
          .overlay(
              VStack(alignment: .center, spacing: 12) {
                  ButtonIconAction(imageName: "xmark",frameSize: 25) {
                      self.presentationMode.wrappedValue.dismiss()
                  }
              }
              .frame(minWidth: 100)
              .padding(.top, 50)
              , alignment: .topTrailing)
             
          //: VSTACK
          .navigationBarTitle(text._menuAlphabet, displayMode: .inline)
          //.navigationBarBackButtonHidden(true)
          .navigationBarHidden(true)
          
        } //: SCROLL
        .edgesIgnoringSafeArea(.bottom)
        .background(
          backgroundGradient.ignoresSafeArea(.all)
        )
        .onAppear() { 
            cardViews = {
                var views = [SentenceCardView]()
                for index in 0..<2 {
                    views.append(SentenceCardView(sentence : sentences[index]))
                }
                return views
              }()
        }
        .onDisappear() {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
    .navigationViewStyle(StackNavigationViewStyle())
    //: NAVIGATION
  }
}

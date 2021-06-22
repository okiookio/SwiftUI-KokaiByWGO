//
//  AlphabetQuizView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-04.
//

import SwiftUI

struct QuizView: View {
    @Environment(\.presentationMode) var presentationMode  
    @ObservedObject var quizVM = QuizVM()
    
    // isAlphabetQuiz = true -> Alphabet
    // isAlphabetQuiz = false -> Vowel
    @State var isAlphabetQuiz: Bool = true
    
    @State var headerText: String = ""
    @State var CorrectSoundName: String = ""
    @State var playNow: Bool = false
    @State var isCorrect: Bool = false
    @State var isChoosedAnswer: Bool = false
    
    @State private var animatingSymbol: Bool = false
    @State private var animatingModal: Bool = false
    @State private var showingModal: Bool = false
    @State private var gridLayout: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    // MARK: - FUNCTIONS
    func LoadNextQuiz() {
        if quizVM.quizProgress == kMaxQuiz {
            self.showingModal = true
            playSound(sound: "finish", type: "mp3")
        } else {
            
            if isAlphabetQuiz {
                headerText = text._menuAlphabet
                quizVM.loadQuizChoices(numberOfRows: 44)
                CorrectSoundName = kAlphabets[quizVM.quizAnswerIndex].sound
            } else {
                headerText = text._menuVowel
                quizVM.loadQuizChoices(numberOfRows: 32)
                CorrectSoundName = kVowels[quizVM.quizAnswerIndex].sound
            }
            
            if quizVM.quizProgress == 1 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    playSound(sound: CorrectSoundName, type: "mp3")
                }
            } else {
                playSound(sound: CorrectSoundName, type: "mp3")
            }
        }
    }
    
     
    
    func checkIsCorrect(yourAnswer: Int){
        //print("Your Answer \(yourAnswer)  => \(quizVM.quizAnswerIndex)")
        if quizVM.quizAnswerIndex == yourAnswer {
            quizVM.score += 1
            isCorrect = true
            playSound(sound: "sound-correct", type: "mp3")
        } else {
            isCorrect = false
            playSound(sound: "sound-incorrect", type: "mp3")
        }
        
        isChoosedAnswer = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            LoadNextQuiz()
            isChoosedAnswer = false
        }
    }
    
    func loadSymbol(yourAnswer: Int) -> String{
        if quizVM.quizAnswerIndex == yourAnswer {
            return "checkmark.circle"
        } else {
            return "xmark.circle"
        }
    }
    
    func loadChoiceImage(index: Int) -> String {
        if isAlphabetQuiz {
             return kAlphabets[index].image
        } else {
             return kVowels[index].image
        }
    }
    
    
    // MARK: - BODY
    
    var body: some View {
        // MARK: - MAIN VIEW
        NavigationView {
            VStack {
                ZStack {
                    // Note: - Start
                   VStack {
                       // MARK: - PROGRESS BAR
                       ProgressView(" \(quizVM.quizProgress) from \(kMaxQuiz) ", value: Double(quizVM.quizProgress), total: Double(kMaxQuiz))
                       // MARK: - SCORE
                       HStack {
                         HStack {
                           Text(text._yourScore.uppercased())
                             .scoreLabelStyle()
                             .multilineTextAlignment(.trailing)
                           
                           Text("\(quizVM.score)")
                             .scoreNumberStyle()
                             .modifier(ScoreNumberModifier())
                         }
                         .modifier(ScoreContainerModifier())
                         
                         Spacer()
                       
                           Button(action: {
                               playSound(sound: CorrectSoundName, type: "mp3")
                           }, label: {
                               HStack {
                                 Image(systemName: "speaker.wave.2")
                                   .font(.title)
                                   .foregroundColor(.white)
                                   Text(text._playAgain.uppercased())
                                   .scoreLabelStyle()
                                   .multilineTextAlignment(.leading)
                                   
                                 
                               }
                               .modifier(ScoreContainerModifier())
                           })
                       }
                       
                       // MARK: - Choces
                       LazyVGrid(columns: gridLayout, alignment: .center, spacing: 2) {
                           ForEach(quizVM.choicesIndex, id: \.self) { index in
                               Button(action: {
                                   checkIsCorrect(yourAnswer: index)
                               } , label: {
                                   Image(loadChoiceImage(index: index))
                                       .resizable()
                                       .scaledToFit()
                                       .frame(maxHeight: kScreen.height * 0.29)
                                       .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                                       .padding(7)
                                       .overlay(
                                           (isChoosedAnswer && quizVM.quizAnswerIndex == index) ?
                                                Image(systemName: loadSymbol(yourAnswer: index))
                                                .modifier(SymbolModifier())
                                                .opacity(8)
                                                :
                                                Image(systemName: "checkmark.circle")
                                                .modifier(SymbolModifier())
                                                .opacity(0.0)
                                       )
                                       .blur(radius: (isChoosedAnswer && quizVM.quizAnswerIndex != index) ? 5 : 0, opaque: false)
                               })
                               .disabled(isChoosedAnswer)
                         } //: LOOP
                       } //: GRID
                       .padding(10)
                       .animation(.easeIn)
                       Spacer()
                   }
                   .onAppear() {
                       quizVM.resetQuiz()
                       LoadNextQuiz()
                   }
                   .padding(.top, isIpadAndMacOS() ? 0 : 60)
                   .padding(.leading, isIpadAndMacOS() ? 50 : 0)
                   .padding(.trailing, isIpadAndMacOS() ? 50 : 0)
                    //: ZSTACK
                   // Note: - End
                    
                    // MARK: - POPUP
                    if $showingModal.wrappedValue {
                      ZStack {
                        Color("ColorTransparentBlack").edgesIgnoringSafeArea(.all)
                        
                        // MODAL
                        VStack(spacing: 0) {
                          // TITLE
                          Text("YOUR SCORE")
                            .modifier(TextScoreModifier())
                          
                            Spacer()
                          // MESSAGE
                          VStack(alignment: .center, spacing: 16) {
                            
                            Text("\(quizVM.score) from \(kMaxQuiz)")
                              .scoreResultStyle()
                            Image(systemName: "crown.fill")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .foregroundColor(Color("crownColor"))
                            
                            Button(action: {
                                self.showingModal = false
                                self.animatingModal = false
                                quizVM.resetQuiz()
                                LoadNextQuiz()
                            }) {
                              Text("New Game".uppercased())
                                .fontWeight(.semibold)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .modifier(IconButtonModifier())
                            }
                            
                            Button(action: {
                                self.presentationMode.wrappedValue.dismiss()
                            }) {
                              Text("Back to menu".uppercased())
                                .fontWeight(.semibold)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .modifier(IconButtonModifier())
                            }
                          }
                          Spacer()
                        }
                        .padding(.bottom, 10)
                        .frame(minWidth: 300, idealWidth: 300, maxWidth: 350, minHeight: 300, idealHeight: 300, maxHeight: 350, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: Color("SheetBackgroundColor"), radius: 6, x: 0, y: 8)
                        .opacity($animatingModal.wrappedValue ? 1 : 0)
                        .offset(y: $animatingModal.wrappedValue ? 0 : -100)
                        .animation(Animation.spring(response: 0.6, dampingFraction: 1.0, blendDuration: 1.0))
                        .onAppear(perform: {
                          self.animatingModal = true
                        })
                      }
                    }//:ZSTACK pop model
                    
                } //: ZSTACK
              
            } //: VSTACK
            .modifier(NavigationBarTitleModifier(titleBar: text._menuQuiz))
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
            .toolbar {
              ToolbarItem(placement: .navigationBarTrailing) {
                HStack(spacing: 16) {
                  
                    if self.isIpadAndMacOS() {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                          Image(systemName: "xmark")
                              .modifier(NavigationBarIconModifier())
                        }
                    }
                } //: HSTACK
              } //: BUTTONS
            } //: TOOLBAR
            .frame(width: self.getScreen().width, height: self.getScreen().height)
            .padding(.top, isIpadAndMacOS() ? 50 : 0)
            .modifier(ScreenModifier())
        }
        .navigationViewStyle(StackNavigationViewStyle())
        //: NAVIGATION
  
    }
}

struct AlphabetQuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}

//
//  SentenceAutoRead.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-15.
//

import SwiftUI

struct SentenceAutoRead: View {
    @Environment(\.presentationMode) var presentationMode
    var section: SectionModel?
    
    @StateObject var chapterVM = ChapterVM()
    @StateObject var sectionVM = SectionVM()
    
    @State var sentences: [SentenceModel]
    
    @State var isPause: Bool = false
    @State var isPrevious: Bool = false
    @State var isNext: Bool = false
 
    
    @State var sentenceIndex: Int = 0
    @State var CountTimer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State var currentSectionPosition = 0
    
    func getPreviousSection(){
        var index = 0
        for sectionRow in sectionVM.sections {
            guard let section = section else {
               return
            }
            if sectionRow.section_code == section.section_code {
                currentSectionPosition = index
            }
            print("...")
            index += 1
        }
        
        if (currentSectionPosition == 0) {
            isPrevious = false
            isNext = true
        } else if  (currentSectionPosition == sectionVM.sections.count){
            isPrevious = true
            isNext = false
        } else {
            isPrevious = true
            isNext = true
        }
        
        
        
    }
    /*
    private func isTopCard(cardView: AlphabetCardView) -> Bool {
      guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {
        return false
      }
      return index == 0
    }*/
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text(sectionVM.sectionName[sentences[sentenceIndex].section_code] ?? text._unknownText)
                    .modifier(TextHeaderModifier())
                
                VStack {
                    
                    if (sentenceIndex-1 >= 0 && sentences.count > sentenceIndex-1) {
                        SentenceAutoReadCardView(sentence: sentences[sentenceIndex-1], isCurrentSentence: false, isPause: $isPause)
                    } else {
                        SentenceAutoReadCardView(isCurrentSentence: false, isPause: $isPause)
                    }
                    
                    SentenceAutoReadCardView(sentence: sentences[sentenceIndex], isCurrentSentence: true, isPause: $isPause)
                
                    if (sentenceIndex+1 >= 0 && sentences.count > sentenceIndex+1) {
                        SentenceAutoReadCardView(sentence: sentences[sentenceIndex+1], isCurrentSentence: false, isPause: $isPause)
                    } else {
                        SentenceAutoReadCardView(isCurrentSentence: false, isPause: $isPause)
                    }
                }
                .onReceive(CountTimer) { _ in
                    if sentenceIndex < sentences.count-1 {
                        sentenceIndex += 1
                    } else {
                        sentenceIndex = 0
                    }
                    if (sentenceIndex >= 0 && sentences.count > sentenceIndex) {
                        SpeechService().speak(text: "\(sentences[sentenceIndex].sentence_text)") {}
                    }
                }
                .onAppear() {
                    if (sentenceIndex >= 0 && sentences.count > sentenceIndex) {
                        SpeechService().speak(text: "\(sentences[sentenceIndex].sentence_text)") {}
                    }
                    getPreviousSection()
                }
                .onDisappear() {
                    self.CountTimer.upstream.connect().cancel()
                }
                
                Spacer()
                
                HStack {
                    /*
                    // Previous Button
                    if self.isPrevious {
                        Image(systemName: "arrow.left.circle")
                            .font(.system(size: 60, design: .rounded))
                    }*/
                    
                    // Pause and Play Button
                    if self.isPause {
                        Button {
                            self.isPause.toggle()
                        } label: {
                            Image(systemName: "pause.fill")
                                .font(.system(size: 70, design: .rounded))
                                .foregroundColor(.white)
                        }
                    } else {
                        Button {
                            self.isPause.toggle()
                        } label: {
                            Image(systemName: "play.fill")
                                .font(.system(size: 70, design: .rounded))
                                .foregroundColor(.white)
                        }
                    }
                    /*
                    // Next Button
                    if self.isNext {
                        Image(systemName: "arrow.right.circle")
                            .font(.system(size: 60, design: .rounded))
                    }*/
                }
               Spacer()
            }
            .onChange(of: isPause, perform: { _ in
                if isPause {
                    CountTimer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
                } else {
                    self.CountTimer.upstream.connect().cancel()
                }
            })
            .modifier(loadViewEffectModifier())
            //: VSTACK
            .modifier(NavigationBarTitleModifier(titleBar: chapterVM.chapterName[sentences[sentenceIndex].chapter_code] ?? text._unknownText))
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
        //: ZStack
        
        
    }
}
 
/*
 

 Spacer()
 
struct SentenceAutoRead_Previews: PreviewProvider {
    static var previews: some View {
        SentenceAutoRead()
    }
}*/

struct SentenceAutoReadCardView: View {
  // MARK: - PROPERTIES
    var sentence: SentenceModel?
    var isCurrentSentence = false
    @Binding var isPause: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(isCurrentSentence ? Color.red.opacity(0.5) : Color.gray.opacity(0.3))
            VStack {
                if let sentence = sentence {
                    if isCurrentSentence {
                        Button {
                            self.isPause.toggle()
                        } label: {
                            Text(sentence.sentence_text)
                                .modifier(TextAutoReadCurrentModifier())
                        }
                    } else {
                        Text(sentence.sentence_text)
                            .modifier(TextAutoReadPreviousAndNextModifier())
                    }
                } else {
                    Image(systemName: "slowmo")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: kScreen.width * 0.95 , height: kScreen.height * 0.15)
        
    }
}


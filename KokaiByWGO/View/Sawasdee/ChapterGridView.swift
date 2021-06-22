//
//  ChapterGridView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-21.
//

import SwiftUI

struct ChapterGridView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var levelVM = LevelVM()
    @StateObject var chapterVM = ChapterVM()
    @StateObject var sectionVM = SectionVM()
    @StateObject var sentenceVM = SentenceVM()
    
    var isScrollViewVertical:Bool = true
    
    var chapters: [String : [ChapterModel]] {
        .init(
            grouping: chapterVM.chapters,
            by: {$0.level_code}
        )
    }
    
    var sentences: [String : [SentenceModel]] {
        .init(
            grouping: sentenceVM.sentences,
            by: {$0.section_code}
        )
    }
 
    let columns = [GridItem(.flexible())]
    
    func getSentencesBySectionCode(_ section_code: String) -> [SentenceModel] {
        return sentences[section_code]!
    }
    var body: some View {
        
        if isScrollViewVertical {
            // ScrollViewVertical Start
            ScrollView(isScrollViewVertical ? .vertical : .horizontal, showsIndicators: false) {
                LazyVGrid(columns: columns, alignment: .center,
                          spacing: 16,
                          pinnedViews: [.sectionHeaders, .sectionFooters]) {
                    ForEach(chapterVM.chapters) { row in
                        VStack (alignment: .trailing){
                            GroupBox() {
                              DisclosureGroup(row.chapter_name) {
                                ForEach (sectionVM.sections) { sectionRow in
                                    if sectionRow.chapter_code == row.chapter_code {
                                        HStack(alignment: .center){
                                            VStack (alignment: .leading) {
                                                Text(sectionRow.section_name)
                                                    .font(.system(size: self.isIpadAndMacOS() ? 25 : 15, weight: .heavy, design: .rounded))
                                                    .padding(4)
                                                    .fixedSize()

                                                Text(sectionRow.section_descritpion)
                                                    .font(.system(size: self.isIpadAndMacOS() ? 50 : 30, weight: .heavy, design: .rounded))
                                                    .fixedSize(horizontal: false, vertical: true)
                                            }
                                            .padding(4)
                                            
                                            Spacer()
                                            
                                            VStack(spacing: 20){
                                                
                                                Spacer(minLength: 0)
                                                
                                                Button {
                                                    SpeechService().speak(text: "\(sectionRow.section_name) \(sectionRow.section_descritpion)") {}
                                                } label: {
                                                CircleIconView(iconName: "speaker.wave.2", circleIconColor: Color.orange)
                                                }//: BUTTON
                                            
                                                NavigationLink(destination: SentenceAutoRead(section: sectionRow, sentences: getSentencesBySectionCode(sectionRow.section_code))
                                                ) {
                                                    CircleIconView(iconName: "arrowshape.turn.up.right", circleIconColor: Color.orange)
                                                }
                                                
                                                Spacer(minLength: 0)
                                            }
                                            .padding(.trailing)
                                        }
                                        .frame(width: self.isIpadAndMacOS() ? self.getScreen().width * 0.55 : self.getScreen().width * 0.8,
                                               height: (self.getScreen().height * 0.4) / 3)
                                        .modifier(CardModifier())
                                        // going to rate view in 3d angle...
                                        .rotation3DEffect(.init(degrees: 15), axis: (x: -1, y: -1, z: 0))
                                        // going to trim view..
                                        .padding(.vertical, 10)
                                        .padding(.trailing, isIpadAndMacOS() ? 50 : 25)
                                        .padding(.horizontal)
                                    }
                                } //: ForEach
                              }.modifier(DisclosureGroupModifier())
                                //: DisclosureGroup
                            }//: GROUPBOX
                        }
                        .padding(.leading, isIpadAndMacOS() ? 50 : 5)
                        .padding(.trailing, isIpadAndMacOS() ? 50 : 5)
                        //: VSTACK
                    }//: ForEach
                }//: LazyVGrid
            }//: ScrollView
            // ScrollViewVertical End
        } else {
            // ScrollViewHorizontal Start
            ScrollView(isScrollViewVertical ? .vertical : .horizontal) {
                    ForEach(chapterVM.chapters) { row in
                        VStack {
                            Text(row.chapter_name)
                                .modifier(TextHeaderModifier())
                            
                            /*ForEach (sectionVM.sections) { sectionRow in
                                if sectionRow.chapter_code == row.chapter_code {
                                    Text(sectionRow.section_name)
                                        .font(.system(size: self.isIpadAndMacOS() ? 25 : 15, weight: .heavy, design: .rounded))
                                        .padding(4)
                                        .fixedSize()

                                    Text(sectionRow.section_descritpion)
                                        .font(.system(size: self.isIpadAndMacOS() ? 50 : 30, weight: .heavy, design: .rounded))
                                        .fixedSize(horizontal: false, vertical: true)
                                }*/
                            }
                            
                        }
                        .frame(width: self.isIpadAndMacOS() ? self.getScreen().width * 0.55 : self.getScreen().width * 0.8,
                                height: (self.getScreen().height * 0.4) / 3)
                         .modifier(CardModifier())
                    }
                 
            }
            // ScrollViewHorizontal End
        }
    }
}

struct ChapterGridView_Previews: PreviewProvider {
    static var previews: some View {
        ChapterGridView()
    }
}

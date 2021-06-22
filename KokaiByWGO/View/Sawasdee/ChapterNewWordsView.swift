//
//  ChapterNewWordsView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-16.
//

import SwiftUI

struct ChapterNewWordsView: View {
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    @StateObject var chapterVM = ChapterVM()
    @StateObject var sentenceVM = SentenceVM()
    /*
    #if targetEnvironment(macCatalyst)
        let columns = [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ]
    #else
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    #endif*/
   @State var columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    func getColumn() -> [GridItem] {
        if self.isIpadAndMacOS() {
            return [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ]
        } else {
            return [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ]
        }
    }
    
    // MARK: - BODY
    var body: some View {
        
        
        
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: getColumn(), alignment: .center,
                          spacing: 16,
                          pinnedViews: [.sectionHeaders, .sectionFooters]) {
                    ForEach(chapterVM.chapters) { row in
                        VStack {
                            Text(row.chapter_name)
                                .font(.title)
                        }
                        .modifier(cornerRadiusButtonModifier())
                        .frame(maxHeight: .infinity)
                    }
                }.padding(10)
                .animation(.easeIn)
            }.onAppear() {
                sentenceVM.newWords()
            }
            .modifier(NavigationBarTitleModifier(titleBar: text._menuNewWords))
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
            .modifier(ScreenModifier())
        }
        .navigationViewStyle(StackNavigationViewStyle())
        //: NAVIGATION
    }
}

// MARK: - PREVIEW
struct ChapterNewWordsView_Previews: PreviewProvider {
    static var previews: some View {
        ChapterNewWordsView()
    }
}

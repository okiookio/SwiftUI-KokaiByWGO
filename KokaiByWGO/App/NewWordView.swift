//
//  TypingView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-05-31.
//

import SwiftUI

struct NewWordView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    @State var isShowing: Bool = false
    @State var isShowInputItemView: Bool = false
    @State var spellingImages: [String] = []
    
    var body: some View {
        NavigationView {
          ZStack {
            // MARK: - MAIN VIEW
            VStack {
                HeroHeaderView(heroTextHeader: text._newWord)
                WordFormView(isShowInputItemView: $isShowInputItemView, spellingImages: $spellingImages)
                Spacer()
            }
            .blur(radius: isShowInputItemView ? 6.0 : 0, opaque: false)
            .modifier(loadViewEffectModifier())
            .padding(7)
            
            // MARK: - NEW TASK ITEM
            if isShowInputItemView {
                BlankView(
                  backgroundColor: isDarkMode ? Color.black : Color.gray,
                  backgroundOpacity: isDarkMode ? 0.3 : 0.5)
                  .onTapGesture {
                    withAnimation() {
                        isShowInputItemView = false
                    }
                  }
                SheetTypingView(isShowInputItemView: $isShowInputItemView, spellingImages: $spellingImages)
            }
            
          } //: ZSTACK
          .onAppear() {
            UITableView.appearance().backgroundColor = UIColor.clear
          }
          .navigationBarTitle(text._newWord, displayMode: .large)
          .navigationBarHidden(true)
          /*.background(
            BackgroundImageView()
              .blur(radius: isShowInputItemView ? 8.0 : 0, opaque: false)
          )*/
          .background(
            backgroundGradient.ignoresSafeArea(.all)
          )
        } //: NAVIGATION
        //.navigationViewStyle(StackNavigationViewStyle())
       
    }
}

struct NewWordView_Previews: PreviewProvider {
    static var previews: some View {
        NewWordView()
    }
}
/*
 
 */

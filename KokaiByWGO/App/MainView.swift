//
//  MainView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-05-26.
//

import SwiftUI

struct MainView: View {
    @State private var alphabets: [AlphabetModel] = Bundle.main.decode("Alphabets.json")
  var body: some View {
    TabView {
        AlphabetView()
        .tabItem {
          Image(systemName: "square.grid.2x2")
            Text(text._menuAlphabet)
        }
        
        VowelView()
        .tabItem {
          Image(systemName: "play.rectangle")
            Text(text._menuVowel)
        }
        
        NewWordView()
        .tabItem {
          Image(systemName: "keyboard")
            Text(text._menuTypeing)
        }
        
    } //: TAB
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
      .previewDevice("iPhone 12 Pro")
  }
}


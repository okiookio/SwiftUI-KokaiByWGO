//
//  HomeMenuView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-04.
//

import SwiftUI

struct HomeMenuData : Identifiable {
    var id : Int
    var title : String
    var navigationView : String
    var color : Color
}

var HomeMenuList = [
    HomeMenuData(id: 0, title: text._menuAlphabet, navigationView: "AlphabetView", color: Color("ColorBackground1")),
    HomeMenuData(id: 2, title: text._menuVowel, navigationView: "VowelView", color: Color("ColorBackground2")),
    HomeMenuData(id: 1, title: text._menuNewWords, navigationView: "ChapterNewWordsView",color: Color("ColorBackground3")),
]

struct HomeMenuView: View { 

    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    var body: some View {
        NavigationView {
            VStack{
               /* if self.isIpadAndMacOS() {
                    Spacer()
                }*/
                HStack{
                    Text(text._menuHome)
                        .modifier(TextHeaderModifier())
                }
                
                Spacer()
                VStack(spacing: 10){
                    ForEach(HomeMenuList){i in
                        HomeCardHStack(data: i)
                    }
                }
                //.padding(.leading, isIpadAndMacOS() ? 70 : 0)
                .padding(.bottom)
                
                Spacer()
            }
            .frame(width: self.getScreen().width)
            .modifier(ScreenModifier())
            .navigationBarHidden(true)
        } //: NAVIGATION
       .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeMenuView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMenuView()
    }
}

struct HomeCardHStack : View {
    
    var data : HomeMenuData
    
    var body: some View{
        
        HStack(alignment: .center){
            Text(data.title)
                .modifier(TextMainMenuModifier())
            
            Spacer()
            
            VStack(spacing: 20){
                
                Spacer(minLength: 0)
                
                CircleIconView(iconName: "speaker.wave.2", circleIconColor: self.data.color)
              
                 if self.data.navigationView == "AlphabetView" {
                    NavigationLink(destination: AlphabetView().modifier(HiddenNavigationBarModifier())
                    ) {
                        CircleIconView(circleIconColor: self.data.color)
                    }
                 } else if self.data.navigationView == "VowelView" {
                    NavigationLink(destination: VowelView().modifier(HiddenNavigationBarModifier())
                    ) {
                        CircleIconView(circleIconColor: self.data.color)
                    }
                 } else if self.data.navigationView == "ChapterNewWordsView" {
                    NavigationLink(destination: ChapterNewWordsView().modifier(HiddenNavigationBarModifier())
                    ) {
                        CircleIconView(circleIconColor: self.data.color)
                    }
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
}


/*
struct CardVStack : View {
    
    var data : HomeMenuData
    
    var body: some View{
        
        VStack (alignment: .trailing){
            Text(data.title)
                .modifier(TextMainMenuModifier())
            Spacer()
            
            HStack(spacing: 20){
                Spacer()
                
                CircleIconView(iconName: "speaker.wave.2", circleIconColor: self.data.color)
              
                 if self.data.navigationView == "AlphabetView" {
                    NavigationLink(destination: AlphabetView().modifier(HiddenNavigationBarModifier())
                    ) {
                        CircleIconView(iconName: "arrowshape.turn.up.right", circleIconColor: self.data.color)
                    }
                 } else if self.data.navigationView == "VowelView" {
                    NavigationLink(destination: VowelView().modifier(HiddenNavigationBarModifier())
                    ) {
                        CircleIconView(iconName: "arrowshape.turn.up.right", circleIconColor: self.data.color)
                    }
                 } else if self.data.navigationView == "ChapterNewWordsView" {
                    NavigationLink(destination: ChapterNewWordsView().modifier(HiddenNavigationBarModifier())
                    ) {
                        CircleIconView(iconName: "arrowshape.turn.up.right", circleIconColor: self.data.color)
                    }
                 }
                Spacer(minLength: 0)
            }
            .padding(.leading)
        }
        .frame(width: self.getScreen().width * 0.5,
            height: (self.getScreen().height * 0.5) / 3)
        .modifier(CardModifier())
        // going to rate view in 3d angle...
        .rotation3DEffect(.init(degrees: 15), axis: (x: -1, y: -1, z: 0))
        // going to trim view..
        .padding(.vertical, 20)
        .padding(.horizontal)
    }
}
*/

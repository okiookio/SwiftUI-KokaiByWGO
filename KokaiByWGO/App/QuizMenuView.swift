//
//  QuizMenuView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-04.
//

import SwiftUI

struct QuizMenuData : Identifiable {
    var id : Int
    var title : String
    var navigationView : String
    var color : Color
}

var QuizMenuList = [
    QuizMenuData(id: 0, title: text._quizAlphabetHeader, navigationView: "AlphabetQuiz", color: Color("ColorBackground1")),
    QuizMenuData(id: 2, title: text._quizVowelHeader, navigationView: "VowelQuiz", color: Color("ColorBackground2"))
    
]

struct QuizMenuView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    var body: some View {
        NavigationView {
            VStack{
               /* if self.isIpadAndMacOS() {
                    Spacer()
                }*/
                HStack{
                    Text(text._menuQuiz)
                        .modifier(TextHeaderModifier())
                }
                
                Spacer()
                VStack(spacing: 10){
                    ForEach(QuizMenuList){i in
                        QuizCardHStack(data: i)
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

struct QuizMenuView_Previews: PreviewProvider {
    static var previews: some View {
        QuizMenuView()
    }
}


struct QuizCardHStack : View {
    
    var data : QuizMenuData
    
    var body: some View{
        
        HStack(alignment: .center){
            Text(data.title)
                .modifier(TextMainMenuModifier())
            
            Spacer()
            
            VStack(spacing: 20){
                
                Spacer(minLength: 0)
                
                CircleIconView(iconName: "speaker.wave.2", circleIconColor: self.data.color)
              
                 if self.data.navigationView == "AlphabetQuiz" {
                    NavigationLink(destination: QuizView(isAlphabetQuiz: true).modifier(HiddenNavigationBarModifier())
                    ) {
                        CircleIconView(circleIconColor: self.data.color)
                    }
                 } else if self.data.navigationView == "VowelQuiz" {
                    NavigationLink(destination: QuizView(isAlphabetQuiz: false).modifier(HiddenNavigationBarModifier())
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
 @AppStorage("isDarkMode") private var isDarkMode: Bool = false
 
 var body: some View {
     NavigationView {
         // MARK: - MAIN VIEW
         HStack {
             Spacer()
             VStack {
                 Spacer()
                  
                 NavigationLink(destination: QuizView(isAlphabetQuiz: true).modifier(HiddenNavigationBarModifier())
                 ) {
                     Text("Alphabet Quiz")
                         .modifier(HomeButtonModifier())
                 }
                 
                 NavigationLink(destination: QuizView(isAlphabetQuiz: false).modifier(HiddenNavigationBarModifier())
                 ) {
                     Text("Vowel Quiz")
                         .modifier(HomeButtonModifier())
                 }
                 Spacer()
             }
             //:VSTACK
             Spacer()
         }//: HSTACK
         .modifier(loadViewEffectModifier())
         .navigationBarHidden(true)
        // .background(Color.red)
         .background(
             backgroundGradient.ignoresSafeArea(.all)
         )
     } //: NAVIGATION
     .navigationViewStyle(StackNavigationViewStyle())
 }
 
 */

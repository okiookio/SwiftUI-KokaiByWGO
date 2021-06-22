//
//  ContentView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-17.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection = 0
    @State private var firstTabReset = UUID()
    
    // Hiding tab Bar...
    init() {
        // UITab bar is not availble for macOS...
        #if os(iOS)
        UITabBar.appearance().isHidden = true
        #endif
    }
    
    // SelectedTab...
    @State var selectedTab = "Home"
    
    // For Dark Mode...
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View{
        return ZStack(alignment: self.isIphone() ? .bottom : .leading, content: {
            
            // Since Tab Bar hide option is not avaible so we cant use native tab bar in macOS...
            
            #if os(iOS)
            TabView(selection: $selectedTab){
                 
                HomeMenuView().modifier(NavigationModifier())
                .tag("Lessons")
                .tag(0)
                .ignoresSafeArea(.all, edges: .all)
             
                LevelView().modifier(NavigationModifier())
                .id(self.firstTabReset)
                .tag("Lessons")
                .ignoresSafeArea(.all, edges: .all)
            
                QuizMenuView().modifier(NavigationModifier())
                .id(self.firstTabReset)
                .tag("Quiz")
                .ignoresSafeArea(.all, edges: .all)
                
                Color.pink.tag("Info")
                    .ignoresSafeArea(.all, edges: .all)
            }
            
            #else
            ZStack{
                
                // Switch case for changing views...
                switch(selectedTab){
                case "Home": Color.red
                case "Lessons": Color.blue
                case "Quiz": Color.yellow
                case "Info": Color.pink
                default: Color.clear
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            #endif
            
            if  self.isIpadAndMacOS() {
                
                VStack(spacing: 10){
                    InsideTabBarItems(selectedTab: $selectedTab)
                    Spacer()
                }
                .background(colorScheme == .dark ? Color.black : Color.white)
            }
            else{
                // Custom tab Bar....
                HStack(spacing: 0){
                    InsideTabBarItems(selectedTab: $selectedTab)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(colorScheme == .dark ? Color.black : Color.white)
            }
        })
        .ignoresSafeArea(.all, edges: self.isIphone() ? .bottom : .all)
        .frame(width: self.isIpadAndIphone() ? nil : getScreen().width / 1.6,
               height: self.isIpadAndIphone() ? nil : getScreen().height - 150)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

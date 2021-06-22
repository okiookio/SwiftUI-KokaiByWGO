//
//  InsideTabBarItems.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-17.
//

import SwiftUI

struct InsideTabBarItems: View {
    @Binding var selectedTab: String
    
    var body: some View{
        
        Group{
            
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 45, height: 45)
                .padding(.horizontal)
                .padding(.top, self.isIphone() ? 0 : 35)
                .padding(.bottom, self.isIphone() ? 0 : 15)
            
            TabBarButton(image: "house", title: "Home", selectedTab: $selectedTab)
            TabBarButton(image: "book", title: "Lessons", selectedTab: $selectedTab)
            TabBarButton(image: "questionmark.square", title: "Quiz", selectedTab: $selectedTab)
            TabBarButton(image: "info.circle", title: "Info", selectedTab: $selectedTab)
        }
    }
}

//
//  TabBarButton.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-17.
//

import SwiftUI

struct TabBarButton: View {
    
    var image: String
    var title: String
    @Binding var selectedTab: String
    
    var body: some View{
        
        Button(action: {
            withAnimation(.easeInOut){selectedTab = title}
        }, label: {
            VStack(spacing: 6){ 
                Image(systemName: image)
                    .font(.system(size: isIphone() ? 30 : 25))
                    // For Dark Mode Adoption....
                    .foregroundColor(selectedTab == title ? .white : .primary)
                
                Text(title)
                    .font(.caption)
                    .fontWeight(.semibold)
                    // For Dark Mode Adoption....
                    .foregroundColor(selectedTab == title ? .white : .primary)
            }
            .padding(.bottom,8)
            // Total Four Tabs...
            .frame(width: self.isIphone() ? (self.getScreen().width - 75) / 4 : 100, height: 55 + self.getSafeAreaBottom())
            .contentShape(Rectangle())
            // Bottom Up Effect....
            // if iPad Or Mac OS Moving Effect will be from left...
            .background(
                Color("TabbarActiveBackground")
                    .offset(
                        x: selectedTab == title ? 0 : self.isIphone() ? 0 : -100,
                        y: selectedTab == title ? 0 : self.isIphone() ? 100 : 0
                    )
            )
        })
        .buttonStyle(PlainButtonStyle())
    }
}
 

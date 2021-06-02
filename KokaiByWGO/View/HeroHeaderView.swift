//
//  HeroHeaderView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-05-31.
//

import SwiftUI

struct HeroHeaderView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
   
    var body: some View {
        // MARK: - HEADER
        HStack(spacing: 10) {
          // TITLE
          Text("Word")
            .font(.system(.largeTitle, design: .rounded))
            .fontWeight(.heavy)
            .padding(.leading, 4)
          
          Spacer()
   
          // Note: - SCREEN MODE ICON
          ScreenModeActionButton()
          
        } //: HSTACK
        .padding()
        .foregroundColor(.blue)
    }
}

struct HeroHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeroHeaderView()
            .previewLayout(.fixed(width: 375, height: 80))
    }
}

//
//  ScreenModeActionButton.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-02.
//

import SwiftUI

struct ButtonModeDarkAndLightAction: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    var body: some View {
        Button(action: {
          // TOGGLE APPEARANCE
          isDarkMode.toggle()
        }, label: {
          Image(systemName: isDarkMode ? "moon.circle.fill" :  "moon.circle")
            .resizable()
            .frame(width: 24, height: 24)
            .font(.system(.title, design: .rounded))
        })
    }
}

struct ScreenModeActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ButtonModeDarkAndLightAction()
    }
}

//
//  SettingActionButton.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-02.
//

import SwiftUI

struct SettingActionButton: View {
    var body: some View {
        Button(action: {
          print("Setting")
        }) {
          Image(systemName: "gearshape")
            .font(.title2)
            .foregroundColor(.accentColor)
        }
    }
}

struct SettingActionButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingActionButton()
    }
}

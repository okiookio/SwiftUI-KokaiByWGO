//
//  BlankView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-05-31.
//

import SwiftUI

struct BlankView: View {
    // MARK: - PROPERTY
    var backgroundColor: Color
    var backgroundOpacity: Double
    
    // MARK: - BODY
    
    var body: some View {
      VStack {
        Spacer()
      }
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
      .background(backgroundColor)
      .opacity(backgroundOpacity)
      .blendMode(.overlay)
      .edgesIgnoringSafeArea(.all)
    }
}

struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView(backgroundColor: Color.black, backgroundOpacity: 0.3)
          .background(BackgroundImageView())
          .background(backgroundGradient.ignoresSafeArea(.all))
    }
}

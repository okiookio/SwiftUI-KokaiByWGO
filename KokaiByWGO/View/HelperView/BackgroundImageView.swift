//
//  BackgroundImageView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-05-31.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        Image("background")
          .antialiased(true)
          .resizable()
          .scaledToFill()
          .ignoresSafeArea(.all)
    }
}

struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView()
    }
}

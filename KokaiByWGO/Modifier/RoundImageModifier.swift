//
//  RoundImageModifier.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-05-28.
//

import SwiftUI

struct RoundImageModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
        .frame(width: 80, height: 80)
        .clipShape(
          RoundedRectangle(cornerRadius: 12)
        )
  }
}

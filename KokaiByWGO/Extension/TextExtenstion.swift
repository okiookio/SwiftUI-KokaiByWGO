//
//  TextExtenstion.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-21.
//

import SwiftUI

extension Text {
  func scoreLabelStyle() -> Text {
    self
      .foregroundColor(Color.white)
      .font(.system(size: 10, weight: .bold, design: .rounded))
  }
  
  func scoreNumberStyle() -> Text {
    self
      .foregroundColor(Color.white)
      .font(.system(.title, design: .rounded))
      .fontWeight(.heavy)
  }
    
    func scoreResultStyle() -> Text {
      self
        .foregroundColor(Color("crownColor"))
        .font(.system(.title, design: .rounded))
        .fontWeight(.heavy)
    }
}

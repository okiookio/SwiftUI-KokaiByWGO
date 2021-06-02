//
//  CenterModifier.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-05-26.
//

import SwiftUI

struct CenterModifier: ViewModifier {
  func body(content: Content) -> some View {
    HStack {
      Spacer()
      content
      Spacer()
    }
  }
}

struct InputLabelModifier: ViewModifier {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    func body(content: Content) -> some View {
    content
        .foregroundColor(isDarkMode ? Color.pink : Color.pink)
        .font(.system(size: 13, weight: .medium, design: .rounded))
        .padding(0)
    }
}

struct InputFieldModifier: ViewModifier {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    func body(content: Content) -> some View {
    content
        .foregroundColor(.pink)
        .font(.system(size: 18, weight: .bold, design: .rounded))
        .padding()
        .background(
          isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
        )
        .cornerRadius(7)
    }
}

// MARK: - TAB MODIFIER
struct TabActiveModifier: ViewModifier {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    func body(content: Content) -> some View {
    content
        .foregroundColor(.pink)
        .font(.system(size: 24, weight: .bold, design: .rounded))
        .padding()
        .background(
          isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
        )
        .cornerRadius(10)
    }
}

struct TabInactiveModifier: ViewModifier {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    func body(content: Content) -> some View {
    content
        .font(.system(size: 24, weight: .bold, design: .rounded))
        .padding()
        .background(Color.gray.opacity(0.5))
        .cornerRadius(10)
    }
}

// MARK: - BUTTON

struct OkButtonModifier: ViewModifier {
    @Binding var word: String
    
  func body(content: Content) -> some View {
    content
        .padding()
        .foregroundColor(.white)
        .background(!word.isEmpty ? Color.pink : Color.gray)
        .cornerRadius(10)
  }
}

struct CancelButtonModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
        .padding()
        .foregroundColor(.white)
        .background(Color.gray)
        .cornerRadius(10)
  }
}

struct IconButtonModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
        .scaledToFit()
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
        .padding(7)
        .frame(width: 50, height: 50, alignment: .center)
  }
}
 

struct AlphabetModifier: ViewModifier {
  func body(content: Content) -> some View {
    content 
        .scaledToFit()
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
        .padding(7)
  }
}

// MARK: - typeing
struct TypingListModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
        .frame(width: 40, height: 40, alignment: .center)
  }
}

struct TypingBorderModifier: ViewModifier {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    func body(content: Content) -> some View {
    content
        .frame(height: 60, alignment: .center)
        .padding(.horizontal, 7)
        .background(Color.gray.opacity(0.5))
        .cornerRadius(10)
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
        
    }
}
 
 // Remark -: Card View
struct SymbolModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .foregroundColor(Color.white)
      .font(.system(size: 128))
      .shadow(color: Color(UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)), radius: 12, x: 0, y: 0)
  }
}

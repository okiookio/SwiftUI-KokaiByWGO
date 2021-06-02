//
//  InputItemView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-05-31.
//

import SwiftUI 

struct SheetTypingView: View {
    // MARK: - PROPERTY
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    @Binding var isShowInputItemView: Bool
    @Binding var spellingImages: [String]
     
    @State var selectedTab: CustomTab = .showAlphabet 
    
    // MARK: - BODY
    
    var body: some View {
      VStack {
        Spacer()
        VStack(spacing: 16) { 
            // TAG: - tab control 
            //: CUSTOM TAB
            CustomTabSelectionView(isShowInputItemView: $isShowInputItemView, selectedTab: $selectedTab, spellingImages: $spellingImages)
            // TAG : - tab control 
        } //: VSTACK
        .padding(.horizontal)
        .padding(.vertical, 20)
        .background(
          isDarkMode ? Color(UIColor.secondarySystemBackground) : Color.white
        )
        .cornerRadius(16)
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.65), radius: 24)
        .frame(maxWidth: 640)
      } //: ZSTACK
      .padding(2)
    }
}

// MARK: - PREVIEW
struct InputItemView_Previews: PreviewProvider {
    static var previews: some View {
        SheetTypingView(isShowInputItemView: .constant(false), spellingImages: .constant([]))
            .previewDevice("iPhone 12 Pro")
            .background(Color.gray.edgesIgnoringSafeArea(.all))
    }
}

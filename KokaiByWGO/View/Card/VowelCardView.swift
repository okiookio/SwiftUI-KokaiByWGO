//
//  VowelCardView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-03.
//

import SwiftUI

struct VowelCardView: View, Identifiable {
  // MARK: - PROPERTIES
  let id = UUID()
  var vowel: VowelModel
  
  // MARK: - BODY
  var body: some View {
    VStack {
        Image(vowel.image)
          .resizable()
          .cornerRadius(24)
          .scaledToFit()
            .frame(maxWidth:  getScreen().height * 0.8, maxHeight: getScreen().height * 0.6)
        
        Spacer()
            VStack {
                CardInfoView(infoHeader: "Thai Pronounce", infoDetail: vowel.vowelThai)
                CardInfoView(infoHeader: "English Pronounce", infoDetail: vowel.vowelEnglish)
                CardInfoView(infoHeader: "RTGSInitial", infoDetail: vowel.writing_pattern)
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .background(Color.gray)
            .cornerRadius(4)
            //: VSTACK
    }
    .edgesIgnoringSafeArea(.top)
    
    //: VSTACK
  }
}

struct VowelCardView_Previews: PreviewProvider {
  
  static var previews: some View {
    VowelCardView(vowel: kVowels[0])
      //.previewLayout(.fixed(width: 375, height: 600))
  }
}

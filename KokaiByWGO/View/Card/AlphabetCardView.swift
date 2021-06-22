//
//  CardView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-02.
//

import SwiftUI

struct AlphabetCardView: View, Identifiable {
    // MARK: - PROPERTIES
  let id = UUID()
  var alphabet: AlphabetModel
  
  // MARK: - BODY
  var body: some View {
    VStack {
        Image(alphabet.image)
          .resizable()
          .cornerRadius(24)
          .scaledToFit()
            .frame(maxWidth:  getScreen().height * 0.8, maxHeight: getScreen().height * 0.6)
        
        VStack{
            CardInfoView(infoHeader: "Pronounce", infoDetail: alphabet.vowelEnglish)
            CardInfoView(infoHeader: "Class", infoDetail: alphabet.AlphabetClass)
            CardInfoView(infoHeader: "RTGSInitial", infoDetail: alphabet.RTGSInitial)
            CardInfoView(infoHeader: "RTGSInitial", infoDetail: alphabet.RTGSFinal)
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background(Color.gray)
        .cornerRadius(4)
        .padding(.bottom, 2)
        Spacer()
    }
    .modifier(ScreenModifier())
    //: VSTACK
  }
}

struct CardView_Previews: PreviewProvider {
  
  static var previews: some View {
    AlphabetCardView(alphabet: kAlphabets[0])
      //.previewLayout(.fixed(width: 375, height: 600))
  }
}


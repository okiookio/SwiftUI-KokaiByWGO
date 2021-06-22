//
//  SentenceCardView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-15.
//

import SwiftUI

struct SentenceCardView: View, Identifiable {
  // MARK: - PROPERTIES
    let id = UUID()
    var sentence: SentenceModel
    
    var body: some View {
        VStack {
            Image("success")
              .resizable()
              .cornerRadius(24)
              .scaledToFit()
              .frame(minWidth: 0, maxWidth: .infinity)
            
            Spacer()
            Text(sentence.sentence_text)
                .font(.title)
                //: VSTACK
        }
        .background(Color.white)
        .frame(width: self.getScreen().width, height: (self.getScreen().height-50) / 3 )
        
        
        
    }
}
/*
struct sentenceCardView_Previews: PreviewProvider {
    static var previews: some View {
        sentenceCardView()
    }
}*/

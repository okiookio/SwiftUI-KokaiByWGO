//
//  AlphabetListItemView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-05-26.
//

import SwiftUI

struct AlphabetListItemView: View {
    // MARK: - PROPERTIES
    let alphabet: AlphabetModel
    // MARK: - BODY
    var body: some View {
        ImageCardButton(imageName: alphabet.image) {
            playSound(sound: alphabet.sound, type: "mp3")
            feedback.notificationOccurred(.success)
        }
    }
}

struct AlphabetListItemView_Previews: PreviewProvider {
    static var previews: some View {
        AlphabetListItemView(alphabet: kAlphabets[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}


       /*HStack(alignment: .center, spacing: 16) {
           Image(alphabet.image)
           .resizable()
           .scaledToFill()
           .frame(width: 120, height: 175)
           .clipShape(
             RoundedRectangle(cornerRadius: 12)
           )
         
         VStack(alignment: .leading, spacing: 8) {
           HStack {
               Text(alphabet.alphabet)
                 .font(.title2)
                 .fontWeight(.heavy)
                   .foregroundColor(.accentColor)
               
               Text(alphabet.vowelThai)
                 .font(.footnote)
                 .multilineTextAlignment(.leading)
                 .lineLimit(2)
                 .padding(.trailing, 8)
           }
           Text(alphabet.vowelEnglish)
             .font(.footnote)
             .multilineTextAlignment(.leading)
             .lineLimit(2)
             .padding(.trailing, 8)
           
           AlphabetClassView(alphabetClass: alphabet.AlphabetClass)
           
         } //: VSTACK
       } //: HSTACK
       */

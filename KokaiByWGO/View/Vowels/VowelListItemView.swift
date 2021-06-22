//
//  VowelListItemView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-05-26.
//

import SwiftUI

struct VowelListItemView: View {
    // MARK: - PROPERTIES
    let vowel: VowelModel
    // MARK: - BODY
    
    var body: some View {
        ButtonImageCard(imageName: vowel.image) {
            playSound(sound: vowel.sound, type: "mp3")
        }
    }
}

struct VowelListItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        VowelListItemView(vowel: kVowels[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}


/*
 HStack(alignment: .center, spacing: 16) {
     Image(vowel.image)
     .resizable()
     .scaledToFill()
     .frame(width: 80, height: 115)
     .clipShape(
       RoundedRectangle(cornerRadius: 12)
     )
   
   VStack(alignment: .leading, spacing: 8) {
     HStack {
         Text(vowel.vowelThai)
           .font(.title2)
           .fontWeight(.heavy)
             .foregroundColor(.accentColor)
         
         Text(vowel.vowelEnglish)
           .font(.footnote)
           .multilineTextAlignment(.leading)
           .lineLimit(2)
           .padding(.trailing, 8)
     }
     Text(vowel.writing_pattern)
       .font(.footnote)
       .multilineTextAlignment(.leading)
       .lineLimit(2)
       .padding(.trailing, 8)
     
     //VowelClassView(vowelClass: vowel.VowelClass)
     
   } //: VSTACK
 } //: HSTACK
 */

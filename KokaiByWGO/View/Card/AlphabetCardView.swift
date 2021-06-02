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
  
  var body: some View {
    Image(alphabet.image)
      .resizable()
      .cornerRadius(24)
      .scaledToFit()
      .frame(minWidth: 0, maxWidth: .infinity)
      .overlay(
        VStack(alignment: .center, spacing: 12) {
            /*HStack {
                Text(alphabet.vowelThai)
                .foregroundColor(Color.white)
                .font(.largeTitle)
                .fontWeight(.bold)
                .shadow(radius: 1)
                .padding(.horizontal, 18)
                .padding(.vertical, 4)
                .overlay(
                  Rectangle()
                    .fill(Color.white)
                    .frame(height: 1),
                  alignment: .bottom
                )
              Text(alphabet.vowelEnglish)
                .foregroundColor(Color.white)
                .font(.largeTitle)
                .fontWeight(.bold)
                .shadow(radius: 1)
                .padding(.horizontal, 18)
                .padding(.vertical, 4)
                .overlay(
                  Rectangle()
                    .fill(Color.white)
                    .frame(height: 1),
                  alignment: .bottom
                )
            }*/
            
            Text(alphabet.meaning)
              .foregroundColor(Color.black)
              .font(.footnote)
              .fontWeight(.bold)
              .frame(minWidth: 85)
              .padding(.horizontal, 10)
              .padding(.vertical, 5)
              .background(
                Capsule().fill(Color.white)
              )
        }
        .frame(minWidth: 280)
        .padding(.bottom, 30),
        alignment: .bottom
      )
  }
}

struct CardView_Previews: PreviewProvider {
  
  static var previews: some View {
    AlphabetCardView(alphabet: kAlphabets[0])
      .previewLayout(.fixed(width: 375, height: 600))
  }
}


//
//  HeaderView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-05-28.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - PROPERTIES
    let alphabet: AlphabetModel
    @State private var isAnimatingImage: Bool = false
    
    
    // MARK: - BODY
    var body: some View {
        ZStack {
          LinearGradient(gradient: Gradient(colors: [Color("ColorBlueberryLight"), Color("ColorBlueberryDark")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            HStack {
                Spacer()
                Image(alphabet.image)
                  .resizable()
                  .scaledToFit()
                  .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                  .padding(.vertical, 20)
                  .scaleEffect(isAnimatingImage ? 1.0 : 0.6)
                Spacer()
                VStack {
                    Text(alphabet.vowelThai)
                      .font(.largeTitle)
                      .fontWeight(.heavy)
                      .multilineTextAlignment(.center)
                      .padding(.vertical, 8)
                      .foregroundColor(.primary)
                      .background(
                        Color.accentColor
                          .frame(height: 6)
                          .offset(y: 24))
                    Text(alphabet.vowelEnglish)
                      .font(.title)
                      .multilineTextAlignment(.center)
                      .padding(.vertical, 8)
                      .foregroundColor(.primary)
                      
                    Text(alphabet.meaning)
                      .font(.title)
                      .multilineTextAlignment(.center)
                      .padding(.vertical, 8)
                      .foregroundColor(.primary)
                      
                }
                Spacer()
            }
          
        } //: ZSTACK
        .frame(height: 200)
        .onAppear() {
          withAnimation(.easeOut(duration: 0.5)) {
            isAnimatingImage = true
          }
        }
    }
}

// MARK: - PREVIEW
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(alphabet: kAlphabets[0])
    }
}

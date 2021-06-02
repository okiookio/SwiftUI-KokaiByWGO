//
//  AlphabetDetailView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-05-26.
//

import SwiftUI

struct AlphabetDetailView: View {
    // MARK: - PROPERTIES
    let alphabet: AlphabetModel
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
          ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
              // HEADER
                HeaderView(alphabet: alphabet)
                VStack {
                    HStack {
                        ScrollView {
                            VStack(spacing: 20) {
                                ForEach(kAlphabets) { alphabet in
                                    Image(alphabet.image.replacingOccurrences(of: "alphabet_", with: "C"))
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 100)
                                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                                        .padding(7)
                                }
                            }
                        }
                        .frame(width: 120, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        
                        ScrollView {
                            VStack(spacing: 20) {
                                ForEach(kVowels) { vowel in
                                    Image(vowel.image.replacingOccurrences(of: "sara_", with: "S"))
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 100)
                                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                                        .padding(7)
                                }
                            }
                        }
                        .frame(width: 120, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        ScrollView {
                            VStack(spacing: 20) {
                                ForEach(1..<4) {
                                    Image("T0\($0)")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 100)
                                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                                        .padding(7)
                                }
                            }
                        }
                        .frame(width: 120, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                    } //: HStack
                } //: VStack

                
            } //: VSTACK
            .navigationBarTitle(alphabet.vowelThai, displayMode: .inline)
            .navigationBarHidden(true)
          } //: SCROLL
          .edgesIgnoringSafeArea(.top)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        //: NAVIGATION
        
        
        
        
 
        /*
        HStack {
            Image(alphabet.image)
            .resizable()
            .scaledToFill()
            .frame(width: 120, height: 175)
            .clipShape(
              RoundedRectangle(cornerRadius: 12)
            )
            VStack {
             Text("Test word")
                HStack {
                    Image("C01")
                    .resizable()
                    .scaledToFill()
                    .modifier(RoundImageModifier())
                    
                    Image("S01")
                    .resizable()
                    .scaledToFill()
                    .modifier(RoundImageModifier())
                    
                    Image("T01")
                    .resizable()
                    .scaledToFill()
                    .modifier(RoundImageModifier())
                    
                } //: HStack
            } //: VStack
        }//: HStack
        Text("AlphabetDetailView")
        Spacer()
 */
    }
}

// MARK: - PREVIEW
struct AlphabetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlphabetDetailView(alphabet: kAlphabets[1])
    }
}

/*
 NavigationView {
   ScrollView(.vertical, showsIndicators: false) {
     VStack(alignment: .center, spacing: 20) {
       // HEADER

     } //: VSTACK
     .navigationBarTitle(fruit.title, displayMode: .inline)
     .navigationBarHidden(true)
   } //: SCROLL
   .edgesIgnoringSafeArea(.top)
 } //: NAVIGATION
 .navigationViewStyle(StackNavigationViewStyle())
}
 
 */

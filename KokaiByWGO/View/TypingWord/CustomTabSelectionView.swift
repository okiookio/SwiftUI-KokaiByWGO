//
//  TabAlphabets.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-05-31.
//

import SwiftUI

struct CustomTabSelectionView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    @ObservedObject var typingVM = TypingVM()
    
    @Binding var isShowInputItemView: Bool
    @Binding var selectedTab: CustomTab
    @Binding var spellingImages: [String]
    
    let tabs: [CustomTab] = [.showAlphabet, .showVowel,.showTone]
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    var body: some View {
        
        VStack {
            // MARK: - SPELLING IMAGES
            HStack {
                SpellingImagesListView(spellingImages: $spellingImages)
                Spacer()
                //: REMOVE SPELLING IMAGE
                IconActionButton(imageName: "delete.left.fill"){
                    if spellingImages.count > 0 {
                        spellingImages.removeLast()
                        typingVM.removeLastCharector()
                    }
                }
            }//: HSTACK
            // MARK: - ACTION BOTTON
            HStack {
                //: ADD SPELLING ITEM TO FORM
                TextWithIconActionButton(imageName: "plus.circle", text: text._add){
                    isShowInputItemView.toggle()
                }
                
                TextWithIconActionButton(imageName: "xmark.circle", text: text._clear){
                    spellingImages = []
                    typingVM.typing = []
                    isShowInputItemView.toggle()
                }
            }
            
            // MARK: - CUSTOM TAB
            HStack {
                ForEach(tabs, id: \.self) { tab in
                        Button(action: {
                            selectedTab = tab
                            
                        }, label: {
                            Text(tab.rawValue)
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                        })
                        .foregroundColor(
                            (selectedTab.rawValue == tab.rawValue) ? .pink : .gray
                        )
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .padding()
                        .background(
                            isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
                        )
                        .cornerRadius(10)
                        .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke((selectedTab.rawValue == tab.rawValue) ? Color.pink : Color.gray, lineWidth: 4)
                            )
                        
                    
                } //: LOOP TAB MENU
            } //: HSTACK
            
            // MARK: - TAB CONDITIONS
            if (selectedTab == .showAlphabet) {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(kAlphabets) { alphabet in
                            ImageCardButton(imageName: alphabet.image.replacingOccurrences(of: "alphabet_", with: "C")) {
                                let selectedCode = alphabet.image.replacingOccurrences(of: "alphabet_", with: "C")
                                spellingImages.append(selectedCode)
                                typingVM.add(selectedCode)
                            }
                             
                        } //: LOOP
                    }
                    .padding(.horizontal)
                    //: LazyVGrid
                }
                .frame(minHeight: 280,maxHeight: 400)
            } else if (selectedTab == .showVowel) {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(kVowels) { vowel in
                            ImageCardButton(imageName: vowel.image.replacingOccurrences(of: "sara_", with: "S")) {
                                let selectedCode = vowel.image.replacingOccurrences(of: "sara_", with: "S")
                                spellingImages.append(selectedCode)
                                typingVM.add(selectedCode)
                            }
                        } //: LOOP
                    }
                    .padding(.horizontal)
                    //: LazyVGrid
                }
                .frame(minHeight: 280,maxHeight: 400)
            } else if (selectedTab == .showTone) {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(1 ..< 5) { tone in
                            ImageActionButton(imageName: "T0\(tone)") {
                                let selectedCode = "T0\(tone)"
                                spellingImages.append(selectedCode)
                                typingVM.add(selectedCode)
                            }
                        } //: LOOP
                    }
                    .padding(.horizontal)
                    //: LazyVGrid
                }
                .frame(minHeight: 280,maxHeight: 400)
            }
            //: selectedTab Condition
        }
        .onAppear(){
            typingVM.typing = spellingImages
        }
        //: VSTACK
    }
}

struct CustomTabSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabSelectionView(isShowInputItemView: .constant(false), selectedTab: .constant(CustomTab.showAlphabet), spellingImages: .constant([]))
    }
}

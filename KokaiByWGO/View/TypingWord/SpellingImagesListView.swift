//
//  SpellingImagesListView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-01.
//

import SwiftUI

struct SpellingImagesListView: View {
    
    @Binding var spellingImages: [String]
    
    var body: some View {
        HStack {
            ScrollView (.horizontal, showsIndicators: false) {
                ScrollViewReader { scrollView in
                 HStack {
                    ForEach(spellingImages, id: \.self) { selected in
                        Image(selected)
                            .resizable()
                            .modifier(TypingListModifier())
                            
                    }
                    .onChange(of: spellingImages.count) { _ in
                        withAnimation {
                            scrollView.scrollTo(spellingImages.count - 1)
                        }
                    }
                 }
                }
            }
            .modifier(TypingBorderModifier())
            //: SCROLLVIEW
        }//: HSTACK
    }
}

struct SpellingImagesListView_Previews: PreviewProvider {
    static var previews: some View {
        SpellingImagesListView(spellingImages: .constant([]))
    }
}

//
//  VowelDetailView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-05-26.
//

import SwiftUI

struct VowelDetailView: View {
    // MARK: - PROPERTIES
    let vowel: VowelModel
    // MARK: - BODY
    
    var body: some View {
        Text("VowelDetailView")
    }
}

// MARK: - PREVIEW
struct VowelDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VowelDetailView(vowel: kVowels[1])
    }
}

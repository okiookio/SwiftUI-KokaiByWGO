//
//  AlphabetGridItemView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-05-26.
//

import SwiftUI

struct AlphabetGridItemView: View {
    // MARK: - PROPERTIES
    let alphabet: AlphabetModel
    // MARK: - BODY
    
    var body: some View {
        ButtonImageCard(imageName: alphabet.image.replacingOccurrences(of: "alphabet_", with: "C")) {
            playSound(sound: alphabet.sound, type: "mp3")
        }
    }
}

struct AlphabetGridItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        AlphabetGridItemView(alphabet: kAlphabets[1])
    }
}

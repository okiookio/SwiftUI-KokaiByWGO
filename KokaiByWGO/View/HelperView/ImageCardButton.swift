//
//  ImageCardButton.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-02.
//

import SwiftUI

struct ImageCardButton: View {
    let imageName: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action , label: {
            Image(imageName)
                .resizable()
                .modifier(AlphabetModifier())
        })
    }
}

struct ImageCardButton_Previews: PreviewProvider {
    static var previews: some View {
        ImageCardButton(imageName: "T01"){
            print("Tapped")
        }
    }
}

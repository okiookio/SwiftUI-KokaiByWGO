//
//  ImageActionButton.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-05-31.
//

import SwiftUI

struct ImageActionButton: View {
    let imageName: String?
    var action: () -> Void 
    
    var body: some View {
        Button(action: action , label: {
            Image(imageName!)
                .resizable()
                .scaledToFit()
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                .padding(7)
        })
    }
}

struct ImageActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ImageActionButton(imageName: "T01"){
            print("Tapped")
        }
    }
}

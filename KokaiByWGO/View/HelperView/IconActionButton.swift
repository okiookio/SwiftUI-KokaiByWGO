//
//  IconActionButton.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-01.
//

import SwiftUI

struct IconActionButton: View {
    let imageName: String?
    var action: () -> Void
    
    var body: some View {
        Button(action: action , label: {
            Image(systemName: imageName!)
                .resizable()
                .modifier(IconButtonModifier())
        })
        
        
    }
}

struct IconActionButton_Previews: PreviewProvider {
    static var previews: some View {
        IconActionButton(imageName: "delete.left.fill"){
            print("Tapped")
        }
    }
}

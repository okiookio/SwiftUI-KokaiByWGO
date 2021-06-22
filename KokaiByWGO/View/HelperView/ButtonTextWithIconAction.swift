//
//  TextWithIconActionButton.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-01.
//

import SwiftUI

struct ButtonTextWithIconAction: View {
    let imageName: String?
    let text: String?
    var action: () -> Void
    
    var body: some View {
        Button(action: action , label: {
            Image(systemName: imageName!)
              .font(.system(size: 20, weight: .semibold, design: .rounded))
            Text(text!)
              .font(.system(size: 16, weight: .bold, design: .rounded))
        })
        .modifier(clipShapeButtonModifier())
    }
}

struct TextWithIconActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ButtonTextWithIconAction(imageName: "delete.left.fill", text: "Delete"){
            print("Tapped")
        }
    }
}

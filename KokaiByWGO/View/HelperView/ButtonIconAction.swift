//
//  IconActionButton.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-01.
//

import SwiftUI

struct ButtonIconAction: View {
    @State var imageName: String?
    @State var frameSize: CGFloat = 50
    var action: () -> Void
    
    var body: some View {
        Button(action: action , label: {
            Image(systemName: imageName!)
                .resizable()
                .foregroundColor(Color.white)
                .shadow(color: Color(UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)), radius: 12, x: 0, y: 0)
                .frame(width: frameSize, height: frameSize, alignment: .center)
        })
        
        
    }
}

struct IconActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ButtonIconAction(imageName: "delete.left.fill"){
            print("Tapped")
        }
    }
}

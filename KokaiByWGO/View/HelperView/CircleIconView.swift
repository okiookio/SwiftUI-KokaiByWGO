//
//  CircleIconView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-17.
//

import SwiftUI

struct CircleIconView: View {
    var iconName = "arrowshape.turn.up.right"
    var circleIconColor = Color("ColorBackground1")
    var body: some View {
        Image(systemName: iconName)
            .font(.system(size: 20, weight: .heavy, design: .rounded))
            .foregroundColor(.white)
            .padding()
            .background(
                ZStack{
                    circleIconColor
                    Circle()
                        .stroke(Color.white.opacity(0.6), lineWidth: 5)
                 }
                .rotationEffect(.init(degrees: -90))
            )
            .clipShape(Circle())
            
    }
}

struct CircleIconView_Previews: PreviewProvider {
    static var previews: some View {
        CircleIconView(circleIconColor: Color("ColorBackground1"))
    }
}

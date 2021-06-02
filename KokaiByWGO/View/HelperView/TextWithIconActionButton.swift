//
//  TextWithIconActionButton.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-01.
//

import SwiftUI

struct TextWithIconActionButton: View {
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
        .foregroundColor(.white)
        .padding(.horizontal, 20)
        .padding(.vertical, 15)
        .background(
          LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .leading, endPoint: .trailing)
            .clipShape(Capsule())
        )
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 8, x: 0.0, y: 4.0)
    }
}

struct TextWithIconActionButton_Previews: PreviewProvider {
    static var previews: some View {
        TextWithIconActionButton(imageName: "delete.left.fill", text: "Delete"){
            print("Tapped")
        }
    }
}


/*
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
 
 
 
 Button(action: {
   showNewTaskItem = true
   playSound(sound: "sound-ding", type: "mp3")
   feedback.notificationOccurred(.success)
 }, label: {
   Image(systemName: "plus.circle")
     .font(.system(size: 30, weight: .semibold, design: .rounded))
   Text("New Task")
     .font(.system(size: 24, weight: .bold, design: .rounded))
 })
 .foregroundColor(.white)
 .padding(.horizontal, 20)
 .padding(.vertical, 15)
 .background(
   LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .leading, endPoint: .trailing)
     .clipShape(Capsule())
 )
 .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 8, x: 0.0, y: 4.0)
 */

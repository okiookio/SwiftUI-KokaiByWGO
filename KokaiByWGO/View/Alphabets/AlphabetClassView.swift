//
//  AlphabetClassView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-05-26.
//

import SwiftUI

struct AlphabetClassView: View {
    @State var alphabetClass: String
    
    var body: some View {
        Text(alphabetClass)
    }
}

struct AlphabetClassView_Previews: PreviewProvider {
    static var previews: some View {
        AlphabetClassView(alphabetClass: "Class")
    }
}

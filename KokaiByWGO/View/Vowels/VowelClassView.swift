//
//  VowelClassView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-05-26.
//

import SwiftUI

struct VowelClassView: View {
    @State var vowelClass: String
    
    var body: some View {
        Text(vowelClass)
    }
}

struct VowelClassView_Previews: PreviewProvider {
    static var previews: some View {
        VowelClassView(vowelClass: "vowelClass")
    }
}

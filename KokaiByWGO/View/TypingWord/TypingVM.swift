//
//  TypingVM.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-05-31.
//

import Foundation

class TypingVM: ObservableObject {
    @Published var typing: [String] = []
    
    func add(_ newCharector : String) {
        typing.append(newCharector)
    }
    
    func removeLastCharector(){
        if typing.count > 0 {
            typing.removeLast()
        }
    }
}

//
//  VowelModel.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-05-26.
//

import SwiftUI

struct VowelModel: Codable, Identifiable {
    let id: Int
    var image: String
    let sound: String
    let vowelThai: String
    let vowelEnglish: String
    let isShowInSoundActivity: Bool
    let soundLevelOne: String
    let soundLevelTwo: String
    let soundLevelThree: String
    let soundLevelFour: String
    let soundLevelFive: String
    let writing_pattern: String
    
    mutating func getFilename() {
        self.image = self.image + ".jpg"
    }
}


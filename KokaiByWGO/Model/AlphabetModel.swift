//
//  AlphabetModel.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-05-26.
//

import SwiftUI

struct AlphabetModel: Codable, Identifiable {
    let id: Int
    let image: String
    let sound: String
    let isShowInSoundActivity: Bool
    let alphabet: String
    let vowelThai: String
    let vowelEnglish: String
    let meaning: String
    let RTGSInitial: String
    let RTGSFinal: String
    let AlphabetClass: String
}

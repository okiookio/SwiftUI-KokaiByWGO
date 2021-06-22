//
//  Constants.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-05-31.
//
import Foundation
import SwiftUI

public let kFileRefference = "gs://my-pia-lessons.appspot.com"
public let kScreen = UIScreen.main.bounds
public let kUserDefaults = UserDefaults.standard
public let kIsSmallScreen = UIDevice.current.isSmallScreen
public let kIsUploadImage = true

var kAlphabets: [AlphabetModel] = Bundle.main.decode("Alphabets.json")
var kVowels: [VowelModel] = Bundle.main.decode("Vowels.json")
var kCurrentSentences: [SentenceModel]!


public let kMaxQuiz = 2

enum CustomTab: String {
    case showAlphabet = "Alphabets"
    case showVowel = "Vowels"
    case showTone = "Tones"
}

enum Device{
    case iPhone
    case iPad
    case macOS
}

// MARK: - UI

var backgroundGradient: LinearGradient {
    return LinearGradient(gradient: Gradient(colors: [Color("backgroundGradientStart"), Color("backgroundGradientEnd")]), startPoint: .topLeading, endPoint: .bottomTrailing)
}

var CardBackgroundGradient: LinearGradient {
    return LinearGradient(gradient: Gradient(colors: [Color("CardBackgroundStart"), Color("CardBackgroundEnd")]), startPoint: .topLeading, endPoint: .bottomTrailing)
}

var backgroundGradientButton: LinearGradient {
    return LinearGradient(gradient: Gradient(colors: [Color("backgroundGradientStart"), Color("backgroundGradientEnd")]), startPoint: .topLeading, endPoint: .bottomTrailing)
}

// MARK: - UX
let feedback = UINotificationFeedbackGenerator()



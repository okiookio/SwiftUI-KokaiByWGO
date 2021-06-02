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

let kAlphabets: [AlphabetModel] = Bundle.main.decode("Alphabets.json")
let kVowels: [VowelModel] = Bundle.main.decode("Alphabets.json")

enum CustomTab: String {
    case showAlphabet = "Alphabets"
    case showVowel = "Vowels"
    case showTone = "Tones"
}


// MARK: - UI

var backgroundGradient: LinearGradient {
  return LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
}

// MARK: - UX
let feedback = UINotificationFeedbackGenerator()



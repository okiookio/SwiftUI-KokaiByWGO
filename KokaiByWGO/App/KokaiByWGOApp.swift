//
//  KokaiByWGOApp.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-05-25.
//

import SwiftUI

@main
struct KokaiByWGOApp: App {
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    @AppStorage("SelectedLanguage") var selectedLanguage: String = "EN"
    
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}

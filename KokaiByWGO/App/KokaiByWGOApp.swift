//
//  KokaiByWGOApp.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-05-25.
//

import SwiftUI
import Firebase

@main
struct KokaiByWGOApp: App {
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    @AppStorage("SelectedLanguage") var selectedLanguage: String = "EN"
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        // Hiding Window For Only MacOS...
        #if os(iOS)
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
        #else
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
        .windowStyle(HiddenTitleBarWindowStyle())
        #endif
    }
}


/*
 // Version 1
 @main
 struct KokaiByWGOApp: App {
     @AppStorage("isDarkMode") var isDarkMode: Bool = false
     @AppStorage("SelectedLanguage") var selectedLanguage: String = "EN"
     
     init() {
         FirebaseApp.configure()
     }
     
     var body: some Scene {
         WindowGroup {
             MainView()
                 .preferredColorScheme(isDarkMode ? .dark : .light)
         }
     }
 }
 // end version 1
 
 */

/*
 
 // App File

 import SwiftUI

 @main
 struct TabBarsApp: App {
     var body: some Scene {
         
         // Hiding Window For Only MacOS...
         #if os(iOS)
         WindowGroup {
             ContentView()
         }
         #else
         WindowGroup {
             ContentView()
         }
         .windowStyle(HiddenTitleBarWindowStyle())
         #endif
     }
 }

 

 */

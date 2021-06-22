//
//  ViewExtension.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-21.
//

import SwiftUI

// Getting Screen Width...

// Since were extending View so we can use directly in swiftui body by calling the functions...

extension ViewModifier {
    func getDevice()->Device{
        #if os(iOS)
        
        // Since There is No Direct For Getting iPad OS...
        // Alternative Way...
        if UIDevice.current.model.contains("iPad"){
            return .iPad
        }
        else{
            return .iPhone
        }
        #else
        return .macOS
        #endif
    }
    
    func isIpadAndMacOS() -> Bool {
        return  getDevice() == .iPad || getDevice() == .macOS ? true : false
    }
    
    func isIpadAndIphone() -> Bool {
        return  getDevice() == .iPad || getDevice() == .iPhone ? true : false
    }
    
    func isIpad() -> Bool {
        return  getDevice() == .iPad ? true : false
    }
    
    func isIphone() -> Bool {
        return  getDevice() == .iPhone ? true : false
    }
}

extension View{
    
    func getScreen()->CGRect{
        #if os(iOS)
        return UIScreen.main.bounds
        #else
        return NSScreen.main!.visibleFrame
        #endif
    }
    
    // Safe Area Bottom..
    
    func getSafeAreaBottom()->CGFloat{
        #if os(iOS)
        return UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 10
        #else
        return 10
        #endif
    }
    
    // getting device Type....
    
    func getDevice()->Device{
        #if os(iOS)
        
        // Since There is No Direct For Getting iPad OS...
        // Alternative Way...
        if UIDevice.current.model.contains("iPad"){
            return .iPad
        }
        else{
            return .iPhone
        }
        #else
        return .macOS
        #endif
    }
    
    func isIpadAndMacOS() -> Bool {
        return  getDevice() == .iPad || getDevice() == .macOS ? true : false
    }
    
    func isIpadAndIphone() -> Bool {
        return  getDevice() == .iPad || getDevice() == .iPhone ? true : false
    }
    
    func isIpad() -> Bool {
        return  getDevice() == .iPad ? true : false
    }
    
    func isIphone() -> Bool {
        return  getDevice() == .iPhone ? true : false
    }
}


#if canImport(UIKit)
extension View {
  func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
#endif

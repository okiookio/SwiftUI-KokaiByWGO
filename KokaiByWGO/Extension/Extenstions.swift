//
//  Extenstions.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-02.
//

import Foundation
import SwiftUI

extension UITextView {
    #if targetEnvironment(macCatalyst)
    @objc(_focusRingType)
    var focusRingType: UInt {
        return 1 //NSFocusRingTypeNone
    }
    #endif
}
 
 
public extension UIDevice {
   var isSmallScreen: Bool {
       var systemInfo = utsname()
       uname(&systemInfo)
       let machineMirror = Mirror(reflecting: systemInfo.machine)
       let identifier = machineMirror.children.reduce("") { identifier, element in
           guard let value = element.value as? Int8, value != 0 else { return identifier }
           return identifier + String(UnicodeScalar(UInt8(value)))
       }
    
    switch identifier {
    case "iPhone5,1", "iPhone5,2","iPhone5,3",
         "iPhone5,4", "iPhone6,1", "iPhone6,2",
         "iPhone7,2","iPhone8,1","iPhone9,1",
         "iPhone9,3","iPhone8,4":
        return true
    default:
        return false
    }
   }
}

extension String {
   func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}


// MARK: - CardTransition
extension AnyTransition {
  static var trailingBottom: AnyTransition {
    AnyTransition.asymmetric(
      insertion: .identity,
      removal: AnyTransition.move(edge: .trailing).combined(with: .move(edge: .bottom)))
  }
  
  static var leadingBottom: AnyTransition {
    AnyTransition.asymmetric(
      insertion: .identity,
      removal: AnyTransition.move(edge: .leading).combined(with: .move(edge: .bottom)))
  }
}



//
//  CommonModifier.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-17.
//

import SwiftUI

// Remark -: Common Modifier
struct CustomShadowModifier : ViewModifier {
   func body(content: Content) -> some View {
   content
       .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 8, x: 0.0, y: 4.0)
   }
}
struct shadowModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .shadow(color: Color(UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)), radius: 12, x: 0, y: 0)
  }
}

struct clipShapeButtonModifier: ViewModifier {
    
    func body(content: Content) -> some View {
    content
        .foregroundColor(.white)
        .padding(.horizontal, 20)
        .padding(.vertical, 15)
        .background(
          LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .leading, endPoint: .trailing)
            .clipShape(Capsule())
        )
        .modifier(CustomShadowModifier())
    }
}


// MARK: - SCREEN
struct ScreenModifier: ViewModifier {
    
    func body(content: Content) -> some View {
    content
        .background(
            LinearGradient(
                gradient: .init(colors: [Color("ColorAppBackgroundLight"),Color("ColorAppBackgroundDark")]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
                      
        ) 
        .padding(.leading, isIpadAndMacOS() ? 100 : 0)
        .padding(.trailing, isIpadAndMacOS() ? 0 : 0) 
        .padding(.bottom, self.isIpadAndMacOS() ? 0 : 45)
         
    }
}

// MARK: - NAVIGATION MODIFIER
struct HiddenNavigationBarModifier: ViewModifier {
    
    func body(content: Content) -> some View {
    content
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}


struct NavigationModifier : ViewModifier {
    
    func body(content: Content) -> some View {
    content
    .navigationBarTitle("",displayMode: .inline)
    .navigationBarHidden(true)
    .navigationBarBackButtonHidden(true)
    }
}

struct NavigationBarTitleModifier : ViewModifier {
    var titleBar: String
    func body(content: Content) -> some View {
    content
        .navigationBarTitleDisplayMode(.inline)
      /*  .background(NavigationConfigurator { nc in
                        nc.navigationBar.barTintColor = .clear
                       // nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
                    })*/
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Text(titleBar)
                        .fontWeight(.heavy)
                        .font(.system(size: 40, design: .rounded))
                        .foregroundColor(Color("ColorAppBackgroundDark"))
                        .modifier(CustomShadowModifier())
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct NavigationBarIconModifier : ViewModifier {
    var isActiveIcon: Bool = false
    func body(content: Content) -> some View {
    content
        .font(.title2)
        .foregroundColor(isActiveIcon ? .primary : .accentColor)
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}

// MARK: - COMMON MODIFIER
struct CardModifier: ViewModifier {
    
    func body(content: Content) -> some View {
    content
        .foregroundColor(.white)
        .padding(.horizontal, 20)
        .padding(.vertical, 15)
        .background(
          LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .leading, endPoint: .trailing)
        )
        .cornerRadius(20)
        .modifier(CustomShadowModifier())
    }
}

// TAG: - TEXT MODIFIER

struct TextHeaderModifier: ViewModifier {
    
    func body(content: Content) -> some View {
    content
        .font(.system(size: 40,weight: .heavy, design: .rounded))
        .foregroundColor(.white)
        .modifier(CustomShadowModifier())
    }
}

struct TextSubHeaderModifier: ViewModifier {
    
    func body(content: Content) -> some View {
    content
        .font(.system(size: 30,weight: .heavy, design: .rounded))
        .foregroundColor(.white)
        .modifier(CustomShadowModifier())
    }
}

struct TextMainMenuModifier: ViewModifier {
    
    func body(content: Content) -> some View {
    content
        .font(.system(size: 30,weight: .heavy, design: .rounded))
        .foregroundColor(.white)
        .modifier(CustomShadowModifier())
    }
}

struct TextScoreModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
        .font(.system(size: 20,weight: .heavy, design: .rounded))
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color("crownColor"))
        .foregroundColor(Color.white)
  }
}


// MARK: - Auto Read
struct TextAutoReadCurrentModifier: ViewModifier {
    
    func body(content: Content) -> some View {
    content
        .font(.system(size: 50,weight: .heavy, design: .rounded))
        .multilineTextAlignment(.leading)
        .foregroundColor(.white)
        .modifier(CustomShadowModifier())
    }
}

struct TextAutoReadPreviousAndNextModifier: ViewModifier {
    
    func body(content: Content) -> some View {
    content
        .font(.system(size: 40,weight: .heavy, design: .rounded))
        .foregroundColor(.gray.opacity(0.7))
        //.shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 8, x: 0.0, y: 4.0)
    }
}

 // Remark -: FOR LEVEL VIEW
struct DisclosureGroupModifier: ViewModifier {
      func body(content: Content) -> some View {
          content
            //.offset(x: -20)
            //.padding(0)
            .font(.system(size: self.isIpadAndMacOS() ? 40 : 25, weight: .heavy, design: .rounded))
            .foregroundColor(Color("ColorAppBackgroundDark"))
            .modifier(CustomShadowModifier())
            //.background()
           //  .listRowBackground(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .leading, endPoint: .trailing))
      }
  }




// Remark -: Card View
struct SymbolModifier: ViewModifier {
   @State var fontSize: CGFloat = 128
   
 func body(content: Content) -> some View {
   content
     .foregroundColor(Color.white)
     .font(.system(size: fontSize))
    .modifier(CustomShadowModifier())
 }
}

struct CardShadowModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
        .scaledToFit()
        .modifier(shadowModifier())
        .padding(7)
  }
}


struct cornerRadiusButtonModifier: ViewModifier {
    
    func body(content: Content) -> some View {
    content
        .foregroundColor(.white)
        .padding(.horizontal, 20)
        .padding(.vertical, 15)
        .background(
          LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .leading, endPoint: .trailing)
        )
        .cornerRadius(20)
        .modifier(CustomShadowModifier())
    }
}


 // Remark -: Animation
struct loadViewEffectModifier: ViewModifier {
    func body(content: Content) -> some View {
    content
        .transition(.move(edge: .leading))
        .animation(.easeOut(duration: 0.5))
    }
}

// MARK: - BUTTON

struct OkButtonModifier: ViewModifier {
    @Binding var word: String
    
  func body(content: Content) -> some View {
    content
        .padding()
        .foregroundColor(.white)
        .background(!word.isEmpty ? Color.pink : Color.gray)
        .cornerRadius(10)
  }
}

struct HomeButtonModifier: ViewModifier {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    func body(content: Content) -> some View {
    content
        .foregroundColor(.pink)
        .font(.system(size: 24, weight: .bold, design: .rounded))
        .padding()
        .background(
          isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
        )
        .cornerRadius(10)
        .modifier(shadowModifier())
    }
}

struct IconButtonModifier: ViewModifier {
    @State var fontSize: CGFloat = 128
      
    func body(content: Content) -> some View {
      content
        .font(.system(.body, design: .rounded))
        .accentColor(Color("crownColor"))
        .frame(minWidth: 128)
        .background(
          Capsule()
            .strokeBorder(lineWidth: 1.75)
            .foregroundColor(Color("crownColor"))
        )
    }
}


// MARK: - typeing
struct TypingListModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
        .modifier(shadowModifier())
        .frame(width: 40, height: 40, alignment: .center)
  }
}

struct TypingBorderModifier: ViewModifier {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    func body(content: Content) -> some View {
    content
        .frame(height: 60, alignment: .center)
        .padding(.horizontal, 7)
        .background(Color.gray.opacity(0.5))
        .cornerRadius(10)
        .modifier(shadowModifier())
        
    }
}
 
 // Remark -: TYPING MODIFIER
struct InputLabelModifier: ViewModifier {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    func body(content: Content) -> some View {
    content
        .foregroundColor(isDarkMode ? Color.pink : Color.pink)
        .font(.system(size: 13, weight: .medium, design: .rounded))
        .padding(0)
    }
}

struct InputFieldModifier: ViewModifier {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    func body(content: Content) -> some View {
    content
        .foregroundColor(.pink)
        .font(.system(size: 18, weight: .bold, design: .rounded))
        .padding()
        .background(
          isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
        )
        .cornerRadius(7)
    }
}

// MARK: - TAB MODIFIER
struct TabActiveModifier: ViewModifier {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    func body(content: Content) -> some View {
    content
        .foregroundColor(.pink)
        .font(.system(size: 24, weight: .bold, design: .rounded))
        .padding()
        .background(
          isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
        )
        .cornerRadius(10)
    }
}

struct TabInactiveModifier: ViewModifier {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    func body(content: Content) -> some View {
    content
        .font(.system(size: 24, weight: .bold, design: .rounded))
        .padding()
        .background(Color.gray.opacity(0.5))
        .cornerRadius(10)
    }
}


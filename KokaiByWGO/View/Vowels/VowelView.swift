//
//  VowelView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-05-26.
//

import SwiftUI
 
struct VowelView: View {
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    var allVowels: [VowelModel] = Bundle.main.decode("Vowels.json")
    @State private var vowels: [VowelModel] = Bundle.main.decode("Vowels.json")
    
    @State private var isGridViewActive: Bool = false
    
    @State private var gridLayout: [GridItem] = [ GridItem(.flexible()) ]
    @State private var Listcolumns: [GridItem] = [ GridItem(.flexible()) ]
    @State private var gridColumn: Int = 2
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    //: MARK - FUNCTIONS
    func listColumn() -> [GridItem]{
        var columns: Int = 3
        switch UIDevice.current.userInterfaceIdiom {
            case .phone,.unspecified, .carPlay:
                columns = 3
            case .pad:
                columns = 6
            case .tv,.mac:
                columns = 7
            @unknown default:
                columns = 3
        }
        
        return Array(repeating: .init(.flexible()), count: columns)
        /*
        #if targetEnvironment(macCatalyst)
        #else
        #endif*/
    }
    
    func gridSwitch() {
      
      gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 2)
      gridColumn = gridLayout.count
      print("Grid Number: \(gridColumn)")
      
      // TOOLBAR IMAGE
      switch gridColumn {
      case 1:
        toolbarIcon = "square.grid.2x2"
      case 2:
        toolbarIcon = "square.grid.3x2"
      case 3:
        toolbarIcon = "rectangle.grid.1x2"
      default:
        toolbarIcon = "square.grid.2x2"
      }
    }
    
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
              LazyVGrid(columns: listColumn(), alignment: .center, spacing: 10) {
                ForEach(vowels) { vowel in
                    VowelListItemView(vowel: vowel)
                } //: LOOP
              } //: GRID
              .modifier(loadViewEffectModifier())
              
            } //: SCROLL
            
            .modifier(NavigationBarTitleModifier(titleBar: text._menuVowel))
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                      Image(systemName: "arrow.backward")
                        .modifier(NavigationBarIconModifier())
                    }
                }
            }
            .toolbar {
              ToolbarItem(placement: .navigationBarTrailing) {
                HStack(spacing: 16) {
                    
                    Image(systemName: toolbarIcon)
                      .font(.title2)
                        .modifier(NavigationBarIconModifier(isActiveIcon: true))
                    if self.isIpadAndMacOS() {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                          Image(systemName: "xmark")
                              .modifier(NavigationBarIconModifier())
                        }
                    } else {
                        NavigationLink(destination: VowelFlashCardView().modifier(HiddenNavigationBarModifier())) {
                            Image(systemName: "hand.draw")
                                .modifier(NavigationBarIconModifier(isActiveIcon: false))
                        } //: LINK
                    }
                   
                } //: HSTACK
              } //: BUTTONS
            } //: TOOLBAR
            .frame(width: self.getScreen().width, height: self.getScreen().height)
            .padding(.top, isIpadAndMacOS() ? 50 : 0)
            .modifier(ScreenModifier())
        }
        .navigationViewStyle(StackNavigationViewStyle())
        //: NAVIGATION
    }
}

// MARK: - PREVIEW
struct VowelView_Previews: PreviewProvider {
    
    static var previews: some View {
        VowelView()
    }
}

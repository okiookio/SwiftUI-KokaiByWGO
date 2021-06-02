//
//  VowelView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-05-26.
//

import SwiftUI
 
struct VowelView: View {
    // MARK: - PROPERTIES
    var allVowels: [VowelModel] = Bundle.main.decode("Vowels.json")
    @State private var vowels: [VowelModel] = Bundle.main.decode("Vowels.json")
    
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
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
            VStack{
                ScrollView(.vertical, showsIndicators: false) {
                  LazyVGrid(columns: listColumn(), alignment: .center, spacing: 10) {
                    ForEach(vowels) { vowel in
                      NavigationLink(destination: VowelDetailView(vowel: vowel)) {
                          VowelListItemView(vowel: vowel)
                      } //: LINK
                    } //: LOOP
                  } //: GRID
                  .padding(10)
                  .animation(.easeIn)
                } //: SCROLL
            }
            .navigationBarTitle(text._menuVowel, displayMode: .large)
            .toolbar {
              ToolbarItem(placement: .navigationBarTrailing) {
                HStack(spacing: 16) {
                    
                    Image(systemName: toolbarIcon)
                      .font(.title2)
                      .foregroundColor(.accentColor)
                    
                    Button(action: {
                      print("Flash Card")
                    }) {
                      Image(systemName: "hand.draw")
                        .font(.title)
                        .foregroundColor(.primary)
                    }
                } //: HSTACK
              } //: BUTTONS
            } //: TOOLBAR
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


/*
 
 List {
   /*CoverImageView()
     .frame(height: 300)
     .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
   */
   ForEach(vowels) { vowel in
     NavigationLink(destination: VowelDetailView(vowel: vowel)) {
         VowelListItemView(vowel: vowel)
     } //: LINK
   } //: LOOP
   
   CreditsView()
     .modifier(CenterModifier())
 
 
 // MARK: - PROPERTIES
 var allVowels: [VowelModel] = Bundle.main.decode("Vowels.json")
 @State private var vowels: [VowelModel] = Bundle.main.decode("Vowels.json")
 
 let haptics = UIImpactFeedbackGenerator(style: .medium)
 
 @State private var isGridViewActive: Bool = false
 
 @State private var gridLayout: [GridItem] = [ GridItem(.flexible()) ]
 @State private var Listcolumns: [GridItem] = [ GridItem(.flexible()) ]
 @State private var gridColumn: Int = 2
 @State private var toolbarIcon: String = "square.grid.2x2"
 
 


 
 
 // MARK: - BODY
 var body: some View {
 
     NavigationView {
         VStack {
             Group{
                 if !isGridViewActive {
                     ScrollView(.vertical, showsIndicators: false) {
                       LazyVGrid(columns: listColumn(), alignment: .center, spacing: 10) {
                         ForEach(vowels) { vowel in
                           NavigationLink(destination: VowelDetailView(vowel: vowel)) {
                               VowelListItemView(vowel: vowel)
                           } //: LINK
                         } //: LOOP
                       } //: GRID
                       .padding(10)
                       .animation(.easeIn)
                     } //: SCROLL
                     
                     /*
                      List {
                        ForEach(vowels) { vowel in
                          NavigationLink(destination: VowelDetailView(vowel: vowel)) {
                               VowelListItemView(vowel: vowel)
                          } //: LINK
                        } //: LOOP
                        
                        CreditsView()
                          .modifier(CenterModifier())
                      } //: LIST
                      */
                     
                 } else {
                     ScrollView(.vertical, showsIndicators: false) {
                       LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                         ForEach(vowels) { vowel in
                           NavigationLink(destination: VowelDetailView(vowel: vowel)) {
                              VowelGridItemView(vowel: vowel)
                           } //: LINK
                         } //: LOOP
                       } //: GRID
                       .padding(10)
                       .animation(.easeIn)
                     } //: SCROLL
                 }
             }//: VSTACK
             .navigationBarTitle("Vowel", displayMode: .large)
             .toolbar {
               ToolbarItem(placement: .navigationBarTrailing) {
                 HStack(spacing: 16) {
                   // LIST
                   Button(action: {
                     print("List view is activated")
                     isGridViewActive = false
                     haptics.impactOccurred()
                   }) {
                     Image(systemName: "square.fill.text.grid.1x2")
                       .font(.title2)
                       .foregroundColor(isGridViewActive ? .primary : .accentColor)
                   }
                   
                   // GRID
                   Button(action: {
                     print("Grid view is activated")
                     isGridViewActive = true
                     haptics.impactOccurred()
                     gridSwitch()
                   }) {
                     Image(systemName: toolbarIcon)
                       .font(.title2)
                       .foregroundColor(isGridViewActive ? .accentColor : .primary)
                   }
                 } //: HSTACK
               } //: BUTTONS
             } //: TOOLBAR
         } //: VStack
     }
     .navigationViewStyle(StackNavigationViewStyle())
     //: NAVIGATION
 }
}
 */

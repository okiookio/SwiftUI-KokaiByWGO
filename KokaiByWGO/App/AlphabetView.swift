//
//  AlphabetView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-05-26.
//

import SwiftUI

struct AlphabetView: View {
    // MARK: - PROPERTIES
    var allAlphabets: [AlphabetModel] = Bundle.main.decode("Alphabets.json")
    @State private var alphabets: [AlphabetModel] = Bundle.main.decode("Alphabets.json")
    
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive: Bool = false
    
    @State private var gridLayout: [GridItem] = [ GridItem(.flexible()) ]
    @State private var Listcolumns: [GridItem] = [ GridItem(.flexible()) ]
    @State private var gridColumn: Int = 2
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    let alphabetClassList = ["All","High", "Middle", "Low"]
    @State private var alphabetClass: String = "All"
   
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
    
    func getAlphabetsByClass(_ AlphabetClass: String){
        var selected: String = ""
        switch (alphabetClass) {
        case "High" : selected = "high"
        case "Middle": selected = "mid"
        case "Low": selected = "low"
        default : selected = ""
        }
        if selected != "" {
            self.alphabets = allAlphabets.filter { $0.AlphabetClass == selected }
        }else {
            self.alphabets = allAlphabets
        }
    }
    
    // MARK: - BODY
    var body: some View {
        
        NavigationView {
            
            VStack {
                // MARK: - TODO PRIORITY
                Picker("Priority", selection: $alphabetClass) {
                  ForEach(alphabetClassList, id: \.self) {
                    Text($0)
                  }
                }
                .pickerStyle(SegmentedPickerStyle())
                .onChange(of: alphabetClass, perform: { value in
                    getAlphabetsByClass(alphabetClass)
                })
                //: Picker
                Group{
                    if !isGridViewActive {
                        ScrollView(.vertical, showsIndicators: false) {
                          LazyVGrid(columns: listColumn(), alignment: .center, spacing: 10) {
                            ForEach(alphabets) { alphabet in
                              NavigationLink(destination: AlphabetDetailView(alphabet: alphabet)) {
                                  AlphabetListItemView(alphabet: alphabet)
                              } //: LINK
                            } //: LOOP
                          } //: GRID
                          .padding(10)
                          .animation(.easeIn)
                        } //: SCROLL
                        
                        
                    } else {
                        ScrollView(.vertical, showsIndicators: false) {
                          LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(alphabets) { alphabet in
                              NavigationLink(destination: AlphabetDetailView(alphabet: alphabet)) {
                                 AlphabetGridItemView(alphabet: alphabet)
                              } //: LINK
                            } //: LOOP
                          } //: GRID
                          .padding(10)
                          .animation(.easeIn)
                        } //: SCROLL
                    }
                }//: VSTACK
                .navigationBarTitle(text._menuAlphabet, displayMode: .large)
                .toolbar {
                  ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                      // LIST
                      Button(action: {
                        //print("List view is activated")
                        alphabetClass = "All"
                        isGridViewActive = false
                        haptics.impactOccurred()
                      }) {
                        Image(systemName: "square.fill.text.grid.1x2")
                          .font(.title2)
                          .foregroundColor(isGridViewActive ? .primary : .accentColor)
                      }
                      
                      // GRID
                      Button(action: {
                        //print("Grid view is activated")
                        alphabetClass = "All"
                        isGridViewActive = true
                        haptics.impactOccurred()
                        gridSwitch()
                      }) {
                        Image(systemName: toolbarIcon)
                          .font(.title2)
                          .foregroundColor(isGridViewActive ? .accentColor : .primary)
                      }
                        
                        Button(action: {
                          //print("Flash Card")
                            //AlphabetFlashCardView
                        }) {
                          Image(systemName: "hand.draw")
                            .font(.title)
                            .foregroundColor(.primary)
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

// MARK: - PREVIEW
struct AlphabetView_Previews: PreviewProvider {
    
    static var previews: some View {
        AlphabetView()
    }
} 

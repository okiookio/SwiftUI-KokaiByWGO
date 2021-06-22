//
//  LevelVM.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-07.
//

import Foundation
import Firebase

class LevelVM: ObservableObject {
    @Published var levels: [LevelModel] = []
    @Published var levelName: [String:String] = [:]
    init() {
        downloadLevels()
    }
    
    func downloadLevels() {
        
        FirebaseReference(.tblLevel).getDocuments { (snapshot, error) in
            guard let snapshot = snapshot else { return }
            if !snapshot.isEmpty {
                self.levels = self.levelFromDictionary(snapshot)
            }
        }
    }
    
    
     func levelFromDictionary(_ snapshot: QuerySnapshot) -> [LevelModel] {
       
        var allLevels: [LevelModel] = []
        
        for snapshot in snapshot.documents {
            let rowData = snapshot.data()
            let levelCode = rowData["level_code"] as? String ?? ""
            let levelname = rowData["level_name"] as? String ?? ""
            
            self.levelName[levelCode] = levelname
            
            allLevels.append(
                LevelModel(
                    id: UUID(),
                    level_code : levelCode,
                    order_id : rowData["order_id"] as? Int ?? 0,
                    level_name : levelname,
                    level_description : rowData["level_description"] as? String ?? "",
                    column_chapter_per_row : rowData["column_chapter_per_row"] as? String ?? "",
                    image : rowData["image"] as? String ?? "",
                    background  : rowData["background"] as? String ?? ""
                )
            )
        }
        
        return allLevels
    }
}


/*
 
 func levelDictionaryFrom(level: LevelModel) -> [String : Any] {
 
 public func getTodoListSnapshot(snapshot: QuerySnapshot) {
     if !snapshot.isEmpty {
         self.todoListRows = []
         self.pendingRows = []
         self.doneRows = []
         var rowDataStructure: TodoModel
         var isDone: Bool = false
         
         for row in snapshot.documents {
             
             let rowData = row.data()
             isDone = rowData[kTODOISDONE] as? Bool ?? false
             rowDataStructure = LevelModel().levelDictionaryFrom(rowData)
             
             self.todoListRows.append(rowDataStructure)
             if (isDone) {
                 self.doneRows.append(rowDataStructure)
             } else {
                 self.pendingRows.append(rowDataStructure)
             }
         }
         self.searchResults = self.todoListRows
     }
 }
 */

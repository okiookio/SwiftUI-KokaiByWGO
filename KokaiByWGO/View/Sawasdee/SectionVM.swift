//
//  SectionVM.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-08.
//

import Foundation
import Firebase

class SectionVM: ObservableObject {
   @Published var sections: [SectionModel] = []
   @Published var sectionName: [String:String] = [:]
    
    init() {
        downloadSections()
    }
    
    func downloadSections() {
        
        FirebaseReference(.tblSection).getDocuments { (snapshot, error) in
            
            guard let snapshot = snapshot else { return }
            
            if !snapshot.isEmpty {
                self.sections = self.sectionFromDictionary(snapshot)
            }
        }
    }
    
    
    func sectionFromDictionary(_ snapshot: QuerySnapshot) -> [SectionModel] {
        
        var allSections: [SectionModel] = []
        
        for snapshot in snapshot.documents {
            
            let rowData = snapshot.data()
            
            let sectionCode = rowData["section_code"] as? String ?? ""
            self.sectionName[sectionCode] = rowData["section_name"] as? String ?? ""
            allSections.append(
                SectionModel(
                    id: UUID(),
                    level_code : rowData["level_code"] as? String ?? "",
                    chapter_code : rowData["chapter_code"] as? String ?? "",
                    section_code : rowData["section_code"] as? String ?? "",
                    order_id : rowData["order_id"] as? Int ?? 0,
                    section_group : rowData["section_group"] as? String ?? "",
                    section_name : rowData["section_name"] as? String ?? "",
                    section_descritpion : rowData["section_descritpion"] as? String ?? "",
                    column_sentence_per_row : rowData["column_sentence_per_row"] as? String ?? "",
                    image : rowData["image"] as? String ?? ""
                ) 
            )
        }
        return allSections
    }
}

//
//  ChapterVM.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-08.
//

import Foundation
import Firebase

class ChapterVM: ObservableObject {
   @Published var chapters: [ChapterModel] = []
   @Published var chapterName: [String:String] = [:]
    
    init() {
        downloadChapters()
    }
    
    func downloadChapters() {
        
        FirebaseReference(.tblChapter).getDocuments { (snapshot, error) in
            
            guard let snapshot = snapshot else { return }
            
            if !snapshot.isEmpty {
                self.chapters = self.chapterFromDictionary(snapshot)
            }
        }
    }
    
    
     func chapterFromDictionary(_ snapshot: QuerySnapshot) -> [ChapterModel] {
        
        var allChapters: [ChapterModel] = []
        
        for snapshot in snapshot.documents {
            
            let rowData = snapshot.data()
            let chapterCode = rowData["chapter_code"] as? String ?? ""
            
            self.chapterName[chapterCode] = rowData["chapter_name"] as? String ?? "" 
             
            allChapters.append(
                ChapterModel(
                    id: UUID(),
                    level_code : rowData["level_code"] as? String ?? "",
                    chapter_code : chapterCode,
                    order_id : rowData["order_id"] as? Int ?? 0,
                    chapter_name : rowData["chapter_name"] as? String ?? "",
                    chapter_desctiption : rowData["chapter_desctiption"] as? String ?? "",
                    column_chapter_per_row : rowData["column_chapter_per_row"] as? String ?? "",
                    image : rowData["image"] as? String ?? "",
                    background  : rowData["background"] as? String ?? ""
                )
            )
        }
        return allChapters
    }
}

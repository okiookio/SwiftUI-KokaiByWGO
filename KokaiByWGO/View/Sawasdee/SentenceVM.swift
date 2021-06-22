//
//  SentenceVM.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-08.
//

import Foundation
import Firebase

class SentenceVM: ObservableObject {
    @Published var sentences: [SentenceModel] = []
    @Published var sentenceName: [String:String] = [:]
    @Published var newWord: [String:String] = [:] 
    
    
    init() {
        downloadSentences()
    }
    
    func downloadSentences() {
        
        FirebaseReference(.tblSentence).getDocuments { (snapshot, error) in
            
            guard let snapshot = snapshot else { return }
            
            if !snapshot.isEmpty {
                self.sentences = self.sentenceFromDictionary(snapshot)
            }
        }
    }
    
    func newWords(){
        var allWords: [String] = []
        for sentence in sentences {
            for word in sentence.word_list {
                allWords.append(word)
                let filtered = allWords.filter { $0.contains(word) }
                
                if (filtered.isEmpty) {
                    newWord[sentence.chapter_code] = word
                }
            }
        }
        
    }
    
    
     func sentenceFromDictionary(_ snapshot: QuerySnapshot) -> [SentenceModel] {
        
        var allSentences: [SentenceModel] = []
        
        for snapshot in snapshot.documents {
            
            let rowData = snapshot.data()
            let sentenceCode = rowData["sentence_code"] as? String ?? ""
            
            self.sentenceName[sentenceCode] = rowData["sentence_name"] as? String ?? ""
             
            allSentences.append(
                SentenceModel(
                    id: UUID(),
                    sentence_id: rowData["sentence_id"] as? String ?? "",
                    level_code : rowData["level_code"] as? String ?? "",
                    chapter_code : rowData["chapter_code"] as? String ?? "",
                    section_code : rowData["section_code"] as? String ?? "",
                    sentence_code : rowData["sentence_code"] as? String ?? "",
                    order_id : rowData["order_id"] as? Int ?? 0,
                    sentence_text : rowData["sentence_name"] as? String ?? "",
                    word_list : rowData["word_list"] as? [String] ?? []
                )
            )
        }
        return allSentences
    }
}
